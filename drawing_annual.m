%% SOM DCP
load('lon_lat_isccp');
load('colormap_nature');
load('hgg_ca_k_som_12');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

% 1

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=hgg_ca_k_som(:,:,i,1);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-20:0.01:20,'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% 2

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=hgg_ca_k_som(:,:,i,2);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-20:0.01:20,'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% 3

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=hgg_ca_k_som(:,:,i,3);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-20:0.01:20,'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% 3

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=hgg_ca_k_som(:,:,i,3);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-20:0.01:20,'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% 4

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=hgg_ca_k_som(:,:,i,4);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-20:0.01:20,'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% P - T - H
load('idx');
label_isccp=[];

for i=1:4;
    label_isccp=[label_isccp;nansum(idx==i)./length(idx)];
end

load('p_t_h_k');
p_t_h_k=p_t_h;
load('p_t_h_full');
color_hot=colormap(hot);
color_hot=color_hot(end:-1:1,:);
close
p_t_h_isccp=p_t_h_k;

figure('pos',[10 10 1500 1500]);
subplot(2,3,1);
tcc_here=p_t_h_isccp(:,:,1);
tcc_here=nansum(tcc_here(:));
data_here=p_t_h_isccp(:,:,1);
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:7,1:8,data_here);
caxis([0 12]);
colormap(color_hot);

set(gca,'xtick',[1.5:6.5],'xticklabels',{'<1.3','1.3-3.6','3.6-9.4','9.4-23','23-60','>60'});
set(gca,'ytick',[1.5:7.5],'yticklabels',{'<180','180-310','310-440','440-560','560-680','680-800','>800'});

text_here=['ISCCP K' num2str(1) ': ' num2str(round(label_isccp(1)*100,2)) '% ' 'TCC: ' num2str(round(tcc_here,2))];
title(text_here,'fontsize',16,'fontweight','bold');
set(gca,'fontsize',10);
xlabel('Tau','fontsize',16,'fontweight','bold');
ylabel('TP','fontsize',16,'fontweight','bold');

subplot(2,3,2);
tcc_here=p_t_h_isccp(:,:,2);
tcc_here=nansum(tcc_here(:));
data_here=p_t_h_isccp(:,:,2);
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:7,1:8,data_here);
caxis([0 12]);
colormap(color_hot);

set(gca,'xtick',[1.5:6.5],'xticklabels',{'<1.3','1.3-3.6','3.6-9.4','9.4-23','23-60','>60'});
set(gca,'ytick',[1.5:7.5],'yticklabels',{'<180','180-310','310-440','440-560','560-680','680-800','>800'});

text_here=['ISCCP K' num2str(2) ': ' num2str(round(label_isccp(2)*100,2)) '% ' 'TCC: ' num2str(round(tcc_here,2))];
title(text_here,'fontsize',16,'fontweight','bold');
set(gca,'fontsize',10);
xlabel('Tau','fontsize',16,'fontweight','bold');
ylabel('TP','fontsize',16,'fontweight','bold');

subplot(2,3,4);
tcc_here=p_t_h_isccp(:,:,3);
tcc_here=nansum(tcc_here(:));
data_here=p_t_h_isccp(:,:,3);
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:7,1:8,data_here);
caxis([0 12]);
colormap(color_hot);

set(gca,'xtick',[1.5:6.5],'xticklabels',{'<1.3','1.3-3.6','3.6-9.4','9.4-23','23-60','>60'});
set(gca,'ytick',[1.5:7.5],'yticklabels',{'<180','180-310','310-440','440-560','560-680','680-800','>800'});

text_here=['ISCCP K' num2str(3) ': ' num2str(round(label_isccp(3)*100,2)) '% ' 'TCC: ' num2str(round(tcc_here,2))];
title(text_here,'fontsize',16,'fontweight','bold');
set(gca,'fontsize',10);
xlabel('Tau','fontsize',16,'fontweight','bold');
ylabel('TP','fontsize',16,'fontweight','bold');

subplot(2,3,5);
tcc_here=p_t_h_isccp(:,:,4);
tcc_here=nansum(tcc_here(:));
data_here=p_t_h_isccp(:,:,4);
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:7,1:8,data_here);
caxis([0 12]);
colormap(color_hot);

set(gca,'xtick',[1.5:6.5],'xticklabels',{'<1.3','1.3-3.6','3.6-9.4','9.4-23','23-60','>60'});
set(gca,'ytick',[1.5:7.5],'yticklabels',{'<180','180-310','310-440','440-560','560-680','680-800','>800'});

text_here=['ISCCP K' num2str(4) ': ' num2str(round(label_isccp(4)*100,2)) '% ' 'TCC: ' num2str(round(tcc_here,2))];
title(text_here,'fontsize',16,'fontweight','bold');
set(gca,'fontsize',10);
xlabel('Tau','fontsize',16,'fontweight','bold');
ylabel('TP','fontsize',16,'fontweight','bold');

subplot(2,3,[3 6]);
tcc_here=p_t_h;
tcc_here=nansum(tcc_here(:));
data_here=p_t_h;
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:7,1:8,data_here);
caxis([0 12]);
colormap(color_hot);

set(gca,'xtick',[1.5:6.5],'xticklabels',{'<1.3','1.3-3.6','3.6-9.4','9.4-23','23-60','>60'});
set(gca,'ytick',[1.5:7.5],'yticklabels',{'<180','180-310','310-440','440-560','560-680','680-800','>800'});

text_here=['ISCCP'  'TCC: ' num2str(round(tcc_here,2))];
title(text_here,'fontsize',16,'fontweight','bold');
set(gca,'fontsize',10);
xlabel('Tau','fontsize',16,'fontweight','bold');
ylabel('TP','fontsize',16,'fontweight','bold');

%% MJO varying cloud
load('hgg_ca_anom_mjo_full');
ca_diurnal_anom_k_mjo=hgg_ca_anom_mjo_full;
load('lon_lat_isccp');
lon_used=lon(lon_index);
lat_used=lat(lat_index);
load('colormap_nature');

m_proj('miller','lon',[nanmin(lon_used) nanmax(lon_used)],'lat',[nanmin(lat_used) nanmax(lat_used)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(5,4,[0.01 0.01],[0.05 0.05],[0.03 0.1]);

axes(h(1))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'a) K1','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);
title('8 - 1','fontsize',16,'fontweight','bold');

axes(h(2))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'b)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);
title('2 - 3','fontsize',16,'fontweight','bold');


axes(h(3))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'c)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);
title('4 - 5','fontsize',16,'fontweight','bold');


axes(h(4))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,4,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'d)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);
title('6 - 7','fontsize',16,'fontweight','bold');

axes(h(5))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'e) K2','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(6))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'f)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);


axes(h(7))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'g)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);


axes(h(8))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,4,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'h)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(9))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'i) K3','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(10))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'j)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);


axes(h(11))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'k)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);


axes(h(12))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,4,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'l)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(13))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'m) K4','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(14))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'n)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(15))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'o)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);


axes(h(16))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,4,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'p)','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(17))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'Total','fontsize',16,'fontweight','bold');
caxis([-10 10]);
colormap(colormap_nature);

axes(h(18))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis([-10 10]);
colormap(colormap_nature);


axes(h(19))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis([-10 10]);
colormap(colormap_nature);


axes(h(20))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,4,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis([-10 10]);
colormap(colormap_nature);


