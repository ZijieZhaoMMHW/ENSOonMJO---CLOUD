%% Collect MJO Event
addpath('/Volumes/mydirve/cloud_annual')
load('mjo_event');
mjo_amp=[];
load('amp_full');
load('phase_full');
date_used=(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
amp_index=[];

for i=1:size(mjo_event,1);
    phase_here=phase_full(mjo_event(i,1):mjo_event(i,2));
    amp_here=amp_full(mjo_event(i,1):mjo_event(i,2));
    mjo_prop=[nansum(ismember(phase_here(amp_here>1),[1 2]))./length(phase_here(amp_here>1)) ...
       nansum(ismember(phase_here(amp_here>1),[3 4]))./length(phase_here(amp_here>1)) ...
       nansum(ismember(phase_here(amp_here>1),[5 6]))./length(phase_here(amp_here>1)) ...
       nansum(ismember(phase_here(amp_here>1),[7 8]))./length(phase_here(amp_here>1))];
    
    logic_prop=nanmin(mjo_prop)<0.1 | nanmax(mjo_prop)>0.6;
    
    if nansum(amp_full(mjo_event(i,1):mjo_event(i,2))>1)./mjo_event(i,3)>0.7 ...
            && ~logic_prop
        
    mjo_amp=[mjo_amp;mjo_event(i,:)];
    amp_index=[amp_index;i];
    end
end

load('enso_diurnal');
prop_enso=NaN(size(mjo_amp,1),3);

for i=1:size(mjo_amp,1);
    enso_here=enso_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

%% mjo hovomoller
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('hgg_ca_anom_total');
load('lon_lat_isccp.mat')
load('mjo_amp');
[lat_isccp,lon_isccp]=meshgrid(lat_isccp,lon_isccp);

hgg_ca_anom=hgg_ca_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_41_anom=hgg_ca_41_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_42_anom=hgg_ca_42_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_k_anom=hgg_ca_k_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3),4);

date_used=datevec(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));

                
for i=1:size(mjo_amp,1);
    mjo_here=mjo_amp(i,:);
    eval(['hgg_ca_k_anom_' num2str(i) '=squeeze(nanmean(hgg_ca_k_anom(:,:,mjo_here(1):mjo_here(2),:),2));'])
    eval(['hgg_ca_41_anom_' num2str(i) '=squeeze(nanmean(hgg_ca_41_anom(:,:,mjo_here(1):mjo_here(2)),2));'])
    eval(['hgg_ca_42_anom_' num2str(i) '=squeeze(nanmean(hgg_ca_42_anom(:,:,mjo_here(1):mjo_here(2)),2));'])
    eval(['hgg_ca_total_anom_' num2str(i) '=squeeze(nanmean(hgg_ca_anom(:,:,mjo_here(1):mjo_here(2)),2));'])
end

%% SOM event 
load('amp_full');load('enso_diurnal');load('phase_full');load('rmm');
load('label_som_12');
length_mjo=0;
a=[-1 0];
som_event=[];
index_here=73;

while index_here<55512
    ang=label_som(index_here);
    if length_mjo==0;
        start_here=index_here;
        length_mjo=length_mjo+1;
    elseif length_mjo>0 
        if length_mjo<=240;
            length_mjo=length_mjo+1;
        elseif ang~=8 
            length_mjo=length_mjo+1;
        elseif ang==8
            
                end_here=index_here-1;
                som_event=[som_event;start_here end_here length_mjo];
                length_mjo=0;
        end
    end
    index_here=index_here+1;
end

%% Collect SOM Event
addpath('/Volumes/mydirve/cloud_annual')
load('som_event');
load('som_results_12','label_som');
som_amp=[];
date_used=(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
amp_index=[];

i_used=1:12;
i_used=i_used(i_used~=6 & i_used~=7);

for i=1:size(som_event,1);
    label_here=label_som(som_event(i,1):som_event(i,2));
    
    label_pro=[];
    
    for j=1:10;
        label_pro=[label_pro;nansum(label_here==i_used(j))./length(label_here)];
    end
    
    if nanmin(label_pro)>0.01 && nanmax(label_pro)<=0.3 && nansum(label_pro)>=0.9
    
    som_amp=[som_amp;som_event(i,:)];
    amp_index=[amp_index;i];
    
    end

end

load('enso_diurnal');
prop_enso=NaN(size(mjo_amp,1),3);

for i=1:size(mjo_amp,1);
    enso_here=enso_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

%% SOM hovomoller
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('hgg_ca_anom_total');
load('lon_lat_isccp.mat')
load('som_amp');
[lat_isccp,lon_isccp]=meshgrid(lat_isccp,lon_isccp);

hgg_ca_anom=hgg_ca_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_41_anom=hgg_ca_41_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_42_anom=hgg_ca_42_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_k_anom=hgg_ca_k_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3),4);

