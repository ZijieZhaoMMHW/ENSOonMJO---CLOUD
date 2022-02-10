%% aMJO omi 1-8
load('colormap_nature');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('hgg_ca_omi_18');
load('lon_lat_isccp');
lon_used=lon(lon_index);
lat_used=lat(lat_index);
load('colormap_nature');

m_proj('miller','lon',[nanmin(lon_used) nanmax(lon_used)],'lat',[nanmin(lat_used) nanmax(lat_used)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,7,[0.01 0.01],[0.05 0.05],[0.03 0.1]);

title_full={'K1','K2','K3','K4','K4 - 1','K4 - 2','Total'};

for i=1:8
    text_here=['Phase ' num2str(i)];
    
    axes(h((i-1)*7+1));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_full(:,:,i,1))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    m_text(100,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{1},'fontsize',16,'fontweight','bold');
    end
    
    axes(h((i-1)*7+2));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_full(:,:,i,2))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{2},'fontsize',16,'fontweight','bold');
    end
    
    axes(h((i-1)*7+3));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_full(:,:,i,3))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{3},'fontsize',16,'fontweight','bold');
    end
    
    axes(h((i-1)*7+4));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_full(:,:,i,4))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{4},'fontsize',16,'fontweight','bold');
    end
    
    axes(h((i-1)*7+5));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_41(:,:,i))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{5},'fontsize',16,'fontweight','bold');
    end
    
    axes(h((i-1)*7+6));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_42(:,:,i))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{6},'fontsize',16,'fontweight','bold');
    end
    
    axes(h((i-1)*7+7));
    m_contourf(lon_used,lat_used,(hgg_ca_anom_mjo_full(:,:,i,5))',linspace(-20,20,100),'linestyle','none');
    m_coast('linewidth',2,'color','k');
    m_grid('xtick',[],'ytick',[]);
    caxis([-15 15]);
    colormap(colormap_nature);
    if i==1;
        title(title_full{7},'fontsize',16,'fontweight','bold');
    end
    
end

hp4=get(h(56),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% aMJO omi 1 - 8
load('colormap_nature');
load('lon_lat_isccp.mat')
load('amp_omi_18');
full_range=linspace(0,100,200);
mjo_range=linspace(-30,30,200);

full_color=[0 80];
mjo_color=[-20 20];

text_used={'Clim','Phase 1','Phase 2','Phase 3','Phase 4','Phase 5','Phase 6',...
    'Phase 7','Phase 8'};

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(9,7,[0.01 0.01],[0.05 0.05],[0.03 0.1]);

for i=1:9;
    if i==1;
       axes(h((i-1)*7+1));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_mean(:,:,1))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+1),jet);
       caxis(full_color);
       m_text(100,-10,text_used{i},'fontsize',16,'fontweight','bold');
       title('K1','fontsize',14,'fontweight','bold');
       
       axes(h((i-1)*7+2));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_mean(:,:,2))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+2),jet);
       caxis(full_color);
       title('K2','fontsize',14,'fontweight','bold');
       
       axes(h((i-1)*7+3));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_mean(:,:,3))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+3),jet);
       caxis(full_color);
       title('K3','fontsize',14,'fontweight','bold');
       
       axes(h((i-1)*7+4));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_mean(:,:,4))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+4),jet);
       caxis(full_color);
       title('K4','fontsize',14,'fontweight','bold');
       
       axes(h((i-1)*7+5));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_41_mean(:,:))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+5),jet);
       caxis(full_color);
       title('K4 - 1','fontsize',14,'fontweight','bold');
       
       axes(h((i-1)*7+6));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_42_mean(:,:))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+6),jet);
       caxis(full_color);
       title('K4 - 2','fontsize',14,'fontweight','bold');
       
       axes(h((i-1)*7+7));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_total_mean(:,:))',...
           full_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+7),jet);
       caxis(full_color);
       title('Total','fontsize',14,'fontweight','bold');
       
       hp4=get(h((i-1)*7+7),'Position');
       s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)+0.01  0.015  0.12],'fontsize',16);
       s.Label.String='%';
       
    else
        
       
       axes(h((i-1)*7+1));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_MJO(:,:,i-1,1)-amp_cloud_k_mean(:,:,1))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+1),colormap_nature);
       caxis(mjo_color);
       m_text(100,-10,text_used{i},'fontsize',16,'fontweight','bold');
       
       axes(h((i-1)*7+2));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_MJO(:,:,i-1,2)-amp_cloud_k_mean(:,:,2))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+2),colormap_nature);
       caxis(mjo_color);
       
       axes(h((i-1)*7+3));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_MJO(:,:,i-1,3)-amp_cloud_k_mean(:,:,3))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+3),colormap_nature);
       caxis(mjo_color);
       
       axes(h((i-1)*7+4));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_k_MJO(:,:,i-1,4)-amp_cloud_k_mean(:,:,4))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+4),colormap_nature);
       caxis(mjo_color);
       
       axes(h((i-1)*7+5));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_41_MJO(:,:,i-1)-amp_cloud_41_mean(:,:))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+5),colormap_nature);
       caxis(mjo_color);
       
       axes(h((i-1)*7+6));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_42_MJO(:,:,i-1)-amp_cloud_42_mean(:,:))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+6),colormap_nature);
       caxis(mjo_color);
       
       axes(h((i-1)*7+7));
       m_contourf(lon_isccp,lat_isccp,(amp_cloud_total_MJO(:,:,i-1)-amp_cloud_total_mean(:,:))',...
           mjo_range,'linestyle','none');
       m_coast('linewidth',2,'color','k');
       m_grid('xtick',[],'ytick',[]);
       colormap(h((i-1)*7+7),colormap_nature);
       caxis(mjo_color);
       
    
        
       
    end
end

hp4=get(h(63),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.82],'fontsize',16);
s.Label.String='%';