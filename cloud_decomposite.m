load('hgg_ca_anom_total');
date_used=[];
for i=1997:2015;
date_used=[date_used;datevec(datenum(i,1,1):1/8:(datenum(i,12,31)+7/8))];
end

date_daily=datevec(datenum(1997,1,1):datenum(2015,12,31));
hgg_ca_daily_anom=NaN(59,19,6939);

for i=1:size(date_daily,1);
    index_here=date_used(:,1)==date_daily(i,1) & ... 
        date_used(:,2)==date_daily(i,2) & ...
        date_used(:,3)==date_daily(i,3);
    hgg_ca_daily_anom(:,:,i)=nanmean(hgg_ca_anom(:,:,index_here),3);
end

save hgg_ca_daily_anom hgg_ca_daily_anom

%% decomposite - all
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_ca_daily_anom');
addpath('/Volumes/mydirve/cloud_annual');
load('enso_diurnal');
load('rmm');
load('phase_full');
phase_full=phase_full(:);
phase_full=phase_full(1:8:end);

enso_used=enso_used(1:8:end);
rmm1_full=rmm1_full(1:8:end);
rmm2_full=rmm2_full(1:8:end);

hgg_enso=NaN(size(hgg_ca_daily_anom));

hgg_rmm=NaN(size(hgg_ca_daily_anom));

hgg_enso1=NaN(size(hgg_ca_daily_anom));

hgg_enso2=NaN(size(hgg_ca_daily_anom));

hgg_null=NaN(size(hgg_ca_daily_anom));

for i=1:size(hgg_ca_daily_anom,1);
    tic
    for j=1:size(hgg_ca_daily_anom,2);
            
            rh_here=squeeze(hgg_ca_daily_anom(i,j,:));
            [b,bint,~,~,stats] = regress(rh_here,[ones(length(enso_used),1) enso_used rmm1_full rmm2_full enso_used.*rmm1_full ...
                enso_used.*rmm2_full]);
            hgg_enso(i,j,:)=b(2).*enso_used;
            hgg_rmm(i,j,:)=b(3).*rmm1_full+b(4).*rmm2_full;
            hgg_enso1(i,j,:)=b(5).*rmm1_full.*enso_used;
            hgg_enso2(i,j,:)=b(6).*rmm2_full.*enso_used;
            hgg_null(i,j,:)=rh_here - squeeze(hgg_enso(i,j,:)) ...
                - squeeze(hgg_rmm(i,j,:)) - squeeze(hgg_enso1(i,j,:)) - ...
                squeeze(hgg_enso2(i,j,:));
            rsq(i,j)=stats(1);
        
    end
    toc
end

save hgg_decomposite *_enso *_rmm *_enso1 *_enso2 *_null

%% decomposite - k
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_ca_k_anom_d');
addpath('/Volumes/mydirve/cloud_annual');
load('enso_diurnal');
load('rmm');
load('phase_full');
phase_full=phase_full(:);
phase_full=phase_full(1:8:end);

rsq=NaN(59,19,4);

enso_used=enso_used(1:8:end);
rmm1_full=rmm1_full(1:8:end);
rmm2_full=rmm2_full(1:8:end);

hgg_enso=NaN(size(hgg_ca_k_anom_d));

hgg_rmm=NaN(size(hgg_ca_k_anom_d));

hgg_enso1=NaN(size(hgg_ca_k_anom_d));

hgg_enso2=NaN(size(hgg_ca_k_anom_d));

for i=1:size(hgg_ca_k_anom_d,1);
    tic
    for j=1:size(hgg_ca_k_anom_d,2);
        for k=1:4;
            
            rh_here=squeeze(hgg_ca_k_anom_d(i,j,:,k));
            [b,bint,~,~,stats] = regress(rh_here,[ones(length(enso_used),1) enso_used rmm1_full rmm2_full enso_used.*rmm1_full ...
                enso_used.*rmm2_full]);
            hgg_enso(i,j,:,k)=b(2).*enso_used;
            hgg_rmm(i,j,:,k)=b(3).*rmm1_full+b(4).*rmm2_full;
            hgg_enso1(i,j,:,k)=b(5).*rmm1_full.*enso_used;
            hgg_enso2(i,j,:,k)=b(6).*rmm2_full.*enso_used;
            hgg_null(i,j,:,k)=rh_here - squeeze(hgg_enso(i,j,:,k)) ...
                - squeeze(hgg_rmm(i,j,:,k)) - squeeze(hgg_enso1(i,j,:,k)) - ...
                squeeze(hgg_enso2(i,j,:,k));
            
            rsq(i,j,k)=stats(1);
        end
        
    end
    toc