date_used=datevec(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));

                
for i=1:size(som_amp,1);
    mjo_here=som_amp(i,:);
    eval(['hgg_ca_k_anom_som_' num2str(i) '=squeeze(nanmean(hgg_ca_k_anom(:,:,mjo_here(1):mjo_here(2),:),2));'])
    eval(['hgg_ca_41_anom_som_' num2str(i) '=squeeze(nanmean(hgg_ca_41_anom(:,:,mjo_here(1):mjo_here(2)),2));'])
    eval(['hgg_ca_42_anom_som_' num2str(i) '=squeeze(nanmean(hgg_ca_42_anom(:,:,mjo_here(1):mjo_here(2)),2));'])
    eval(['hgg_ca_total_anom_som_' num2str(i) '=squeeze(nanmean(hgg_ca_anom(:,:,mjo_here(1):mjo_here(2)),2));'])
end

%% SOM normalize
load('som_amp');
load('hgg_som_hovo');
load('lon_lat_isccp.mat')

for i=1:19;
    data_total=eval(['hgg_ca_total_anom_som_' num2str(i)]);
    data_k=eval(['hgg_ca_k_anom_som_' num2str(i)]);
    data_41=eval(['hgg_ca_41_anom_som_' num2str(i)]);
    data_42=eval(['hgg_ca_42_anom_som_' num2str(i)]);
    
    [y,x]=meshgrid(((1:size(data_total,2))')./size(data_total,2),lon_isccp);
    x_new=repmat(lon_isccp,1,100);
    y_new=repmat(linspace(0.01,1,100),59,1);
    
    % total
    F=scatteredInterpolant(x(:),y(:),data_total(:));
    data_total_in=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k1
    data_here=data_k(:,:,1);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,1)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k2
    data_here=data_k(:,:,2);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,2)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k3
    data_here=data_k(:,:,3);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,3)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k4
    data_here=data_k(:,:,4);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,4)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k41
    data_here=data_41(:,:);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_41_in(:,:)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k42
    data_here=data_42(:,:);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_42_in(:,:)=reshape(F(x_new(:),y_new(:)),59,100);
    
    
    eval(['hgg_ca_total_anom_in_som_' num2str(i) '=data_total_in;']);
    eval(['hgg_ca_k_anom_in_som_' num2str(i) '=data_k_in;']);
    eval(['hgg_ca_41_anom_in_som_' num2str(i) '=data_41_in;']);
    eval(['hgg_ca_42_anom_in_som_' num2str(i) '=data_42_in;']);
    
end

%% MJO normalize
load('mjo_amp');
load('hgg_hovo');
load('lon_lat_isccp.mat')

for i=1:size(mjo_amp,1);
    data_total=eval(['hgg_ca_total_anom_' num2str(i)]);
    data_k=eval(['hgg_ca_k_anom_' num2str(i)]);
    data_41=eval(['hgg_ca_41_anom_' num2str(i)]);
    data_42=eval(['hgg_ca_42_anom_' num2str(i)]);
    
    [y,x]=meshgrid(((1:size(data_total,2))')./size(data_total,2),lon_isccp);
    x_new=repmat(lon_isccp,1,100);
    y_new=repmat(linspace(0.01,1,100),59,1);
    
    % total
    F=scatteredInterpolant(x(:),y(:),data_total(:));
    data_total_in=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k1
    data_here=data_k(:,:,1);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,1)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k2
    data_here=data_k(:,:,2);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,2)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k3
    data_here=data_k(:,:,3);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,3)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k4
    data_here=data_k(:,:,4);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_k_in(:,:,4)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k41
    data_here=data_41(:,:);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_41_in(:,:)=reshape(F(x_new(:),y_new(:)),59,100);
    
    % k42
    data_here=data_42(:,:);
    F=scatteredInterpolant(x(:),y(:),data_here(:));
    data_42_in(:,:)=reshape(F(x_new(:),y_new(:)),59,100);
    
    
    eval(['hgg_ca_total_anom_in_' num2str(i) '=data_total_in;']);
    eval(['hgg_ca_k_anom_in_' num2str(i) '=data_k_in;']);
    eval(['hgg_ca_41_anom_in_' num2str(i) '=data_41_in;']);
    eval(['hgg_ca_42_anom_in_' num2str(i) '=data_42_in;']);
    