hp4=get(h(20),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% ENSO varying cloud
load('hgg_ca_anom_enso_full');
ca_diurnal_anom_k_mjo=hgg_ca_anom_enso_full;
load('lon_lat_isccp');
lon_used=lon(lon_index);
lat_used=lat(lat_index);
load('colormap_nature');

m_proj('miller','lon',[nanmin(lon_used) nanmax(lon_used)],'lat',[nanmin(lat_used) nanmax(lat_used)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(5,3,[0.01 0.01],[0.05 0.05],[0.03 0.1]);

axes(h(1))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'a) K1','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);
title('ENSO + ','fontsize',16,'fontweight','bold');

axes(h(2))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'b)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);
title('ENSO -','fontsize',16,'fontweight','bold');


axes(h(3))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,1))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'c)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);
title('Neutral','fontsize',16,'fontweight','bold');


axes(h(4))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'d) K2','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(5))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'e)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);


axes(h(6))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,2))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'f)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(7))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'g) K3','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(8))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'h)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);


axes(h(9))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,3))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'i)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(10))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'j) K4','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(11))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'k)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(12))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,4))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'l)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(13))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,1,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'m) Total','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);

axes(h(14))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,2,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'n)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);


axes(h(15))
m_contourf(lon_used,lat_used,(ca_diurnal_anom_k_mjo(:,:,3,5))',linspace(-20,20,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'o)','fontsize',16,'fontweight','bold');
caxis([-15 15]);
colormap(colormap_nature);



hp4=get(h(15),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% amp and lst MJO
load('lon_lat_isccp.mat')
load('amp_MJO');
full_range=[0 80];
mjo_range=[-20 20];

lon_re=lon_isccp;lat_re=lat_isccp;
load('colormap_nature');
m_proj('miller','lon',[nanmin(lon_re) nanmax(lon_re)],'lat',[nanmin(lat_re) nanmax(lat_re)]);
figure('pos',[10 10 1500 1500]);
h=tight_subplot(5,5,[0.01 0.01],[0.1 0.03],[0.03 0.03]);
axes(h(1))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,1))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K1','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(1),jet);
title('Clim','fontsize',16,'fontweight','bold');
axes(h(2))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,1,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(2),colormap_nature);
title('8-1','fontsize',16,'fontweight','bold');
axes(h(3))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,2,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(3),colormap_nature);
title('2-3','fontsize',16,'fontweight','bold');
axes(h(4))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,3,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(4),colormap_nature);
title('4-5','fontsize',16,'fontweight','bold');
axes(h(5))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,4,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(5),colormap_nature);
title('6-7','fontsize',16,'fontweight','bold');
axes(h(6))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,2))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K2','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(6),jet);
axes(h(7))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,1,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(7),colormap_nature);
axes(h(8))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,2,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(8),colormap_nature);
axes(h(9))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,3,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(9),colormap_nature);
axes(h(10))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,4,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(10),colormap_nature);
axes(h(11))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,3))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K3','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(11),jet);
axes(h(12))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,1,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(12),colormap_nature);
axes(h(13))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,2,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(13),colormap_nature);
axes(h(14))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,3,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis([-10 10]);
colormap(h(14),colormap_nature);
axes(h(15))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,4,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(15),colormap_nature);
axes(h(16))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,4))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K4','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(16),jet);
axes(h(17))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,1,4)-amp_cloud_k_mean(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(17),colormap_nature);
axes(h(18))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,2,4)-amp_cloud_k_mean(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(18),colormap_nature);
axes(h(19))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,3,4)-amp_cloud_k_mean(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(19),colormap_nature);
axes(h(20))
m_contourf(lon_re,lat_re,(amp_cloud_k_MJO(:,:,4,4)-amp_cloud_total_MJO(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(20),colormap_nature);

axes(h(21))
m_contourf(lon_re,lat_re,(amp_cloud_total_mean(:,:))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'Total','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(21),jet);
hp4=get(h(21),'Position');
s=colorbar('location','southoutside','fontsize',12,'Position', [hp4(1)  hp4(2)-0.03  0.16  0.01]);
s.Label.String='%';
axes(h(22))
m_contourf(lon_re,lat_re,(amp_cloud_total_MJO(:,:,1)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(22),colormap_nature);
hp4=get(h(22),'Position');
s=colorbar('location','southoutside','fontsize',12,'Position', [hp4(1)  hp4(2)-0.03  0.75  0.01]);
s.Label.String='%';
axes(h(23))
m_contourf(lon_re,lat_re,(amp_cloud_total_MJO(:,:,2)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(23),colormap_nature);
axes(h(24))
m_contourf(lon_re,lat_re,(amp_cloud_total_MJO(:,:,3)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(24),colormap_nature);
axes(h(25))
m_contourf(lon_re,lat_re,(amp_cloud_total_MJO(:,:,4)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(25),colormap_nature);

%% amp ENSO

load('lon_lat_isccp.mat')
load('amp_ENSO');
full_range=[0 80];
mjo_range=[-20 20];

lon_re=lon_isccp;lat_re=lat_isccp;
load('colormap_nature');
m_proj('miller','lon',[nanmin(lon_re) nanmax(lon_re)],'lat',[nanmin(lat_re) nanmax(lat_re)]);
figure('pos',[10 10 1500 1500]);
h=tight_subplot(5,4,[0.01 0.01],[0.1 0.03],[0.03 0.03]);
axes(h(1))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,1))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K1','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(1),jet);
title('Clim','fontsize',16,'fontweight','bold');
axes(h(2))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,1,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(2),colormap_nature);
title('ENSO +','fontsize',16,'fontweight','bold');
axes(h(3))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,2,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(3),colormap_nature);
title('ENSO -','fontsize',16,'fontweight','bold');
axes(h(4))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,3,1)-amp_cloud_k_mean(:,:,1))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(4),colormap_nature);
title('Neutral','fontsize',16,'fontweight','bold');

axes(h(5))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,2))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K2','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(5),jet);
axes(h(6))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,1,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(6),colormap_nature);
axes(h(7))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,2,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(7),colormap_nature);
axes(h(8))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,3,2)-amp_cloud_k_mean(:,:,2))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(8),colormap_nature);

axes(h(9))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,3))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K3','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(9),jet);
axes(h(10))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,1,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(10),colormap_nature);
axes(h(11))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,2,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(11),colormap_nature);
axes(h(12))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,3,3)-amp_cloud_k_mean(:,:,3))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(12),colormap_nature);

axes(h(13))
m_contourf(lon_re,lat_re,(amp_cloud_k_mean(:,:,4))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'K4','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(13),jet);
axes(h(14))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,1,4)-amp_cloud_k_mean(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(14),colormap_nature);
axes(h(15))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,2,4)-amp_cloud_k_mean(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(15),colormap_nature);
axes(h(16))
m_contourf(lon_re,lat_re,(amp_cloud_k_ENSO(:,:,3,4)-amp_cloud_k_mean(:,:,4))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(16),colormap_nature);