end

save hgg_decomposite_k *_enso *_rmm *_enso1 *_enso2 *_null

%% 
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_decomposite');
load('enso_diurnal');
load('rmm');
load('phase_full')
phase_full=phase_full(:);
phase_full=phase_full(1:8:end);

enso_used=enso_used(1:8:end);
rmm1_full=rmm1_full(1:8:end);
rmm2_full=rmm2_full(1:8:end);

load('amp_full');
amp_full=amp_full(1:8:end);

hgg_ensormm=hgg_enso1+hgg_enso2;

hgg_ensormm_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8,3);
hgg_enso_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8,3);
hgg_rmm_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8,3);
hgg_null_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8,3);

for i=1:8;
    hgg_ensormm_p(:,:,i,1)=nanmean(hgg_ensormm(:,:,phase_full==i & amp_full>1 & enso_used>0.5),3);
    hgg_ensormm_p(:,:,i,2)=nanmean(hgg_ensormm(:,:,phase_full==i & amp_full>1 & enso_used<-0.5),3);
    hgg_ensormm_p(:,:,i,3)=nanmean(hgg_ensormm(:,:,phase_full==i & amp_full>1 & enso_used>=-0.5 & enso_used<=0.5),3);
    
    hgg_enso_p(:,:,i,1)=nanmean(hgg_enso(:,:,phase_full==i & amp_full>1 & enso_used>0.5),3);
    hgg_enso_p(:,:,i,2)=nanmean(hgg_enso(:,:,phase_full==i & amp_full>1 & enso_used<-0.5),3);
    hgg_enso_p(:,:,i,3)=nanmean(hgg_enso(:,:,phase_full==i & amp_full>1 & enso_used>=-0.5 & enso_used<=0.5),3);
    
    hgg_rmm_p(:,:,i,1)=nanmean(hgg_rmm(:,:,phase_full==i & amp_full>1 & enso_used>0.5),3);
    hgg_rmm_p(:,:,i,2)=nanmean(hgg_rmm(:,:,phase_full==i & amp_full>1 & enso_used<-0.5),3);
    hgg_rmm_p(:,:,i,3)=nanmean(hgg_rmm(:,:,phase_full==i & amp_full>1 & enso_used>=-0.5 & enso_used<=0.5),3);
    
    hgg_null_p(:,:,i,1)=nanmean(hgg_null(:,:,phase_full==i & amp_full>1 & enso_used>0.5),3);
    hgg_null_p(:,:,i,2)=nanmean(hgg_null(:,:,phase_full==i & amp_full>1 & enso_used<-0.5),3);
    hgg_null_p(:,:,i,3)=nanmean(hgg_null(:,:,phase_full==i & amp_full>1 & enso_used>=-0.5 & enso_used<=0.5),3);

end
    
save hgg_decomposite_plot *_p

%% hgg - k - daily
load('hgg_ca_k_anom');
date_used=datevec(datenum(1997,1,1):1/8:(datenum(2015,12,31)+7/8));

date_daily=unique(date_used(:,1:3),'rows');

hgg_ca_k_anom_d=NaN(59,19,55512./8,4);

for i=1:size(date_daily,1);
    index_here=date_used(:,1)==date_daily(i,1) & ...
        date_used(:,2)==date_daily(i,2) & ...
        date_used(:,3)==date_daily(i,3);
    hgg_ca_k_anom_d(:,:,i,:)=squeeze(nanmean(hgg_ca_k_anom(:,:,index_here,:),3));
end


%% RMM ENSO variability
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
load('amp_full');
load('enso_diurnal');
load('phase_full');
phase_full=phase_full(:);

amp_full=amp_full(1:8:end);
enso_used=enso_used(1:8:end);
phase_full=phase_full(1:8:end);

load('hgg_decomposite_k');

hgg_ensormm=hgg_enso1+hgg_enso2;

hgg_enso_rmm=NaN(59,19,8,4,3);
hgg_rmm_rmm=NaN(59,19,8,4,3);
hgg_ensormm_rmm=NaN(59,19,8,4,3);
hgg_null_rmm=NaN(59,19,8,4,3);

