%% RMM ENSO - MJO 
load('colormap_nature')
load('hgg_decomposite_ensormm');
load('hgg_decomposite_plot');
load('lon_lat_isccp');
lon=lon_isccp;
lat=lat_isccp;
load('colormap_nature');

addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,5,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:8;
    % k1
    axes(h((i-1)*5+1))
    m_contourf(lon,lat,(hgg_ensormm_rmm(:,:,i,1,1))',linspace(-5,5,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8;
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K1','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
    
    
    % k2
    axes(h((i-1)*5+2))
    m_contourf(lon,lat,(hgg_ensormm_rmm(:,:,i,2,1))',linspace(-5,5,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    if i==1;
        title('K2','fontsize',16);
    end
    caxis([-5 5]);
    
    % k3
    axes(h((i-1)*5+3))
    m_contourf(lon,lat,(hgg_ensormm_rmm(:,:,i,3,1))',linspace(-5,5,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K3','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([-5 5]);
    
    % k4
    axes(h((i-1)*5+4))
    m_contourf(lon,lat,(hgg_ensormm_rmm(:,:,i,4,1))',linspace(-5,5,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K4','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([-5 5]);
    
    % total
    axes(h((i-1)*5+5))
    m_contourf(lon,lat,(hgg_ensormm_p(:,:,i,1))',linspace(-5,5,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('Total','fontsize',16);
    end
    
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([-5 5]);
end

hp4=get(h(40),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% RMM ENSO - MJO MJO -
load('colormap_nature')
load('hgg_decomposite_ensormm_k_only_mjo');
load('hgg_decomposite_ensormm_total_only_mjo');
load('lon_lat_isccp');
lon=lon_isccp;
lat=lat_isccp;
load('colormap_nature');

addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;
color_used=[-15 15 200];
axis_used=[-15 15];

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,5,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:8;
    % k1
    axes(h((i-1)*5+1))
    m_contourf(lon,lat,(hgg_rmm_rmm(:,:,i,1))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8;
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K1','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([axis_used(1) axis_used(2)]);
    
    
    % k2
    axes(h((i-1)*5+2))
    m_contourf(lon,lat,(hgg_rmm_rmm(:,:,i,2))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    if i==1;
        title('K2','fontsize',16);
    end
    caxis([axis_used(1) axis_used(2)]);
    
    % k3
    axes(h((i-1)*5+3))
    m_contourf(lon,lat,(hgg_rmm_rmm(:,:,i,3))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K3','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([axis_used(1) axis_used(2)]);
    
    % k4
    axes(h((i-1)*5+4))
    m_contourf(lon,lat,(hgg_rmm_rmm(:,:,i,4))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K4','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([axis_used(1) axis_used(2)]);
    
    % total
    axes(h((i-1)*5+5))
    m_contourf(lon,lat,(hgg_rmm_p(:,:,i))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('Total','fontsize',16);
    end
    
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([axis_used(1) axis_used(2)]);
end

hp4=get(h(40),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% RMM ENSO - MJO MJO null -
load('colormap_nature')
load('hgg_decomposite_ensormm_k_only_mjo');
load('hgg_decomposite_ensormm_total_only_mjo');
load('lon_lat_isccp');
lon=lon_isccp;
lat=lat_isccp;
load('colormap_nature');

addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;
color_used=[-15 15 200];
axis_used=[-15 15];

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,5,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:8;
    % k1
    axes(h((i-1)*5+1))
    m_contourf(lon,lat,(hgg_null_rmm(:,:,i,1))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8;
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K1','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([axis_used(1) axis_used(2)]);
    
    
    % k2
    axes(h((i-1)*5+2))
    m_contourf(lon,lat,(hgg_null_rmm(:,:,i,2))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    if i==1;
        title('K2','fontsize',16);
    end
    caxis([axis_used(1) axis_used(2)]);
    
    % k3
    axes(h((i-1)*5+3))
    m_contourf(lon,lat,(hgg_null_rmm(:,:,i,3))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K3','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([axis_used(1) axis_used(2)]);
    
    % k4
    axes(h((i-1)*5+4))
    m_contourf(lon,lat,(hgg_null_rmm(:,:,i,4))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('K4','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([axis_used(1) axis_used(2)]);
    
    % total
    axes(h((i-1)*5+5))
    m_contourf(lon,lat,(hgg_null_p(:,:,i))',linspace(color_used(1),color_used(2),color_used(3)),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('ytick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1;
        title('Total','fontsize',16);
    end
    
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([axis_used(1) axis_used(2)]);
end

hp4=get(h(40),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% RMM ENSO - enso -
load('colormap_nature')
load('hgg_decomposite_ensormm_total_only_enso');
load('hgg_decomposite_ensormm_k_only_enso');
load('lon_lat_isccp');
lon=lon_isccp;
lat=lat_isccp;
load('colormap_nature');

addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(5,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:3
    % k1
    axes(h(1+(i-1)));
    m_contourf(lon,lat,(hgg_enso_enso(:,:,i,1,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1
        title('ENSO+','fontsize',16);
    elseif i==2
        title('ENSO-','fontsize',16);
    elseif i==3;
        title('Neutral','fontsize',15);
    end
    
    text_here=['K1'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    
    % k2
    axes(h(4+(i-1)))
    m_contourf(lon,lat,(hgg_enso_enso(:,:,i,2,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    
    text_here=['K2'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    % k3
    axes(h(7+(i-1)))
    m_contourf(lon,lat,(hgg_enso_enso(:,:,i,3,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    
    
    text_here=['K3'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    % k4
    axes(h((10+(i-1))))
    m_contourf(lon,lat,(hgg_enso_enso(:,:,i,4,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    
    
    text_here=['K4'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    % total
    axes(h(13+(i-1)))
    m_contourf(lon,lat,(hgg_enso_enso(:,:,i,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    
    text_here=['Total'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([-12 12]);
end

hp4=get(h(15),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% RMM ENSO - enso null
load('colormap_nature')
load('hgg_decomposite_ensormm_total_only_enso');
load('hgg_decomposite_ensormm_k_only_enso');
load('lon_lat_isccp');
lon=lon_isccp;
lat=lat_isccp;
load('colormap_nature');

addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(5,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:3
    % k1
    axes(h(1+(i-1)));
    m_contourf(lon,lat,(hgg_null_enso(:,:,i,1,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    if i==1
        title('ENSO+','fontsize',16);
    elseif i==2
        title('ENSO-','fontsize',16);
    elseif i==3;
        title('Neutral','fontsize',15);
    end
    
    text_here=['K1'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    
    % k2
    axes(h(4+(i-1)))
    m_contourf(lon,lat,(hgg_null_enso(:,:,i,2,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    
    text_here=['K2'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    % k3
    axes(h(7+(i-1)))
    m_contourf(lon,lat,(hgg_null_enso(:,:,i,3,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    
    
    text_here=['K3'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    % k4
    axes(h((10+(i-1))))
    m_contourf(lon,lat,(hgg_null_enso(:,:,i,4,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('xtick',[],'fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    
    
    text_here=['K4'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    caxis([-12 12]);
    
    % total
    axes(h(13+(i-1)))
    m_contourf(lon,lat,(hgg_null_enso(:,:,i,1))',linspace(-12,12,200),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=1;
        m_grid('xtick',[],'ytick',[],'fontsize',14,'linestyle','none');
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    colormap(colormap_nature);
    
    text_here=['Total'];
    if i==1;
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    end
    
    text_here=['RMM Phase ' num2str(i)];
    caxis([-12 12]);
end

hp4=get(h(15),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';