axes(h(17))
m_contourf(lon_re,lat_re,(amp_cloud_total_mean(:,:))',linspace(0,100,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
m_text(100,-10,'Total','fontsize',16,'fontweight','bold');
caxis(full_range);
colormap(h(17),jet);
hp4=get(h(17),'Position');
s=colorbar('location','southoutside','fontsize',12,'Position', [hp4(1)  hp4(2)-0.03  0.16  0.01]);
s.Label.String='%';
axes(h(18))
m_contourf(lon_re,lat_re,(amp_cloud_total_ENSO(:,:,1)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(18),colormap_nature);
hp4=get(h(18),'Position');
s=colorbar('location','southoutside','fontsize',12,'Position', [hp4(1)  hp4(2)-0.03  0.75  0.01]);
s.Label.String='%';
axes(h(19))
m_contourf(lon_re,lat_re,(amp_cloud_total_ENSO(:,:,2)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(19),colormap_nature);
axes(h(20))
m_contourf(lon_re,lat_re,(amp_cloud_total_ENSO(:,:,3)-amp_cloud_total_mean(:,:))',linspace(-30,30,100),'linestyle','none');
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(mjo_range);
colormap(h(20),colormap_nature);

%% SOM Temporal Dist

% Year


load('lon_lat_isccp');
load('colormap_nature');
load('som_ts_dist');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

% 1

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:12
    data_here=yprop_ts(i,:);
    axes(h(index_true(i)));
    
    plot(1997:2015,data_here*100,'linewidth',2,'color','k');
    
    if ismember(index_true(i),[1 4 7]);
        set(gca,'xtick',[]);
        set(gca,'fontsize',14);
        ylabel('%');
    elseif ismember(index_true(i),[11 12]);
        set(gca,'ytick',[]);
        set(gca,'fontsize',14);
        xlabel('Month');
    elseif index_true(i)==10
        set(gca,'fontsize',14);
        xlabel('Month');
        ylabel('%');
    else
        set(gca,'xtick',[],'ytick',[]);
    end
    
    xlim([1997 2015]);
    ylim([0 17])
    
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    text(1997.5,14,text_here,'fontsize',16,'fontweight','bold');
end

%% SOM Temporal Dist

% Month


load('lon_lat_isccp');
load('colormap_nature');
load('som_ts_dist');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

% 1

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:12
    data_here=mprop_ts(i,:);
    axes(h(index_true(i)));
    
    plot(1:12,data_here*100,'linewidth',2,'color','k');
    
   
    
    if ismember(index_true(i),[1 4 7]);
        set(gca,'xtick',[]);
        set(gca,'fontsize',14);
        ylabel('%');
    elseif ismember(index_true(i),[11 12]);
        set(gca,'ytick',[]);
        set(gca,'fontsize',14);
        xlabel('Month');
    elseif index_true(i)==10
        set(gca,'fontsize',14);
        xlabel('Month');
        ylabel('%');
    else
        set(gca,'xtick',[],'ytick',[]);
    end
    
    xlim([1 12]);
    ylim([4 15])
    
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    text(2,5,text_here,'fontsize',16,'fontweight','bold');
end

%% SOM total
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_total(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-40:0.01:40,'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM total ENSO+?
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total_enso','dcp_total_e');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_total_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-40,40,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% dif

load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total_enso','dcp_total_e');
load('dcp_total');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_total_e-dcp_total;

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-20,20,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM total ENSO-?
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total_enso','dcp_total_l');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_total_l(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-40,40,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% dif

load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total_enso','dcp_total_l');
load('dcp_total');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_l=dcp_total_l-dcp_total;

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_l(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-20,20,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 1 ENSO+?
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_12_enso','dcp_12_e');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_12_e(:,:,i,1);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-40,40,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% dif

load('lon_lat_isccp');
load('colormap_nature');
load('dcp_12_enso','dcp_12_e');
load('dcp_som_k_re');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_e(:,:,:,1)-dcp_som_k_re(:,:,:,1);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-8,8,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 1 ENSO-?
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total_enso','dcp_total_l');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_total_l(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-40,40,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

% dif

load('lon_lat_isccp');
load('colormap_nature');
load('dcp_12_enso','dcp_12_l');
load('dcp_som_k_re');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_l(:,:,:,1)-dcp_som_k_re(:,:,:,1);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-8,8,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 2 ENSO +
% dif
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_12_enso','dcp_12_e');
load('dcp_som_k_re');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_e(:,:,:,2)-dcp_som_k_re(:,:,:,2);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-10,10,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 3 ENSO +
% dif
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_12_enso','dcp_12_e');
load('dcp_som_k_re');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_e(:,:,:,3)-dcp_som_k_re(:,:,:,3);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-10,10,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 4 ENSO +
% dif
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_12_enso','dcp_12_e');
load('dcp_som_k_re');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_e(:,:,:,4)-dcp_som_k_re(:,:,:,4);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-12,12,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 4 - 1 ENSO +
% dif
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_som_k_re_4142','dcp_som_k_re_41');
load('dcp_12_enso_4142','dcp_12_e_41');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_e_41(:,:,:)-dcp_som_k_re_41(:,:,:);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-12,12,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM dcp 4 - 2 ENSO +
% dif
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_som_k_re_4142','dcp_som_k_re_42');
load('dcp_12_enso_4142','dcp_12_e_42');
load('som_results_12','label_som');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_12_e_42(:,:,:)-dcp_som_k_re_42(:,:,:);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-12,12,500),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% TRMM SOM
load('lon_lat_trmm');
load('colormap_nature');
load('trmm_som');
load('som_results_12','label_som');
label_som=label_som(2929:end);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_trmm) nanmax(lon_trmm)],'lat',[nanmin(lat_trmm) nanmax(lat_trmm)]);

for i=1:12
    data_here=trmm_som(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_trmm,lat_trmm,(data_here),linspace(-1,1,800),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.9 0.9]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='mm/hour';

%% TRMM SOM ENSO

load('lon_lat_trmm');
load('colormap_nature');
load('trmm_som_enso');
load('som_results_12','label_som');
label_som=label_som(2929:end);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_trmm) nanmax(lon_trmm)],'lat',[nanmin(lat_trmm) nanmax(lat_trmm)]);

for i=1:12
    data_here=trmm_enso(:,:,i,1);
    axes(h(index_true(i)));
    
    m_contourf(lon_trmm,lat_trmm,(data_here),linspace(-1,1,800),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.9 0.9]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='mm/hour';

% dif e
load('lon_lat_trmm');
load('colormap_nature');
load('trmm_som_enso');
load('trmm_som');
load('som_results_12','label_som');
label_som=label_som(2929:end);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=trmm_enso(:,:,:,1)-trmm_som;
dif_l=trmm_enso(:,:,:,2)-trmm_som;

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_trmm) nanmax(lon_trmm)],'lat',[nanmin(lat_trmm) nanmax(lat_trmm)]);

for i=1:12
    data_here=dif_e(:,:,i,1);
    axes(h(index_true(i)));
    
    m_contourf(lon_trmm,lat_trmm,(data_here),linspace(-1,1,800),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.8 0.8]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='mm/hour';

% dif l
load('lon_lat_trmm');
load('colormap_nature');
load('trmm_som_enso');
load('trmm_som');
load('som_results_12','label_som');
label_som=label_som(2929:end);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=trmm_enso(:,:,:,1)-trmm_som;
dif_l=trmm_enso(:,:,:,2)-trmm_som;

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_trmm) nanmax(lon_trmm)],'lat',[nanmin(lat_trmm) nanmax(lat_trmm)]);

for i=1:12
    data_here=dif_l(:,:,i,1);
    axes(h(index_true(i)));
    
    m_contourf(lon_trmm,lat_trmm,(data_here),linspace(-1,1,800),'linestyle','none');
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.8 0.8]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='mm/hour';

%% uv som 200
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total');
load('uv_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_total(:,:,i);
    u_here=squeeze(u_som(:,:,1,i));
    v_here=squeeze(v_som(:,:,1,i));
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-40:0.01:40,'linestyle','none');
    
    hold on
    
    [lat_full,lon_full]=meshgrid(lat,lon);
    
    m_quiver(lon_full(1:10:end,1:10:end),lat_full(1:10:end,1:10:end),(u_here(1:10:end,1:10:end)),(v_here(1:10:end,1:10:end)),1,'color','k');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';