for i=1:8;
    hgg_enso_rmm(:,:,i,:,1)=squeeze(nanmean(hgg_enso(:,:,amp_full>1 & phase_full==i & ...
        enso_used>0.5,:),3));
    hgg_enso_rmm(:,:,i,:,2)=squeeze(nanmean(hgg_enso(:,:,amp_full>1 & phase_full==i & ...
        enso_used<-0.5,:),3));
    hgg_enso_rmm(:,:,i,:,3)=squeeze(nanmean(hgg_enso(:,:,amp_full>1 & phase_full==i & ...
        enso_used>=-0.5 & enso_used<=0.5,:),3));
    
    hgg_rmm_rmm(:,:,i,:,1)=squeeze(nanmean(hgg_rmm(:,:,amp_full>1 & phase_full==i & ...
        enso_used>0.5,:),3));
    hgg_rmm_rmm(:,:,i,:,2)=squeeze(nanmean(hgg_rmm(:,:,amp_full>1 & phase_full==i & ...
        enso_used<-0.5,:),3));
    hgg_rmm_rmm(:,:,i,:,3)=squeeze(nanmean(hgg_rmm(:,:,amp_full>1 & phase_full==i & ...
        enso_used>=-0.5 & enso_used<=0.5,:),3));
    
    hgg_ensormm_rmm(:,:,i,:,1)=squeeze(nanmean(hgg_ensormm(:,:,amp_full>1 & phase_full==i & ...
        enso_used>0.5,:),3));
    hgg_ensormm_rmm(:,:,i,:,2)=squeeze(nanmean(hgg_ensormm(:,:,amp_full>1 & phase_full==i & ...
        enso_used<-0.5,:),3));
    hgg_ensormm_rmm(:,:,i,:,3)=squeeze(nanmean(hgg_ensormm(:,:,amp_full>1 & phase_full==i & ...
        enso_used>=-0.5 & enso_used<=0.5,:),3));
    
    hgg_null_rmm(:,:,i,:,1)=squeeze(nanmean(hgg_null(:,:,amp_full>1 & phase_full==i & ...
        enso_used>0.5,:),3));
    hgg_null_rmm(:,:,i,:,2)=squeeze(nanmean(hgg_null(:,:,amp_full>1 & phase_full==i & ...
        enso_used<-0.5,:),3));
    hgg_null_rmm(:,:,i,:,3)=squeeze(nanmean(hgg_null(:,:,amp_full>1 & phase_full==i & ...
        enso_used>=-0.5 & enso_used<=0.5,:),3));
end

save hgg_decomposite_ensormm *_rmm

%% RMM - MJO only k
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
load('amp_full');
load('enso_diurnal');
load('phase_full');
phase_full=phase_full(:);

amp_full=amp_full(1:8:end);
enso_used=enso_used(1:8:end);
phase_full=phase_full(1:8:end);

load('hgg_decomposite_k');

hgg_ensormm=hgg_enso1+hgg_enso2;

hgg_enso_rmm=NaN(59,19,8,4);
hgg_rmm_rmm=NaN(59,19,8,4);
hgg_ensormm_rmm=NaN(59,19,8,4);
hgg_null_rmm=NaN(59,19,8,4);

for i=1:8;
    hgg_enso_rmm(:,:,i,:)=squeeze(nanmean(hgg_enso(:,:,amp_full>1 & phase_full==i ...
        ,:),3));
    
    hgg_rmm_rmm(:,:,i,:)=squeeze(nanmean(hgg_rmm(:,:,amp_full>1 & phase_full==i ...
        ,:),3));
    
    hgg_ensormm_rmm(:,:,i,:)=squeeze(nanmean(hgg_ensormm(:,:,amp_full>1 & phase_full==i ...
        ,:),3));
    
    hgg_null_rmm(:,:,i,:)=squeeze(nanmean(hgg_null(:,:,amp_full>1 & phase_full==i ...
        ,:),3));
end

save hgg_decomposite_ensormm_k_only_mjo  *_rmm

%% RMM - MJO only total
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_decomposite');
load('enso_diurnal');
load('rmm');
load('phase_full')
phase_full=phase_full(:);
phase_full=phase_full(1:8:end);

enso_used=enso_used(1:8:end);
rmm1_full=rmm1_full(1:8:end);
rmm2_full=rmm2_full(1:8:end);

load('amp_full');
amp_full=amp_full(1:8:end);

hgg_ensormm=hgg_enso1+hgg_enso2;

hgg_ensormm_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8);
hgg_enso_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8);
hgg_rmm_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8);
hgg_null_p=NaN(size(hgg_enso,1),size(hgg_enso,2),8);

