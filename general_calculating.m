%% anomaly total 
load('hgg_ca_k_total');
hgg_ca_total=nansum(hgg_ca_k_total,4);
clear hgg_ca_k_total

date_used=datevec(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
y_m_d_h=unique(date_used(:,2:4),'rows');

hgg_ca_anom=NaN(size(hgg_ca_total));

for i=1:size(y_m_d_h,1);
    tic
    idx_here=date_used(:,2)==y_m_d_h(i,1) & date_used(:,3)==y_m_d_h(i,2) & ...
        date_used(:,4)==y_m_d_h(i,3);
    hgg_ca_anom(:,:,idx_here)=hgg_ca_total(:,:,idx_here)-...
        repmat(nanmean(hgg_ca_total(:,:,idx_here),3),1,1,nansum(idx_here));
    toc
end

%% enso mean
enso=csvread('ENSO_year_index.csv');
enso=enso(enso(:,1)<=2015 & enso(:,1)>=1997,:);
enso_line=[];
for i=1:19;
    enso_here=enso(i,2:end);
    enso_line=[enso_line;[repmat(enso(i,1),12,1) (1:12)' enso_here(:)]];
end

date_used=datevec(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));

enso_used=NaN(size(date_used,1),1);

for i=1:size(enso_line,1);
    index_here=date_used(:,1)==enso_line(i,1) & date_used(:,2)==enso_line(i,2);
    enso_used(index_here,:)=enso_line(i,3);
end

% enso anomaly
load('hgg_ca_anom_total');
load('hgg_ca_k_anom');
load('enso_diurnal');

hgg_ca_anom_enso_full=NaN(59,19,3,5);

% el
hgg_ca_anom_enso_full(:,:,1,1:4)=nanmean(hgg_ca_k_anom(:,:,enso_used>0.5,:),3);
hgg_ca_anom_enso_full(:,:,1,end)=nanmean(hgg_ca_anom(:,:,enso_used>0.5),3);

% la
hgg_ca_anom_enso_full(:,:,2,1:4)=nanmean(hgg_ca_k_anom(:,:,enso_used<-0.5,:),3);
hgg_ca_anom_enso_full(:,:,2,end)=nanmean(hgg_ca_anom(:,:,enso_used<-0.5),3);

% ne
hgg_ca_anom_enso_full(:,:,3,1:4)=nanmean(hgg_ca_k_anom(:,:,(enso_used>=-0.5 & enso_used<=0.5),:),3);
hgg_ca_anom_enso_full(:,:,3,end)=nanmean(hgg_ca_anom(:,:,(enso_used>=-0.5 & enso_used<=0.5)),3);

%% MJO mean
phase=double(ncread('phase.nc','phase'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
end

% mjo anomaly

load('hgg_ca_anom_total');
load('hgg_ca_k_anom');
load('phase_full');

hgg_ca_anom_mjo_full=NaN(59,19,4,5);

% 8 - 1
hgg_ca_anom_mjo_full(:,:,1,1:4)=nanmean(hgg_ca_k_anom(:,:,phase_full==8 | phase_full==1,:),3);
hgg_ca_anom_mjo_full(:,:,1,end)=nanmean(hgg_ca_anom(:,:,phase_full==8 | phase_full==1),3);

% 2 - 3
hgg_ca_anom_mjo_full(:,:,2,1:4)=nanmean(hgg_ca_k_anom(:,:,phase_full==2 | phase_full==3,:),3);
hgg_ca_anom_mjo_full(:,:,2,end)=nanmean(hgg_ca_anom(:,:,phase_full==2 | phase_full==3),3);

% 4 - 5 
hgg_ca_anom_mjo_full(:,:,3,1:4)=nanmean(hgg_ca_k_anom(:,:,phase_full==4 | phase_full==5,:),3);
hgg_ca_anom_mjo_full(:,:,3,end)=nanmean(hgg_ca_anom(:,:,phase_full==4 | phase_full==5),3);

% 6 - 7
hgg_ca_anom_mjo_full(:,:,4,1:4)=nanmean(hgg_ca_k_anom(:,:,phase_full==6 | phase_full==7,:),3);
hgg_ca_anom_mjo_full(:,:,4,end)=nanmean(hgg_ca_anom(:,:,phase_full==6 | phase_full==7),3);

%% amp MJO ENSO

% MJO
load('amp_cloud');
phase=double(ncread('phase.nc','phase'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
amp_cloud_k_MJO=NaN(59,19,4,4);
amp_cloud_total_MJO=NaN(59,19,4);

amp_cloud_k_mean=squeeze(nanmean(amp_cloud_k,3));
amp_cloud_total_mean=squeeze(nanmean(amp_cloud_total,3));

amp_cloud_k_MJO(:,:,1,:)=nanmean(amp_cloud_k(:,:,phase==8 | phase==1,:),3);
amp_cloud_k_MJO(:,:,2,:)=nanmean(amp_cloud_k(:,:,phase==2 | phase==3,:),3);
amp_cloud_k_MJO(:,:,3,:)=nanmean(amp_cloud_k(:,:,phase==4 | phase==5,:),3);
amp_cloud_k_MJO(:,:,4,:)=nanmean(amp_cloud_k(:,:,phase==6 | phase==7,:),3);

amp_cloud_total_MJO(:,:,1)=nanmean(amp_cloud_total(:,:,phase==8 | phase==1),3);
amp_cloud_total_MJO(:,:,2)=nanmean(amp_cloud_total(:,:,phase==2 | phase==3),3);
amp_cloud_total_MJO(:,:,3)=nanmean(amp_cloud_total(:,:,phase==4 | phase==5),3);
amp_cloud_total_MJO(:,:,4)=nanmean(amp_cloud_total(:,:,phase==6 | phase==7),3);

% ENSO
load('amp_cloud');
load('enso_diurnal');
enso_day=NaN(length(enso_used)./8,1);

for i=1:(length(enso_used)./8)
    enso_day(i)=enso_used(1+(i-1)*8);
end

amp_cloud_k_mean=squeeze(nanmean(amp_cloud_k,3));
amp_cloud_total_mean=squeeze(nanmean(amp_cloud_total,3));

amp_cloud_k_ENSO=NaN(59,19,3,4);
amp_cloud_total_ENSO=NaN(59,19,3);

amp_cloud_k_ENSO(:,:,1,:)=nanmean(amp_cloud_k(:,:,enso_day>0.5,:),3);
amp_cloud_k_ENSO(:,:,2,:)=nanmean(amp_cloud_k(:,:,enso_day<-0.5,:),3);
amp_cloud_k_ENSO(:,:,3,:)=nanmean(amp_cloud_k(:,:,enso_day<=0.5 & enso_day>=-0.5,:),3);

amp_cloud_total_ENSO(:,:,1)=nanmean(amp_cloud_total(:,:,enso_day>0.5),3);
amp_cloud_total_ENSO(:,:,2)=nanmean(amp_cloud_total(:,:,enso_day<-0.5),3);
amp_cloud_total_ENSO(:,:,3)=nanmean(amp_cloud_total(:,:,enso_day<=0.5 & enso_day>=-0.5),3);

%% precipitation MJO
load('precip_trmm_anom');
load('phase_full');
phase_full=phase_full(2929:end);

precip_anom_mjo=NaN(73,233,4);

precip_anom_mjo(:,:,1)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[8 1])),3);
precip_anom_mjo(:,:,2)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[2 3])),3);
precip_anom_mjo(:,:,3)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[4 5])),3);
precip_anom_mjo(:,:,4)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[6 7])),3);

