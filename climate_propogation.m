%% Full
load('som_results_12','label_som');
event_full=[];
label_here=label_som;
start_here=1;index_here=1;
while index_here<55512
if label_here(index_here+1)~=label_here(index_here);
end_here=index_here;
length_here=end_here-start_here+1;
%som_trans(label_here(start_here),label_here(end_here+1))=som_trans(label_here(start_here),label_here(end_here+1))+length_here;
event_here=[label_here(start_here) label_here(end_here+1) length_here];
event_full=[event_full;event_here];
start_here=index_here+1;
index_here=index_here+1;
else
index_here=index_here+1;
end
end

see=[1 5;5 9;9 10;10 11;11 12;12 8;8 4;4 3;3 2;2 1];
see=see(:,[2 1]);
for i=1:size(event_full);
event_here=event_full(i,:);
if ismember(event_here(1:2),see,'rows') && event_here(3)<8
event_full(i,[1 2])=event_here([2 1]);
end
end
som_trans=zeros(12,12);
for i=1:12;
for j=1:12;
event_here=event_full(event_full(:,1)==i & event_full(:,2)==j,:);
som_trans(i,j)=nansum(event_here(:,3));
end
end

for i=1:12;
som_trans(i,:)=som_trans(i,:)./length(label_som(label_som==i));
end


figure('pos',[10 10 1500 1500]);
loc_x=[1.5 1.5 1.5 1.5 2.5 2.5 2.5 2.5 3.5 3.5 3.5 3.5];
loc_y=[1.5 2.5 3.5 4.5 1.5 2.5 3.5 4.5 1.5 2.5 3.5 4.5];
text_used={'(1,1)','(2,1)','(3,1)','(4,1)','(1,2)','(2,2)','(3,2)',...
    '(4,2)','(1,3)','(2,3)','(3,3)','(4,3)'};
load('color_hot');
index_used=[1 4 7 10 2 5 8 11 3 6 9 12];
h=tight_subplot(4,3,[0.05 0.01],[0.05 0.05],[0.03 0.05]);
for i=1:12;
axes(h(index_used(i)))
data_here=reshape(som_trans(i,:),4,3);
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:4,1:5,data_here);
caxis([0 1]);
colormap(color_hot);
set(gca,'ydir','reverse');
set(gca,'xtick',[],'ytick',[]);
text(loc_x,loc_y,text_used,'FontSize',14,'FontWeight','bold');
title(['Node: ' text_used{i}],'fontsize',14,'fontweight','bold');
end
hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.015  0.95],'fontsize',16);



%% ENSO
load('som_results_12','label_som');
load('enso_diurnal');

label_used=label_som;p_full=NaN(length(enso_used),1);

p_full(enso_used>0.5)=1;
p_full(enso_used<-0.5)=2;
p_full(enso_used>=-0.5 & enso_used<=0.5)=3;

prop_used=NaN(13,3);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:3;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:3;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

xtick=[1.5:3.5];
xticklabel={'ENSO+','ENSO-','Neutral'};
ytick=[1.5:12.5];
yticklabel={'(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)',...
    '(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)'};