end

%% MJO average
load('hgg_hovo_in');
load('mjo_amp');
load('lon_lat_isccp.mat')
mjo_total=NaN(59,100,25);
mjo_k=NaN(59,100,4,25);
mjo_41=NaN(59,100,25);
mjo_42=NaN(59,100,25);

for i=1:25;
    mjo_total(:,:,i)=eval(['hgg_ca_total_anom_in_' num2str(i)]);
    mjo_k(:,:,:,i)=eval(['hgg_ca_k_anom_in_' num2str(i)]);
    mjo_41(:,:,i)=eval(['hgg_ca_41_anom_in_' num2str(i)]);
    mjo_42(:,:,i)=eval(['hgg_ca_42_anom_in_' num2str(i)]);
end

% full average
mjo_total_av=nanmean(mjo_total,3);
mjo_k_av=nanmean(mjo_k,4);
mjo_41_av=nanmean(mjo_41,3);
mjo_42_av=nanmean(mjo_42,3);

load('enso_diurnal');
prop_enso=NaN(size(mjo_amp,1),3);

for i=1:size(mjo_amp,1);
    enso_here=enso_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

% enso+ average
[~,ind]=nanmax(prop_enso,[],2);
mjo_total_av_e=nanmean(mjo_total(:,:,ind==1),3);
mjo_k_av_e=nanmean(mjo_k(:,:,ind==1),4);
mjo_41_av_e=nanmean(mjo_41(:,:,ind==1),3);
mjo_42_av_e=nanmean(mjo_42(:,:,ind==1),3);

% enso- average
[~,ind]=nanmax(prop_enso,[],2);
mjo_total_av_l=nanmean(mjo_total(:,:,ind==2),3);
mjo_k_av_l=nanmean(mjo_k(:,:,ind==2),4);
mjo_41_av_l=nanmean(mjo_41(:,:,ind==2),3);
mjo_42_av_l=nanmean(mjo_42(:,:,ind==2),3);

%% SOM average
load('colormap_nature');
load('hgg_hovo_in_som');
load('som_amp');
mjo_total=NaN(59,100,19);
mjo_k=NaN(59,100,4,19);
mjo_41=NaN(59,100,19);
mjo_42=NaN(59,100,19);

for i=1:19;
    mjo_total(:,:,i)=eval(['hgg_ca_total_anom_in_som_' num2str(i)]);
    mjo_k(:,:,:,i)=eval(['hgg_ca_k_anom_in_som_' num2str(i)]);
    mjo_41(:,:,i)=eval(['hgg_ca_41_anom_in_som_' num2str(i)]);
    mjo_42(:,:,i)=eval(['hgg_ca_42_anom_in_som_' num2str(i)]);
end

% full average
mjo_total_av=nanmean(mjo_total,3);
mjo_k_av=nanmean(mjo_k,4);
mjo_41_av=nanmean(mjo_41,3);
mjo_42_av=nanmean(mjo_42,3);

load('enso_diurnal');
prop_enso=NaN(size(som_amp,1),3);