%% precipitation ENSO
load('enso_diurnal');
enso_used=enso_used(2929:end);

precip_anom_enso=NaN(73,233,3);

precip_anom_enso(:,:,1)=nanmean(precip_trmm_anom(:,:,enso_used>0.5),3);
precip_anom_enso(:,:,2)=nanmean(precip_trmm_anom(:,:,enso_used<-0.5),3);
precip_anom_enso(:,:,3)=nanmean(precip_trmm_anom(:,:,enso_used>=-0.5 & enso_used<=0.5),3);

%% Cloud monthly
load('hgg_ca_k_total.mat');
hgg_ca_total=nansum(hgg_ca_k_total,4);
load('hgg_ca_4142_sum.mat');
date_used=datevec(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
hgg_ca_k_12=NaN(59,19,12,4);
hgg_ca_41_12=NaN(59,19,12);
hgg_ca_42_12=NaN(59,19,12);
hgg_ca_total_12=NaN(59,19,12);
for i=1:12;
    hgg_ca_k_12(:,:,i,:)=nanmean(hgg_ca_k_total(:,:,date_used(:,2)==i,:),3);
    hgg_ca_41_12(:,:,i)=nanmean(hgg_ca_41(:,:,date_used(:,2)==i),3);
    hgg_ca_42_12(:,:,i)=nanmean(hgg_ca_42(:,:,date_used(:,2)==i),3);
    hgg_ca_total_12(:,:,i)=nanmean(hgg_ca_total(:,:,date_used(:,2)==i),3);
end