%% uv som 850
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total');
load('uv_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dcp_total(:,:,i);
    u2_here=squeeze(u_som(:,:,2,i));
    v2_here=squeeze(v_som(:,:,2,i));
    u1_here=squeeze(u_som(:,:,1,i));
    v1_here=squeeze(v_som(:,:,1,i));
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',-40:0.01:40,'linestyle','none');
    
    hold on
    
    [lat_full,lon_full]=meshgrid(lat,lon);
    
    m_quiver(lon_full(1:10:end,1:10:end),lat_full(1:10:end,1:10:end),(u1_here(1:10:end,1:10:end)),(v1_here(1:10:end,1:10:end)),1,'color','k');
    
    hold on
    
    m_quiver(lon_full(1:10:end,1:10:end),lat_full(1:10:end,1:10:end),(u2_here(1:10:end,1:10:end)),(v2_here(1:10:end,1:10:end)),1,'color','m');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-35 35]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% uv som 200 enso+
load('uv_som_enso');
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total');
load('dcp_total_enso');
load('uv_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_total_e-dcp_total;
dif_u=squeeze(u_som_enso(:,:,1,:,1))-squeeze(u_som(:,:,1,:));
dif_v=squeeze(v_som_enso(:,:,1,:,1))-squeeze(v_som(:,:,1,:));

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    u_here=dif_u(:,:,i);
    v_here=dif_v(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-20,20,500),'linestyle','none');
    
    hold on
    
    [lat_full,lon_full]=meshgrid(lat,lon);
    
    m_quiver(lon_full(1:10:end,1:10:end),lat_full(1:10:end,1:10:end),(u_here(1:10:end,1:10:end)),(v_here(1:10:end,1:10:end)),1,'color','k');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% uv som 850 enso+
load('uv_som_enso');
load('lon_lat_isccp');
load('colormap_nature');
load('dcp_total');
load('dcp_total_enso');
load('uv_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=dcp_total_e-dcp_total;
dif_u=squeeze(u_som_enso(:,:,2,:,1))-squeeze(u_som(:,:,1,:));
dif_v=squeeze(v_som_enso(:,:,2,:,1))-squeeze(v_som(:,:,1,:));

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

for i=1:12
    data_here=dif_e(:,:,i);
    u_here=dif_u(:,:,i);
    v_here=dif_v(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_isccp,lat_isccp,(data_here)',linspace(-20,20,500),'linestyle','none');
    
    hold on
    
    [lat_full,lon_full]=meshgrid(lat,lon);
    
    m_quiver(lon_full(1:10:end,1:10:end),lat_full(1:10:end,1:10:end),(u_here(1:10:end,1:10:end)),(v_here(1:10:end,1:10:end)),1,'color','k');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% div 250
load('colormap_nature');
load('div_anom_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(div_som(:,:,1,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here*1e5)',linspace(-2,2,1000),'linestyle','none');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-2 2]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='*10^{-6}/s';

%% div 850
load('colormap_nature');
load('div_anom_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(div_som(:,:,2,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here*1e5)',linspace(-2,2,1000),'linestyle','none');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-2 2]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='*10^{-6}/s';

%% div anom 250 enso+
load('div_anom_som_enso');
load('colormap_nature');
load('div_anom_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=squeeze(div_som_enso(:,:,1,:,1))-squeeze(div_som(:,:,1,:));

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=dif_e(:,:,i)*1e6;
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-20,20,500),'linestyle','none');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';


%% div anom 850 enso+
load('div_anom_som_enso');
load('colormap_nature');
load('div_anom_som');
load('som_results_12','label_som');
load('lonlat_wind');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=squeeze(div_som_enso(:,:,2,:,1))-squeeze(div_som(:,:,2,:));

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-20,20,500),'linestyle','none');
    
    hold on
    
    m_coast();
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-20 20]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM SST
load('lonlat_sst');
load('colormap_nature');
load('sst_anom_som');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
lon_sst=lon_full(lon_loc);lat_sst=lat_full(lat_loc);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_sst) nanmax(lon_sst)],'lat',[nanmin(lat_sst) nanmax(lat_sst)]);

for i=1:12
    data_here=sst_anom_som(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_sst,lat_sst,(data_here)',linspace(-0.5,0.5,1000),'linestyle','none');
    
    m_coast('patch',[0 0 0]);
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.5 0.5]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% SOM SST ENSO+
load('lonlat_sst');
load('colormap_nature');
load('sst_anom_som');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('sst_som_enso');
load('som_results_12','label_som');
lon_sst=lon_full(lon_loc);lat_sst=lat_full(lat_loc);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end

dif_e=sst_som_enso(:,:,:,1)-sst_anom_som;

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon_sst) nanmax(lon_sst)],'lat',[nanmin(lat_sst) nanmax(lat_sst)]);

for i=1:12
    data_here=dif_e(:,:,i);
    axes(h(index_true(i)));
    
    m_contourf(lon_sst,lat_sst,(data_here)',linspace(-0.7,0.7,1000),'linestyle','none');
    
    m_coast('patch',[0 0 0]);
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.7 0.7]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% sst mjo
load('sst_anom_mjo');
load('lonlat_sst');
load('colormap_nature');


color_1range=[-0.2 0.2];
axis_1range=[-0.18 0.18];

lon_re=lon_full(lon_loc);lat_re=lat_full(lat_loc);