% 
% re prop_used
figure('pos',[10 10 1500 1500]);
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(12,3);
prop_re(1,:)=prop_used(1,:);
prop_re(2,:)=prop_used(5,:);
prop_re(3,:)=prop_used(9,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(6,:);
prop_re(6,:)=prop_used(10,:);
prop_re(7,:)=prop_used(3,:);
prop_re(8,:)=prop_used(7,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(4,:);
prop_re(11,:)=prop_used(8,:);
prop_re(12,:)=prop_used(12,:);

prop_re(3,[2 3])=prop_re(3,[3 2]);
prop_re(7,[2 3])=prop_re(7,[3 2]);

prop_re([6 7],:)=prop_re([7 6],:);

prop_re(end+1,:)=prop_re(end,:);
prop_re(:,end+1)=prop_re(:,end);

pcolor(1:4,1:13,prop_re*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-30 30]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');
%% MJO
load('som_results_12','label_som');
load('colormap_nature');
phase=double(ncread('phase.nc','phase'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
end

label_used=label_som;p_full=phase_full;

prop_used=NaN(13,8);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:8;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:8;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

 xtick=[1.5:8.5];
 xticklabel={'1','2','3','4','5','6','7','8'};
 ytick=[1.5:10.5];
 yticklabel={'(4,2)','(4,1)','(3,1)','(2,1)','(1,1)','(1,2)',...
     '(1,3)','(2,3)','(3,3)','(4,3)'};
% 
% re prop_used
figure('pos',[10 10 1500 1500]);
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(10,8);

prop_re(1,:)=prop_used(8,:);
prop_re(2,:)=prop_used(4,:);
prop_re(3,:)=prop_used(3,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(1,:);
prop_re(6,:)=prop_used(5,:);
prop_re(7,:)=prop_used(9,:);
prop_re(8,:)=prop_used(10,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(12,:);

prop_used=prop_re;

prop_used(end+1,:)=prop_used(end,:);
prop_used(:,end+1)=prop_used(:,end);
subplot(2,2,1);
pcolor(1:9,1:11,prop_used*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-25 25]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('MJO Phase','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');
title('Total','fontsize',16,'fontweight','bold');

%% MJO in ENSO

% enso+
load('colormap_nature');
load('som_results_12','label_som');
phase=double(ncread('phase.nc','phase'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
end
load('enso_diurnal');

label_used=label_som(enso_used>0.5);p_full=phase_full(enso_used>0.5);

prop_used=NaN(13,8);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:8;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:8;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

 xtick=[1.5:8.5];
 xticklabel={'1','2','3','4','5','6','7','8'};
 ytick=[1.5:10.5];
 yticklabel={'(4,2)','(4,1)','(3,1)','(2,1)','(1,1)','(1,2)',...
     '(1,3)','(2,3)','(3,3)','(4,3)'};
% 
% re prop_used
subplot(2,2,2);
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(10,8);

prop_re(1,:)=prop_used(8,:);
prop_re(2,:)=prop_used(4,:);
prop_re(3,:)=prop_used(3,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(1,:);
prop_re(6,:)=prop_used(5,:);
prop_re(7,:)=prop_used(9,:);
prop_re(8,:)=prop_used(10,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(12,:);

prop_used=prop_re;

prop_used(end+1,:)=prop_used(end,:);
prop_used(:,end+1)=prop_used(:,end);

pcolor(1:9,1:11,prop_used*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-25 25]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('MJO Phase','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');
title('ENSO+','fontsize',16,'fontweight','bold');

% enso-
load('colormap_nature');
load('som_results_12','label_som');
phase=double(ncread('phase.nc','phase'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
end
load('enso_diurnal');

label_used=label_som(enso_used<-0.5);p_full=phase_full(enso_used<-0.5);

prop_used=NaN(13,8);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:8;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:8;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

 xtick=[1.5:8.5];
 xticklabel={'1','2','3','4','5','6','7','8'};
 ytick=[1.5:10.5];
 yticklabel={'(4,2)','(4,1)','(3,1)','(2,1)','(1,1)','(1,2)',...
     '(1,3)','(2,3)','(3,3)','(4,3)'};
% 
% re prop_used
subplot(2,2,3);
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(10,8);

prop_re(1,:)=prop_used(8,:);
prop_re(2,:)=prop_used(4,:);
prop_re(3,:)=prop_used(3,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(1,:);
prop_re(6,:)=prop_used(5,:);
prop_re(7,:)=prop_used(9,:);
prop_re(8,:)=prop_used(10,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(12,:);

prop_used=prop_re;

prop_used(end+1,:)=prop_used(end,:);
prop_used(:,end+1)=prop_used(:,end);

pcolor(1:9,1:11,prop_used*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-25 25]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('MJO Phase','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');
title('ENSO-','fontsize',16,'fontweight','bold');

% neutral
load('colormap_nature');
load('som_results_12','label_som');
phase=double(ncread('phase.nc','phase'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
end
load('enso_diurnal');

label_used=label_som(enso_used<=0.5 & enso_used>=-0.5);p_full=phase_full(enso_used<=0.5 & enso_used>=-0.5);

prop_used=NaN(13,8);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:8;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:8;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

 xtick=[1.5:8.5];
 xticklabel={'1','2','3','4','5','6','7','8'};
 ytick=[1.5:10.5];
 yticklabel={'(4,2)','(4,1)','(3,1)','(2,1)','(1,1)','(1,2)',...
     '(1,3)','(2,3)','(3,3)','(4,3)'};
% 
% re prop_used
subplot(2,2,4);
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(10,8);

prop_re(1,:)=prop_used(8,:);
prop_re(2,:)=prop_used(4,:);
prop_re(3,:)=prop_used(3,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(1,:);
prop_re(6,:)=prop_used(5,:);
prop_re(7,:)=prop_used(9,:);
prop_re(8,:)=prop_used(10,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(12,:);

prop_used=prop_re;

prop_used(end+1,:)=prop_used(end,:);
prop_used(:,end+1)=prop_used(:,end);

pcolor(1:9,1:11,prop_used*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-25 25]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('MJO Phase','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');
title('Neutral','fontsize',16,'fontweight','bold');

%% ENSO in MJO

% ENSO total
load('som_results_12','label_som');
load('enso_diurnal');

label_used=label_som;p_full=NaN(length(enso_used),1);

p_full(enso_used>0.5)=1;
p_full(enso_used<-0.5)=2;
p_full(enso_used>=-0.5 & enso_used<=0.5)=3;

prop_used=NaN(13,3);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:3;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:3;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

xtick=[1.5:3.5];
xticklabel={'ENSO+','ENSO-','Neutral'};
ytick=[1.5:12.5];
yticklabel={'(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)',...
    '(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)'};

figure('pos',[10 10 1500 1500]);
subplot(3,3,1);
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(12,3);
prop_re(1,:)=prop_used(1,:);
prop_re(2,:)=prop_used(5,:);
prop_re(3,:)=prop_used(9,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(6,:);
prop_re(6,:)=prop_used(10,:);
prop_re(7,:)=prop_used(3,:);
prop_re(8,:)=prop_used(7,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(4,:);
prop_re(11,:)=prop_used(8,:);
prop_re(12,:)=prop_used(12,:);

prop_re(3,[2 3])=prop_re(3,[3 2]);
prop_re(7,[2 3])=prop_re(7,[3 2]);

prop_re([6 7],:)=prop_re([7 6],:);

prop_re(end+1,:)=prop_re(end,:);
prop_re(:,end+1)=prop_re(:,end);

pcolor(1:4,1:13,prop_re*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-30 30]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');

% ENSO 1
load('som_results_12','label_som');
load('enso_diurnal');
load('phase_full');

label_used=label_som;p_full=NaN(length(enso_used),1);

p_full(enso_used>0.5)=1;
p_full(enso_used<-0.5)=2;
p_full(enso_used>=-0.5 & enso_used<=0.5)=3;

p_full=p_full(phase_full==1);label_used=label_used(phase_full==1);

prop_used=NaN(13,3);
for i=1:12;
    label_here=label_used(label_used==i);
    p_here=p_full(label_used==i);
    
    for j=1:3;
    
    prop_used(i,j)=nansum(p_here==j)./length(p_here);
    end
end

for j=1:3;
    prop_used(13,j)=nansum(p_full==j)./length(p_full);
end

xtick=[1.5:3.5];
xticklabel={'ENSO+','ENSO-','Neutral'};
ytick=[1.5:12.5];
yticklabel={'(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)',...
    '(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)'};

figure('pos',[10 10 1500 1500]);
load('colormap_nature');
prop_used(1:12,:)=prop_used(1:12,:)-prop_used(13,:);
prop_used=prop_used(1:12,:);

prop_re=NaN(12,3);
prop_re(1,:)=prop_used(1,:);
prop_re(2,:)=prop_used(5,:);
prop_re(3,:)=prop_used(9,:);
prop_re(4,:)=prop_used(2,:);
prop_re(5,:)=prop_used(6,:);
prop_re(6,:)=prop_used(10,:);
prop_re(7,:)=prop_used(3,:);
prop_re(8,:)=prop_used(7,:);
prop_re(9,:)=prop_used(11,:);
prop_re(10,:)=prop_used(4,:);
prop_re(11,:)=prop_used(8,:);
prop_re(12,:)=prop_used(12,:);

prop_re(3,[2 3])=prop_re(3,[3 2]);
prop_re(7,[2 3])=prop_re(7,[3 2]);

prop_re([6 7],:)=prop_re([7 6],:);

prop_re(end+1,:)=prop_re(end,:);
prop_re(:,end+1)=prop_re(:,end);

pcolor(1:4,1:13,prop_re*100);
colormap(colormap_nature);
set(gca,'xtick',xtick,'xticklabels',xticklabel,'ytick',ytick,'yticklabels',yticklabel,'fontsize',16,'fontweight','bold');
caxis([-30 30]);
s=colorbar('fontsize',16);
s.Label.String='%';
xlabel('','fontsize',16,'fontweight','bold');
ylabel('SOM Nodes','fontsize',16,'fontweight','bold');


%% speed?
load('som_results_12','label_som');
event_full=[];
label_here=label_som;
start_here=1;index_here=1;
while index_here<55512
if label_here(index_here+1)~=label_here(index_here);
end_here=index_here;
length_here=end_here-start_here+1;
%som_trans(label_here(start_here),label_here(end_here+1))=som_trans(label_here(start_here),label_here(end_here+1))+length_here;
event_here=[label_here(start_here) label_here(end_here+1) length_here];
event_full=[event_full;event_here];
start_here=index_here+1;
index_here=index_here+1;
else
index_here=index_here+1;
end
end

for i=2:(size(event_full,1)-1);
    if event_full(i,3)<=8 && event_full(i,2)==event_full(i-1,1) &&...
            event_full(i,1)==event_full(i-1,2)
        event_full(i,1:2)=event_full(i,[2 1]);
    elseif event_full(i,3)<=8 && event_full(i,2)==event_full(i+1,1) &&...
            event_full(i,1)==event_full(i+1,2)
        event_full(i,1:2)=event_full(i,[2 1]);
    end
end

event_full_re=[];
loc=1;
for i=1:size(event_full,1);
    if i==1;
        event_full_re=[event_full_re;event_full(i,:)];
    else
        if event_full(i,1)==event_full(i-1,1) && ...
                event_full(i,2)==event_full(i-1,2) 
            event_full_re(loc,3)=event_full_re(loc,3)+event_full(i,3);
        else
            loc=loc+1;
            event_full_re=[event_full_re;event_full(i,:)];
        end
    end
end

som_speed=zeros(12,12);
for i=1:12;
for j=1:12;
event_here=event_full_re(event_full_re(:,1)==i & event_full_re(:,2)==j & event_full_re(:,3)>=8,:);
som_speed(i,j)=nanmean(event_here(:,3));
end
end
som_speed(1,~ismember([1:12],[5]))=nan;
som_speed(1,5)=15.1154;
som_speed(2,~ismember([1:12],[1]))=nan;
som_speed(2,1)=8.83;
som_speed(3,~ismember([1:12],[2]))=nan;
som_speed(3,2)=8.33;
som_speed(4,~ismember([1:12],[3]))=nan;
som_speed(4,3)=13.9362;
som_speed(5,~ismember([1:12],[9]))=nan;
som_speed(5,9)=16.332;
som_speed(6,:)=nan;
som_speed(7,:)=nan;
som_speed(8,~ismember([1:12],[4]))=nan;
som_speed(8,4)=15.2295;
som_speed(9,~ismember([1:12],[10]))=nan;
som_speed(9,10)=19.4138;
som_speed(10,~ismember([1:12],[11]))=nan;
som_speed(10,11)=24.9262;
som_speed(11,~ismember([1:12],[12]))=nan;
som_speed(11,12)=20.1182;
som_speed(12,~ismember([1:12],[8]))=nan;
som_speed(12,8)=17.2478;

color_here=colormap(jet);
color_here=color_here(end:-1:1,:);
close

figure('pos',[10 10 1500 1500]);
loc_x=[1.5 1.5 1.5 1.5 2.5 2.5 2.5 2.5 3.5 3.5 3.5 3.5];
loc_y=[1.5 2.5 3.5 4.5 1.5 2.5 3.5 4.5 1.5 2.5 3.5 4.5];
text_used={'(1,1)','(2,1)','(3,1)','(4,1)','(1,2)','(2,2)','(3,2)',...
    '(4,2)','(1,3)','(2,3)','(3,3)','(4,3)'};
load('color_hot');
index_used=[1 4 7 10 2 5 8 11 3 6 9 12];
h=tight_subplot(4,3,[0.05 0.01],[0.05 0.05],[0.03 0.05]);
for i=1:12;
axes(h(index_used(i)))
data_here=reshape(som_speed(i,:),4,3);
data_here(end+1,:)=data_here(end,:);
data_here(:,end+1)=data_here(:,end);
pcolor(1:4,1:5,data_here);
caxis([5 30]);
colormap(color_here);
set(gca,'ydir','reverse');
set(gca,'xtick',[],'ytick',[]);
text(loc_x,loc_y,text_used,'FontSize',14,'FontWeight','bold');
title(['Node: ' text_used{i}],'fontsize',14,'fontweight','bold');
end
hp4=get(h(12),'Position');
s=colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)-0.015  0.011  0.95],'fontsize',12);
s.Label.String='Days';

%% MJO speed?
event_full=[];
label_here=phase_full;
start_here=1;index_here=1;
while index_here<55512
if label_here(index_here+1)~=label_here(index_here);
end_here=index_here;
length_here=end_here-start_here+1;
%som_trans(label_here(start_here),label_here(end_here+1))=som_trans(label_here(start_here),label_here(end_here+1))+length_here;
event_here=[label_here(start_here) label_here(end_here+1) length_here];
event_full=[event_full;event_here];
start_here=index_here+1;
index_here=index_here+1;
else
index_here=index_here+1;
end
end

for i=2:(size(event_full,1)-1);
    if event_full(i,3)==8 && event_full(i,2)==event_full(i-1,1) &&...
            event_full(i,1)==event_full(i-1,2)
        event_full(i,1:2)=event_full(i,[2 1]);
    elseif event_full(i,3)==8 && event_full(i,2)==event_full(i+1,1) &&...
            event_full(i,1)==event_full(i+1,2)
        event_full(i,1:2)=event_full(i,[2 1]);
    end
end

event_full_re=[];
loc=1;
for i=1:size(event_full,1);
    if i==1;
        event_full_re=[event_full_re;event_full(i,:)];
    else
        if event_full(i,1)==event_full(i-1,1) && ...
                event_full(i,2)==event_full(i-1,2) 
            event_full_re(loc,3)=event_full_re(loc,3)+event_full(i,3);
        else
            loc=loc+1;
            event_full_re=[event_full_re;event_full(i,:)];
        end
    end
end

mean_speed=NaN(8,1);
mean_speed(1)=nanmean(event_full_re(event_full_re(:,1)==1 & event_full_re(:,2)==2,...
    3));
mean_speed(2)=nanmean(event_full_re(event_full_re(:,1)==2 & event_full_re(:,2)==3,...
    3));
mean_speed(3)=nanmean(event_full_re(event_full_re(:,1)==3 & event_full_re(:,2)==4,...
    3));
mean_speed(4)=nanmean(event_full_re(event_full_re(:,1)==4 & event_full_re(:,2)==5,...
    3));
mean_speed(5)=nanmean(event_full_re(event_full_re(:,1)==5 & event_full_re(:,2)==6,...
    3));
mean_speed(6)=nanmean(event_full_re(event_full_re(:,1)==6 & event_full_re(:,2)==7,...
    3));
mean_speed(7)=nanmean(event_full_re(event_full_re(:,1)==7 & event_full_re(:,2)==8,...
    3));
mean_speed(8)=nanmean(event_full_re(event_full_re(:,1)==8 & event_full_re(:,2)==1,...
    3));
mean_speed_drawing=NaN(2,4);
mean_speed_drawing(1,1)=mean_speed(2);
mean_speed_drawing(2,1)=mean_speed(3);
mean_speed_drawing(1,2)=mean_speed(1);
mean_speed_drawing(2,2)=mean_speed(4);    
mean_speed_drawing(1,3)=mean_speed(8);
mean_speed_drawing(2,3)=mean_speed(5);
mean_speed_drawing(1,4)=mean_speed(7);
mean_speed_drawing(2,4)=mean_speed(6); 

mean_speed_drawing(end+1,:)=mean_speed_drawing(end,:);
mean_speed_drawing(:,end+1)=mean_speed_drawing(:,end);

loc_x=[1.5 1.5 1.5 1.5 2.5 2.5 2.5 2.5];
loc_y=[1.5 2.5 3.5 4.5 1.5 2.5 3.5 4.5];
text_used={'2 - 3','1 - 2','8 - 1','7 - 8','3 - 4','4 - 5','5 - 6','6 - 7'};
pcolor(1:3,1:5,mean_speed_drawing');
colormap(jet);
caxis([4 5]);
set(gca,'xtick',[],'ytick',[]);
text(loc_x,loc_y,text_used,'FontSize',14,'FontWeight','bold');
s=color