for i=1:size(som_amp,1);
    enso_here=enso_used(som_amp(i,1):som_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

% enso+ average
[~,ind]=nanmax(prop_enso,[],2);
mjo_total_av_e=nanmean(mjo_total(:,:,ind==1),3);
mjo_k_av_e=nanmean(mjo_k(:,:,ind==1),4);
mjo_41_av_e=nanmean(mjo_41(:,:,ind==1),3);
mjo_42_av_e=nanmean(mjo_42(:,:,ind==1),3);

% enso- average
[~,ind]=nanmax(prop_enso,[],2);
mjo_total_av_l=nanmean(mjo_total(:,:,ind==2),3);
mjo_k_av_l=nanmean(mjo_k(:,:,ind==2),4);
mjo_41_av_l=nanmean(mjo_41(:,:,ind==2),3);
mjo_42_av_l=nanmean(mjo_42(:,:,ind==2),3);

%% drawing
figure('pos',[10 10 1500 1500]);
h=tight_subplot(2,4,[0.02 0.01],[0.05 0.05],[0.1 0.1]);

% axes(h(1));
% rmm1_here=rmm1_full(mjo_here(1):mjo_here(2));
% rmm2_here=rmm2_full(mjo_here(1):mjo_here(2));
% enso_here=enso_used(mjo_here(1):mjo_here(2));
% 
% plot(rmm1_here(enso_here>0.5),rmm2_here(enso_here>0.5),'r','linewidth',2)
% hold on
% plot(rmm1_here(enso_here<-0.5),rmm2_here(enso_here<-0.5),'b','linewidth',2)
% hold on
% plot(rmm1_here(enso_here>=-0.5 & enso_here<=0.5),rmm2_here(enso_here>=-0.5 & enso_here<=0.5),'k','linewidth',2)
% hold on
% text(rmm1_full(mjo_here(1)),rmm2_full(mjo_here(1)),'start');
% hold on
% plot(x,y,'k','linewidth',2);
% hold on
% plot([lin1x(:) lin2x(:) lin3x(:) lin4x(:) lin5x(:) lin6x(:) lin7x(:) flipud(lin8x(:))],...
%     [lin1y(:) lin2y(:) lin3y(:) flipud(lin4y(:)) lin5y(:) lin6y(:) lin7y(:) lin8y(:)],'k','linewidth',2);
% hold on
% text(rmm1_full(mjo_here(2)),rmm2_full(mjo_here(2)),'end');
% xlim([-4 4]);
% ylim([-4 4]);

axes(h(2));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_total_av_e)',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
set(gca,'xtick',[],'ytick',[]);
colormap(colormap_nature);
set(gca,'fontsize',16);

axes(h(3));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_k_av_e(:,:,2))',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
set(gca,'xtick',[],'ytick',[]);
colormap(colormap_nature);
set(gca,'fontsize',16);

axes(h(4));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_k_av_e(:,:,3))',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
set(gca,'xtick',[],'ytick',[]);
colormap(colormap_nature);
set(gca,'fontsize',16);

axes(h(5));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_k_av_e(:,:,4))',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
colormap(colormap_nature);
set(gca,'fontsize',16);

axes(h(6));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_41_av_e(:,:))',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
set(gca,'xtick',[],'ytick',[]);
colormap(colormap_nature);
set(gca,'fontsize',16);

axes(h(7));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_42_av_e(:,:))',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
set(gca,'xtick',[],'ytick',[]);
colormap(colormap_nature);
set(gca,'fontsize',16);

axes(h(8));
contourf(lon_isccp,(0.01:0.01:1)',(mjo_total_av_e(:,:))',...
    linspace(-100,100,500),'linestyle','none');
caxis([-80 80]);
set(gca,'xtick',[],'ytick',[]);
colormap(colormap_nature);
set(gca,'fontsize',16);

%% mjo amp days dist
load('mjo_amp');
mjo_dist=NaN(size(mjo_amp,1),8);
load('phase_full');
for i=1:size(mjo_amp,1);
    mjo_here=mjo_amp(i,:);
    phase_here=phase_full(mjo_here(1):mjo_here(2));
    
    for j=1:8;
        mjo_dist(i,j)=nansum(phase_here==j);
    end
end
 mjo_dist_36=nansum(mjo_dist(:,3:6),2);
load('enso_diurnal');
prop_enso=NaN(size(mjo_amp,1),3);

for i=1:size(mjo_amp,1);
    enso_here=enso_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

[~,ind]=nanmax(prop_enso,[],2);


%% SOM amp days dist
load('som_amp');
mjo_dist=NaN(size(mjo_amp,1),12);
load('phase_full');
used_index=[3 2 1 5 9 10];
for i=1:size(som_amp,1);
    mjo_here=som_amp(i,:);
    phase_here=label(mjo_here(1):mjo_here(2));
    
    for j=1:8;
        mjo_dist(i,j)=nansum(phase_here==j);
    end
end
 mjo_dist_36=nansum(mjo_dist(:,3:6),2);
load('enso_diurnal');
prop_enso=NaN(size(mjo_amp,1),3);

for i=1:size(mjo_amp,1);
    enso_here=enso_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

[~,ind]=nanmax(prop_enso,[],2);

    
    