for i=1:8;
    hgg_ensormm_p(:,:,i)=nanmean(hgg_ensormm(:,:,phase_full==i & amp_full>1),3);
    
    hgg_enso_p(:,:,i)=nanmean(hgg_enso(:,:,phase_full==i & amp_full>1),3);
    
    hgg_rmm_p(:,:,i)=nanmean(hgg_rmm(:,:,phase_full==i & amp_full>1),3);
    
    hgg_null_p(:,:,i)=nanmean(hgg_null(:,:,phase_full==i & amp_full>1),3);
end
    
save hgg_decomposite_ensormm_total_only_mjo *_p

%% RMM - enso only k
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
load('amp_full');
load('enso_diurnal');
load('phase_full');
phase_full=phase_full(:);

amp_full=amp_full(1:8:end);
enso_used=enso_used(1:8:end);
phase_full=phase_full(1:8:end);

load('hgg_decomposite_k');

hgg_ensormm=hgg_enso1+hgg_enso2;

hgg_enso_enso=NaN(59,19,3,4);
hgg_rmm_enso=NaN(59,19,3,4);
hgg_ensormm_enso=NaN(59,19,3,4);
hgg_null_enso=NaN(59,19,3,4);


hgg_enso_enso(:,:,1,:)=squeeze(nanmean(hgg_enso(:,:,enso_used>0.5 ...
    ,:),3));
hgg_enso_enso(:,:,2,:)=squeeze(nanmean(hgg_enso(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_enso_enso(:,:,3,:)=squeeze(nanmean(hgg_enso(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

hgg_rmm_enso(:,:,1,:)=squeeze(nanmean(hgg_rmm(:,:,enso_used>0.5 ...
    ,:),3));
hgg_rmm_enso(:,:,2,:)=squeeze(nanmean(hgg_rmm(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_rmm_enso(:,:,3,:)=squeeze(nanmean(hgg_rmm(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

hgg_ensormm_enso(:,:,1,:)=squeeze(nanmean(hgg_ensormm(:,:,enso_used>0.5 ...
    ,:),3));
hgg_ensormm_enso(:,:,2,:)=squeeze(nanmean(hgg_ensormm(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_ensormm_enso(:,:,3,:)=squeeze(nanmean(hgg_ensormm(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

hgg_null_enso(:,:,1,:)=squeeze(nanmean(hgg_null(:,:,enso_used>0.5 ...
    ,:),3));
hgg_null_enso(:,:,2,:)=squeeze(nanmean(hgg_null(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_null_enso(:,:,3,:)=squeeze(nanmean(hgg_null(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));


save hgg_decomposite_ensormm_k_only_enso  *_enso

%% RMM - enso only total
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_decomposite');
load('enso_diurnal');
load('rmm');
load('phase_full')
phase_full=phase_full(:);
phase_full=phase_full(1:8:end);

enso_used=enso_used(1:8:end);
rmm1_full=rmm1_full(1:8:end);
rmm2_full=rmm2_full(1:8:end);

load('amp_full');
amp_full=amp_full(1:8:end);

hgg_ensormm=hgg_enso1+hgg_enso2;

hgg_enso_p(:,:,1,:)=squeeze(nanmean(hgg_enso(:,:,enso_used>0.5 ...
    ,:),3));
hgg_enso_p(:,:,2,:)=squeeze(nanmean(hgg_enso(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_enso_p(:,:,3,:)=squeeze(nanmean(hgg_enso(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

hgg_rmm_p(:,:,1,:)=squeeze(nanmean(hgg_rmm(:,:,enso_used>0.5 ...
    ,:),3));
hgg_rmm_p(:,:,2,:)=squeeze(nanmean(hgg_rmm(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_rmm_p(:,:,3,:)=squeeze(nanmean(hgg_rmm(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

hgg_ensormm_p(:,:,1,:)=squeeze(nanmean(hgg_ensormm(:,:,enso_used>0.5 ...
    ,:),3));
hgg_ensormm_p(:,:,2,:)=squeeze(nanmean(hgg_ensormm(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_ensormm_p(:,:,3,:)=squeeze(nanmean(hgg_ensormm(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

hgg_null_p(:,:,1,:)=squeeze(nanmean(hgg_null(:,:,enso_used>0.5 ...
    ,:),3));
hgg_null_p(:,:,2,:)=squeeze(nanmean(hgg_null(:,:,enso_used<-0.5 ...
    ,:),3));
hgg_null_p(:,:,3,:)=squeeze(nanmean(hgg_null(:,:,enso_used>=-0.5 & enso_used<=0.5 ...
    ,:),3));

save hgg_decomposite_ensormm_total_only_enso *_p