m_proj('miller','lon',[nanmin(lon_re) nanmax(lon_re)],'lat',[nanmin(lat_re) nanmax(lat_re)]);
figure('pos',[10 10 1500 1500]);
h=tight_subplot(2,2,[0.01 0.01],[0.03 0.03],[0.03 0.05]);
axes(h(1))
m_contourf(lon_re,lat_re,(sst_anom_mjo(:,:,1))',linspace(color_1range(1),color_1range(2),1000),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(1),colormap_nature);
m_text(100,-10,'a) 8 - 1','fontsize',16,'fontweight','bold');

axes(h(2))
m_contourf(lon_re,lat_re,(sst_anom_mjo(:,:,2))',linspace(color_1range(1),color_1range(2),1000),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(2),colormap_nature);
m_text(100,-10,'b) 2 - 3','fontsize',16,'fontweight','bold');

axes(h(3))
m_contourf(lon_re,lat_re,(sst_anom_mjo(:,:,3))',linspace(color_1range(1),color_1range(2),1000),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(3),colormap_nature);
m_text(100,-10,'c) 4 - 5','fontsize',16,'fontweight','bold');

axes(h(4))
m_contourf(lon_re,lat_re,(sst_anom_mjo(:,:,4))',linspace(color_1range(1),color_1range(2),1000),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(4),colormap_nature);
m_text(100,-10,'d) 6 - 7','fontsize',16,'fontweight','bold');

hp4=get(h(4),'Position');   
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.01  0.95],'fontsize',16);

%% SST enso
load('sst_anom_enso');
load('lonlat_sst');
load('colormap_nature');


color_1range=[-0.6 0.6];
axis_1range=[-0.5 0.5];

lon_re=lon_full(lon_loc);lat_re=lat_full(lat_loc);

m_proj('miller','lon',[nanmin(lon_re) nanmax(lon_re)],'lat',[nanmin(lat_re) nanmax(lat_re)]);
figure('pos',[10 10 1500 1500]);
h=tight_subplot(2,2,[0.01 0.01],[0.03 0.03],[0.03 0.05]);
axes(h(1));
m_contourf(lon_re,lat_re,(sst_anom_enso(:,:,1))',linspace(color_1range(1),color_1range(2),200),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(1),colormap_nature);
m_text(100,-10,'a) ENSO +','fontsize',16,'fontweight','bold');

axes(h(2));
m_contourf(lon_re,lat_re,(sst_anom_enso(:,:,2))',linspace(color_1range(1),color_1range(2),200),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(2),colormap_nature);
m_text(100,-10,'b) ENSO -','fontsize',16,'fontweight','bold');

axes(h(3));
m_contourf(lon_re,lat_re,(sst_anom_enso(:,:,3))',linspace(color_1range(1),color_1range(2),200),'linestyle','none');
hold on
m_coast('linewidth',2,'color','k');
m_grid('xtick',[],'ytick',[]);
caxis(axis_1range);
colormap(h(3),colormap_nature);
m_text(100,-10,'c) Neutral','fontsize',16,'fontweight','bold');

hp4=get(h(4),'Position');   
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.01  0.95],'fontsize',16);


axes(h(4));
box off
axis off

%% SOM u250
load('lonlat_wind');
load('colormap_nature');
load('uv_som','u_som');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(u_som(:,:,1,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-5,5,1000),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-4 4]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM u250 ENSO+
load('lonlat_wind');
load('colormap_nature');
load('uv_som','u_som');
load('uv_som_enso','u_som_enso');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');

u_som=squeeze(u_som_enso(:,:,1,:,1))-squeeze(u_som(:,:,1,:));

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end



figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(u_som(:,:,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-5,5,1000),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM u850
load('lonlat_wind');
load('colormap_nature');
load('uv_som','u_som');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(u_som(:,:,2,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-5,5,1000),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-4 4]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM u850 ENSO+
load('lonlat_wind');
load('colormap_nature');
load('uv_som','u_som');
load('uv_som_enso','u_som_enso');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');

u_som=squeeze(u_som_enso(:,:,2,:,1))-squeeze(u_som(:,:,2,:));

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end



figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(u_som(:,:,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-5,5,1000),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM pres
load('lonlat_wind');
load('colormap_nature');
load('pres_som','pres_som');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end


figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(pres_som(:,:,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-2,2,1000),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.5 1.5]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='hPa';

%% SOM pres ENSO+
load('lonlat_wind');
load('colormap_nature');
load('pres_som','pres_som');
load('pres_som_enso','pres_som_enso');
load('som_results_12','label_som');
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');

pres_som=squeeze(pres_som_enso(:,:,:,1))-squeeze(pres_som);

index_true=[1 4 7 10 2 5 8 11 3 6 9 12];

full_nodes=[1 1;2 1;3 1;4 1;1 2;2 2;3 2;4 2;1 3;2 3;3 3;4 3];

label_pro=NaN(12,1);
for i=1:12;
    label_pro(i)=nansum(label_som==i)./length(label_som);
end



figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

for i=1:12
    data_here=squeeze(pres_som(:,:,i));
    axes(h(index_true(i)));
    
    m_contourf(lon,lat,(data_here)',linspace(-2,2,1000),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if index_true(i)~=10
        m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
        m_grid('fontsize',14,'linestyle','none');
    end
    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes(i,1)) ',' num2str(full_nodes(i,2)) '):' num2str(round(label_pro(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-2 2]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='hPa';

%% SOM Total Cloud Speed 6
load('lon_lat_isccp');
lon=lon_isccp;lat=lat_isccp;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');load('dcp_total_speed');
in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);

load('dcp_total_speed');

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

dcp_total_speed_used=dcp_total_speed(:,:,[9:10 1:4]).*8;
dcp_total_speed_e_used=dcp_total_speed_e(:,:,[9:10 1:4]).*8;
dcp_total_speed_l_used=dcp_total_speed_l(:,:,[9:10 1:4]).*8;

for i=1:6;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total_speed_used(:,:,i))',linspace(-40,40,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-40 40]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_speed_e_used(:,:,i).*1.5)',linspace(-40,40,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-40 40]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,((dcp_total_speed_l_used(:,:,i)).*0.5)',linspace(-40,40,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO-','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-40 40]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%/day';

%% SOM Total Cloud 6
load('lon_lat_isccp');
lon=lon_isccp;lat=lat_isccp;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');load('dcp_total_speed');
load('dcp_total');
load('dcp_total_enso');
dcp_total=dcp_total(:,:,in_node);
dcp_total_e=dcp_total_e(:,:,in_node);
dcp_total_l=dcp_total_l(:,:,in_node);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);


figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:6;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-40,40,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-40 40]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-40,40,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-40 40]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-40,40,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-40 40]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM u250 6
load('lonlat_wind');
lon=lon;lat=lat;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('uv_som');
load('uv_som_enso');
dcp_total=u_som(:,:,1,in_node);
dcp_total_e=u_som_enso(:,:,1,in_node,1);
dcp_total_l=u_som_enso(:,:,1,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);


figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:6;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(96,-10,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='%';

%% SOM Large SST 6
load('sst_large','l*');
lon=lon_full(lon_loc);lat=lat_full(lat_loc);
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');
dcp_total=sst_anom_som(:,:,in_node);
dcp_total_e=sst_som_enso(:,:,in_node,1);
dcp_total_l=sst_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);
m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:6;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    %m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';


%% SOM Large SST 6 MJO
load('sst_large','l*');
lon=lon_full(lon_loc);lat=lat_full(lat_loc);
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_mjo_large_18');
load('sst_anom_mjo_enso_large');
dcp_total=sst_anom_mjo(:,:,3:6);
dcp_total_e=sst_anom_mjo_enso(:,:,3:6,1);
dcp_total_l=sst_anom_mjo_enso(:,:,3:6,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(4,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);
phase_used=3:6;

for i=1:4;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Phase ' num2str(phase_used(i))];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Phase ' num2str(phase_used(i))];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Phase ' num2str(phase_used(i))];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
end

hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';


%% SOM Large u850 6
load('u850_large_som');
lon=double(ncread('download1997_2000_large_new.nc','longitude'));
lat=double(ncread('download1997_2000_large_new.nc','latitude'));
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');
dcp_total=u850_som(:,:,in_node);
dcp_total_e=u850_som_enso(:,:,in_node,1);
dcp_total_l=u850_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);
m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:6;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-8,8,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-8,8,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    %m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-8,8,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM Large u850 6
load('u250_large_som');
lon=double(ncread('download1997_2000_large_new.nc','longitude'));
lat=double(ncread('download1997_2000_large_new.nc','latitude'));
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');
dcp_total=u250_som(:,:,in_node);
dcp_total_e=u250_som_enso(:,:,in_node,1);
dcp_total_l=u250_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);
m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:6;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-8,8,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=6
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
     caxis([-7 7]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-11,11,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    %m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
     caxis([-7 7]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-8,8,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-7 7]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM Large w 6
load('w_large_som');
load('lonlat_w');
lon=lon_w;lat=lat_w;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');
dcp_total=w_som(:,:,in_node);
dcp_total_e=w_som_enso(:,:,in_node,1);
dcp_total_l=w_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:6;
    axes(h((i-1)*3+1))
    contourf(lon_w,level_w,(dcp_total(:,:,i))',linspace(-0.05,0.05,500),'linestyle','none');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100,100))','k','linewidth',2);
    ylim([100 1000]);
    set(gca,'ydir','reverse');
    
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    
    if i~=6
        set(gca,'xtick',[],'ytick',[]);
    end
    
    if i==6
        xlabel('Lon','fontsize',16);
        ylabel('Pressure','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([-0.02 0.02]);
    
    
    axes(h((i-1)*3+2))
    contourf(lon_w,level_w,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-0.05,0.05,500),'linestyle','none');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100,100))','k','linewidth',2);
    ylim([100 1000]);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(colormap_nature);
    if i==1;
        title('All','fontsize',16);
    end
    if i==1;
        title('ENSO+ - All','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
     caxis([-0.02 0.02]);
    
    axes(h((i-1)*3+3))
    contourf(lon_w,level_w,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-0.05,0.05,500),'linestyle','none');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100,100))','k','linewidth',2);
    ylim([100 1000]);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(colormap_nature);
    if i==1;
        title('ENSO- - All','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([-0.02 0.02]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='Pa/s';

%% SOM Large vertical w - u 6
load('ww_large_som');
load('u_large_som');
load('lonlat_w');
lon=lon_w;lat=lat_w;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');
dcp_total=ww_som(:,:,in_node);
dcp_total_e=ww_som_enso(:,:,in_node,1);
dcp_total_l=ww_som_enso(:,:,in_node,2);

dcp_total_u=u_som(:,:,in_node);
dcp_total_e_u=u_som_enso(:,:,in_node,1);
dcp_total_l_u=u_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

dcp_total_u=dcp_total_u(:,:,[9:10 1:4]);
dcp_total_e_u=dcp_total_e_u(:,:,[9:10 1:4]);
dcp_total_l_u=dcp_total_l_u(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

[lon_full,level_full]=meshgrid(lon_w,level_w);

for i=1:6;
    axes(h((i-1)*3+1))
    u_here=dcp_total_u(:,:,i);
    w_here=dcp_total(:,:,i);
    vel_here=sqrt(u_here.^2+w_here.^2);
    
    contourf(lon_w,level_w./10,(vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((u_here(1:4:end,:))./(vel_here(1:4:end,:)))',((w_here(1:4:end,:))./(vel_here(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    
    colormap(color_hot);
    if i==1;
        title('All','fontsize',16);
    end
    
    if i~=6
        set(gca,'xtick',[],'ytick',[]);
    end
    
    if i==6
        xlabel('Lon','fontsize',16);
        ylabel('Pressure','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    
    axes(h((i-1)*3+2))
    u_here_e=dcp_total_e_u(:,:,i);
    w_here_e=dcp_total_e(:,:,i);
    
    uu=u_here_e;
    ww=w_here_e;
    
    vel_here=sqrt(uu.^2+ww.^2);
    
    contourf(lon_w,level_w./10,(vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((uu(1:4:end,:))./(vel_here(1:4:end,:)))',((ww(1:4:end,:))./(vel_here(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(color_hot);
    
    if i==1;
        title('ENSO+','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    axes(h((i-1)*3+3))
     u_here_e=dcp_total_l_u(:,:,i);
    w_here_e=dcp_total_l(:,:,i);
    
    uu=u_here_e;
    ww=w_here_e;
    
    vel_here=sqrt(uu.^2+ww.^2);
    
    contourf(lon_w,level_w./10,(vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((uu(1:4:end,:))./(vel_here(1:4:end,:)))',((ww(1:4:end,:))./(vel_here(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(color_hot);
    if i==1;
        title('ENSO-','fontsize',16);
    end

    
    colormap(color_hot);
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM Large vertical w - u 6
load('color_hot')
load('wwv_som_enso');
load('uvl_som_enso');
load('lonlat_w');
lon=lon_w;lat=lat_w;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');

dcp_total=ww_som(:,:,in_node).*5;
dcp_total_e=ww_som_enso(:,:,in_node,1).*5;
dcp_total_l=ww_som_enso(:,:,in_node,2).*5;

dcp_total_u=u_som(:,:,in_node);
dcp_total_e_u=u_som_enso(:,:,in_node,1);
dcp_total_l_u=u_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

dcp_total_u=dcp_total_u(:,:,[9:10 1:4]);
dcp_total_e_u=dcp_total_e_u(:,:,[9:10 1:4]);
dcp_total_l_u=dcp_total_l_u(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

[lon_full,level_full]=meshgrid(lon_w,level_w);

for i=1:6;
    axes(h((i-1)*3+1))
    u_here=dcp_total_u(:,:,i);
    w_here=dcp_total(:,:,i);
    vel_here=sqrt(u_here.^2+w_here.^2);
    
    contourf(lon_w,level_w./10,(vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((u_here(1:4:end,:))./(vel_here(1:4:end,:)))',((w_here(1:4:end,:))./(vel_here(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    
    colormap(h((i-1)*3+1),color_hot);
    if i==1;
        title('All','fontsize',16);
    end
    
    if i~=6
        set(gca,'xtick',[],'ytick',[]);
    end
    
    if i==6
        xlabel('Lon','fontsize',16);
        ylabel('Pressure','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    
    axes(h((i-1)*3+2))
    u_here_e=dcp_total_e_u(:,:,i);
    w_here_e=dcp_total_e(:,:,i);
    vel_color=sqrt(u_here_e.^2+w_here_e.^2);
    
    uu=u_here_e-u_here;
    ww=w_here_e-w_here;
    vel_here_e=sqrt(uu.^2+ww.^2);
    
    contourf(lon_w,level_w./10,(vel_color-vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((uu(1:4:end,:))./(vel_here_e(1:4:end,:)))',((ww(1:4:end,:))./(vel_here_e(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(h((i-1)*3+2),colormap_nature);
    
    if i==1;
        title('ENSO+','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([-5 5]);
    
    axes(h((i-1)*3+3))
    u_here_e=dcp_total_l_u(:,:,i);
    w_here_e=dcp_total_l(:,:,i);
    vel_color=sqrt(u_here_e.^2+w_here_e.^2);
    
    uu=u_here_e-u_here;
    ww=w_here_e-w_here;
    vel_here_e=sqrt(uu.^2+ww.^2);
    
    contourf(lon_w,level_w./10,(vel_color-vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((uu(1:4:end,:))./(vel_here_e(1:4:end,:)))',((ww(1:4:end,:))./(vel_here_e(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(h((i-1)*3+3),colormap_nature);
    if i==1;
        title('ENSO-','fontsize',16);
    end

    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([-5 5]);
end

hp4=get(h(18),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';

%% SOM Large vertical w - u 6
load('color_hot')
load('w_large_som');
load('uvl_som_enso');
load('lonlat_w');
lon=lon_w;lat=lat_w;
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');

dcp_total=w_som(:,:,in_node).*300;
dcp_total_e=w_som_enso(:,:,in_node,1).*300;
dcp_total_l=w_som_enso(:,:,in_node,2).*300;

dcp_total_u=u_som(:,:,in_node);
dcp_total_e_u=u_som_enso(:,:,in_node,1);
dcp_total_l_u=u_som_enso(:,:,in_node,2);

in_node_used=in_node([9:10 1:4]);
de_node_used=de_node([9:10 1:4]);

dcp_total=dcp_total(:,:,[9:10 1:4]);
dcp_total_e=dcp_total_e(:,:,[9:10 1:4]);
dcp_total_l=dcp_total_l(:,:,[9:10 1:4]);

dcp_total_u=dcp_total_u(:,:,[9:10 1:4]);
dcp_total_e_u=dcp_total_e_u(:,:,[9:10 1:4]);
dcp_total_l_u=dcp_total_l_u(:,:,[9:10 1:4]);

index_true=[1 2 3 6  9 12 11 10 7 4];
index_true_used=index_true([9:10 1:4]);

full_nodes=[1 1;1 2;1 3;2 3;3 3;4 3;4 2;4 1;3 1;2 1];
full_nodes_used=full_nodes([9:10 1:4],:);

label_pro=NaN(10,1);
for i=1:10
    label_pro(i)=nansum(label_som==in_node(i))./length(label_som);
end

label_pro_used=label_pro([9:10 1:4]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(6,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

[lon_full,level_full]=meshgrid(lon_w,level_w);

for i=1:6;
    axes(h((i-1)*3+1))
    u_here=dcp_total_u(:,:,i);
    w_here=dcp_total(:,:,i);
    
    %contourf(lon_w,level_w,(vel_here)',linspace(-6,6,500),'linestyle','none');
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end)),(u_here(1:4:end,:))',(w_here(1:4:end,:))',0.5,'autoscale','off','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]);
    set(gca,'ydir','reverse');
    
    colormap(h((i-1)*3+1),color_hot);
    if i==1;
        title('All','fontsize',16);
    end
    
    if i~=6
        set(gca,'xtick',[],'ytick',[]);
    end
    
    if i==6
        xlabel('Lon','fontsize',16);
        ylabel('Pressure','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    
    axes(h((i-1)*3+2))
    u_here_e=dcp_total_e_u(:,:,i);
    w_here_e=dcp_total_e(:,:,i);
    vel_color=sqrt(u_here_e.^2+w_here_e.^2);
    
    uu=u_here_e;
    ww=w_here_e;
    vel_here_e=sqrt(uu.^2+ww.^2);
    
    %contourf(lon_w,level_w,(vel_here)',linspace(-6,6,500),'linestyle','none');
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end)),(uu(1:4:end,:))',(ww(1:4:end,:))',0.5,'autoscale','off','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(h((i-1)*3+2),color_hot);
    
    if i==1;
        title('ENSO+','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    axes(h((i-1)*3+3))
    u_here_e=dcp_total_l_u(:,:,i);
    w_here_e=dcp_total_l(:,:,i);
    vel_color=sqrt(u_here_e.^2+w_here_e.^2);
    
    uu=u_here_e;
    ww=w_here_e;
    vel_here_e=sqrt(uu.^2+ww.^2);
    
    %contourf(lon_w,level_w,(vel_here)',linspace(-6,6,500),'linestyle','none');
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end)),(uu(1:4:end,:))',(ww(1:4:end,:))',0.5,'autoscale','off','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(h((i-1)*3+3),color_hot);
    if i==1;
        title('ENSO-','fontsize',16);
    end

    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
    text(30,900,text_here,'fontsize',12,'fontweight','bold');
   
end


%% MJO Large vertical w - u 36
load('color_hot')
load('wwv_amjo_enso');
load('uvl_amjo_enso');
load('lonlat_w');
lon=lon_w;lat=lat_w;
load('colormap_nature');
load('som_results_12','label_som');

dcp_total=ww_amjo(:,:,:).*5;
dcp_total_e=ww_amjo_enso(:,:,:,1).*5;
dcp_total_l=ww_amjo_enso(:,:,:,2).*5;

dcp_total_u=u_amjo(:,:,:);
dcp_total_e_u=u_amjo_enso(:,:,:,1);
dcp_total_l_u=u_amjo_enso(:,:,:,2);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

[lon_full,level_full]=meshgrid(lon_w,level_w);

for i=1:8;
    axes(h((i-1)*3+1))
    u_here=dcp_total_u(:,:,i);
    w_here=dcp_total(:,:,i);
    vel_here=sqrt(u_here.^2+(w_here).^2);
    
    contourf(lon_w,level_w./10,(vel_here)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((u_here(1:4:end,:))./(vel_here(1:4:end,:)))',((w_here(1:4:end,:))./(vel_here(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    
    colormap(h((i-1)*3+1),color_hot);
    if i==1;
        title('All','fontsize',16);
    end
    
    if i~=6
        set(gca,'xtick',[],'ytick',[]);
    end
    
    if i==6
        xlabel('Lon','fontsize',16);
        ylabel('Pressure','fontsize',16);
    end
    
%     text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
%     text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    
    axes(h((i-1)*3+2))
    u_here_e=dcp_total_e_u(:,:,i);
    w_here_e=dcp_total_e(:,:,i);
    vel_color=sqrt(u_here_e.^2+(w_here_e./5).^2);
    
    uu=u_here_e;
    ww=w_here_e;
    vel_here_e=sqrt(uu.^2+ww.^2);
    
    contourf(lon_w,level_w./10,(vel_color)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((uu(1:4:end,:))./(vel_here_e(1:4:end,:)))',((ww(1:4:end,:))./(vel_here_e(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(h((i-1)*3+2),color_hot);
    
    if i==1;
        title('ENSO+','fontsize',16);
    end
    
%     text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
%     text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
    
    axes(h((i-1)*3+3))
    u_here_e=dcp_total_l_u(:,:,i);
    w_here_e=dcp_total_l(:,:,i);
    vel_color=sqrt(u_here_e.^2+(w_here_e./5).^2);
    
    uu=u_here_e;
    ww=w_here_e;
    vel_here_e=sqrt(uu.^2+ww.^2);
    
    contourf(lon_w,level_w./10,(vel_color)',linspace(-6,6,500),'linestyle','none');
    axis equal
    hold on
    quiver(lon_full(:,1:4:end),(level_full(:,1:4:end))./10,((uu(1:4:end,:))./(vel_here_e(1:4:end,:)))',((ww(1:4:end,:))./(vel_here_e(1:4:end,:)))',0.5,'autoscale','on','color','k');
    hold on
    plot(94.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    hold on
    plot(152.5*ones(100,1),(linspace(0,1100./10,100))','k','linewidth',2);
    ylim([100 1050]./10);
    set(gca,'ydir','reverse');
    set(gca,'xtick',[],'ytick',[]);
    colormap(h((i-1)*3+3),color_hot);
    if i==1;
        title('ENSO-','fontsize',16);
    end

%     text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) '):' num2str(round(label_pro_used(i)*100,2)) '%'];
%     text(30,900,text_here,'fontsize',12,'fontweight','bold');
    caxis([0 5]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='m/s';


%% SOM Large SST
load('sst_large','l*');
lon=lon_full(lon_loc);lat=lat_full(lat_loc);
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_anom_som_enso');
full_nodes_used=[4 2;4 1;3 1;2 1;1 1;1 2;1 3;2 3;3 3;4 3];
index_true=[8 4 3 2 1 5 9 10 11 12];

dcp_total=sst_som_enso(:,:,index_true,3);
dcp_total_e=sst_som_enso(:,:,index_true,1);
dcp_total_l=sst_som_enso(:,:,index_true,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(10,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:10;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=10
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) ')'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-1.2 1.2]);
end

hp4=get(h(30),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large SST
load('sst_in_rmm_enso');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');
load('sst_anom_mjo_enso_large');

dcp_total=sst_in_rmm_enso(:,:,:,3);
dcp_total_e=sst_in_rmm_enso(:,:,:,1);
dcp_total_l=sst_in_rmm_enso(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-1.2 1.2]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% OMI Large SST
load('sst_large','l*');
lon=lon_full(lon_loc);lat=lat_full(lat_loc);
load('colormap_nature');
load('inde_node');
load('sst_anom_omi_enso_large');

dcp_total=sst_anom_omi_enso(:,:,:,3);
dcp_total_e=sst_anom_omi_enso(:,:,:,1);
dcp_total_l=sst_anom_omi_enso(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['OMI Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-1.2 1.2]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large SST - no IOD
load('sst_in_rmm_enso_noiod');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');

dcp_total=sst_in_rmm_enso(:,:,:,3);
dcp_total_e=sst_in_rmm_enso(:,:,:,1);
dcp_total_l=sst_in_rmm_enso(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-1.2 1.2]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% SOM Large ENSO - no iod
load('sst_large','l*');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_in_som_enso_noiod');
full_nodes_used=[4 2;4 1;3 1;2 1;1 1;1 2;1 3;2 3;3 3;4 3];
index_true=[8 4 3 2 1 5 9 10 11 12];

dcp_total=sst_in_som_enso(:,:,index_true,3);
dcp_total_e=sst_in_som_enso(:,:,index_true,1);
dcp_total_l=sst_in_som_enso(:,:,index_true,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(10,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:10;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=10
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) ')'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-1.2 1.2]);
end

hp4=get(h(30),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large SST 
load('sst_in_rmm_enso');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');

dcp_total=sst_in_rmm_enso(:,:,:,3);
dcp_total_e=sst_in_rmm_enso(:,:,:,1);
dcp_total_l=sst_in_rmm_enso(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-1.2 1.2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-1.2 1.2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-1.2 1.2]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large IOD
load('sst_in_rmm_iod');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');

dcp_total=sst_rmm_iod(:,:,:,3);
dcp_total_e=sst_rmm_iod(:,:,:,1);
dcp_total_l=sst_rmm_iod(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-3,3,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.6 0.6]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-0.6 0.6]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-6,6,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-0.6 0.6]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large IOD - no enso
load('sst_in_rmm_iod_noenso');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');

dcp_total=sst_rmm_iod(:,:,:,3);
dcp_total_e=sst_rmm_iod(:,:,:,1);
dcp_total_l=sst_rmm_iod(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-1.2,1.2,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.6 0.6]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-1.5,1.5,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('IOD+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-0.6 0.6]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-1.5,1.5,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('IOD- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-0.6 0.6]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% OMI Large IOD - no enso
load('sst_in_rmm_iod_noenso');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');

dcp_total=sst_rmm_iod(:,:,:,3);
dcp_total_e=sst_rmm_iod(:,:,:,1);
dcp_total_l=sst_rmm_iod(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-1.2,1.2,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.6 0.6]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-1.5,1.5,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-0.6 0.6]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-1.5,1.5,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-0.6 0.6]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% SOM Large IOD - no enso
load('sst_large','l*');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('som_results_12','label_som');
load('inde_node');
load('sst_in_som_iod_noenso');
full_nodes_used=[4 2;4 1;3 1;2 1;1 1;1 2;1 3;2 3;3 3;4 3];
index_true=[8 4 3 2 1 5 9 10 11 12];

dcp_total=sst_som_iod(:,:,index_true,3);
dcp_total_e=sst_som_iod(:,:,index_true,1);
dcp_total_l=sst_som_iod(:,:,index_true,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(10,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:10;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-1.2,1.2,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    if i~=10
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['Node (' num2str(full_nodes_used(i,1)) ',' num2str(full_nodes_used(i,2)) ')'];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.6 0.6]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i)-dcp_total(:,:,i))',linspace(-1.2,1.2,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-0.6 0.6]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i)-dcp_total(:,:,i))',linspace(-1.2,1.2,500),'linestyle','none');
    
    m_coast('patch',[0 0 0],'linewidth',2);
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-0.6 0.6]);
end

hp4=get(h(30),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large SST - Decomposite ENSO
load('sst_large_decomposite_plot','sst_enso_p');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');
load('sst_anom_mjo_enso_large');

dcp_total=sst_enso_p(:,:,:,3);
dcp_total_e=sst_enso_p(:,:,:,1);
dcp_total_l=sst_enso_p(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-2,2,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-2 2]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-2,2,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-2 2]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-2,2,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-2 2]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large SST - Decomposite MJO
load('sst_large_decomposite_plot','sst_rmm_p');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');
load('sst_anom_mjo_enso_large');

dcp_total=sst_rmm_p(:,:,:,3);
dcp_total_e=sst_rmm_p(:,:,:,1);
dcp_total_l=sst_rmm_p(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-0.4,0.4,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.4 0.4]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-0.4,0.4,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-0.4 0.4]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-0.4,0.4,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-0.4 0.4]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% RMM Large SST - Decomposite MJOENSO
load('sst_large_decomposite_plot','sst_ensormm_p');
lon=(30:2:300)';
lat=(-25:2:25)';
load('colormap_nature');
load('inde_node');
load('sst_anom_mjo_enso_large');

dcp_total=sst_ensormm_p(:,:,:,3);
dcp_total_e=sst_ensormm_p(:,:,:,1);
dcp_total_l=sst_ensormm_p(:,:,:,2);

m_proj('miller','lon',[nanmin(lon) nanmax(lon)],'lat',[nanmin(lat) nanmax(lat)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);


for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-0.3,0.3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-0.3 0.3]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-0.3,0.3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-0.3 0.3]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-0.3,0.3,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-0.3 0.3]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% total cloud decomposite - ENSO
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('hgg_decomposite_plot');
load('lon_lat_isccp');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;

dcp_total=hgg_enso_p(:,:,:,3);
dcp_total_e=hgg_enso_p(:,:,:,1);
dcp_total_l=hgg_enso_p(:,:,:,2);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-15,15,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-15,15,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-15 15]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-15,15,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-15 15]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% total cloud decomposite - MJO
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('hgg_decomposite_plot');
load('lon_lat_isccp');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;

dcp_total=hgg_rmm_p(:,:,:,3);
dcp_total_e=hgg_rmm_p(:,:,:,1);
dcp_total_l=hgg_rmm_p(:,:,:,2);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-15,15,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-15 15]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-15,15,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-15 15]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-15,15,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-15 15]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';

%% total cloud decomposite - ENSORMM
addpath('/Volumes/mydirve/cloud_annual/tight_subplot');
addpath('/Volumes/mydirve/cloud_annual/m_map');
load('hgg_decomposite_plot');
load('lon_lat_isccp');
load('colormap_nature');
lon=lon_isccp;lat=lat_isccp;

dcp_total=hgg_ensormm_p(:,:,:,3);
dcp_total_e=hgg_ensormm_p(:,:,:,1);
dcp_total_l=hgg_ensormm_p(:,:,:,2);

m_proj('miller','lon',[nanmin(lon_isccp) nanmax(lon_isccp)],'lat',[nanmin(lat_isccp) nanmax(lat_isccp)]);

figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,3,[0.01 0.01],[0.05 0.05],[0.05 0.07]);

for i=1:8;
    axes(h((i-1)*3+1))
    m_contourf(lon,lat,(dcp_total(:,:,i))',linspace(-5,5,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    if i~=8
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    else
    m_grid('fontsize',14,'linestyle','none');

    end
    colormap(colormap_nature);
    if i==1;
        title('Neutral','fontsize',16);
    end
    
    text_here=['RMM Phase ' num2str(i)];
    m_text(40,-16,text_here,'fontsize',16,'fontweight','bold');
    caxis([-5 5]);
    
    
    axes(h((i-1)*3+2))
    m_contourf(lon,lat,(dcp_total_e(:,:,i))',linspace(-5,5,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO+ - Neutral','fontsize',16);
    end
  

    
    colormap(colormap_nature);
    
    
    caxis([-5 5]);
    
    axes(h((i-1)*3+3))
    m_contourf(lon,lat,(dcp_total_l(:,:,i))',linspace(-5,5,500),'linestyle','none');
    
    m_coast('linewidth',2,'color','k');
    
    
    m_grid('xtick',[],'ytick',[],'fontsize',14);
    if i==1;
        title('ENSO- - Neutral','fontsize',16);
    end

    
    colormap(colormap_nature);
    
    caxis([-5 5]);
end

hp4=get(h(24),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);
s.Label.String='^{o}C';










