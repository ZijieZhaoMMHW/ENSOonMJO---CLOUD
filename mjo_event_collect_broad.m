%% mjo full cycle
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
    
    if ~logic_prop
        
    mjo_amp=[mjo_amp;mjo_event(i,:)];
    amp_index=[amp_index;i];
    end
end

lin1x=linspace(0,0,1000);lin1y=linspace(1,4,1000);
lin2x=linspace(sqrt(2)/2,4,1000);lin2y=linspace(sqrt(2)/2,4,1000);
lin3x=linspace(1,4,1000);lin3y=linspace(0,0,1000);
lin4x=linspace(sqrt(2)/2,4,1000);lin4y=linspace(-4,-sqrt(2)/2,1000);
lin5x=linspace(0,0,1000);lin5y=linspace(-4,-1,1000);
lin6x=linspace(-4,-sqrt(2)/2,1000);lin6y=linspace(-4,-sqrt(2)/2,1000);
lin7x=linspace(-4,-1,1000);lin7y=linspace(0,0,1000);
lin8x=linspace(-4,-sqrt(2)/2,1000);lin8y=linspace(sqrt(2)/2,4,1000);
t=0:pi/100:2*pi;
x=sin(t);
y=cos(t);
load('lon_lat_isccp.mat')
load('colormap_nature');
load('rmm');
load('enso_diurnal');
date_used=(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
figure('pos',[10 10 1500 1500]);
h=tight_subplot(8,5,[0.02 0.01],[0.03 0.03],[0.01 0.01]);
for i=1:40
axes(h(i));
mjo_here=mjo_amp(i,:);
rmm1_here=rmm1_full(mjo_here(1):mjo_here(2));
rmm2_here=rmm2_full(mjo_here(1):mjo_here(2));
enso_here=enso_used(mjo_here(1):mjo_here(2));

plot(rmm1_here,rmm2_here,'k','linewidth',2);
hold on
plot(rmm1_here(enso_here>0.5),rmm2_here(enso_here>0.5),'r','linewidth',2)
hold on
plot(rmm1_here(enso_here<-0.5),rmm2_here(enso_here<-0.5),'b','linewidth',2)
hold on
plot(rmm1_here(enso_here>=-0.5 & enso_here<=0.5),rmm2_here(enso_here>=-0.5 & enso_here<=0.5),'k','linewidth',2)
hold on
text(rmm1_full(mjo_here(1)),rmm2_full(mjo_here(1)),'start');
hold on
plot(x,y,'k','linewidth',2);
hold on
plot([lin1x(:) lin2x(:) lin3x(:) lin4x(:) lin5x(:) lin6x(:) lin7x(:) flipud(lin8x(:))],...
    [lin1y(:) lin2y(:) lin3y(:) flipud(lin4y(:)) lin5y(:) lin6y(:) lin7y(:) lin8y(:)],'k','linewidth',2);
hold on
text(rmm1_full(mjo_here(2)),rmm2_full(mjo_here(2)),'end');
xlim([-4 4]);
ylim([-4 4]);

if i~=36
    set(gca,'xtick',[],'ytick',[]);
end

title([datestr(fix(date_used(mjo_here(1)))) ' - ' datestr(fix(date_used(mjo_here(2))))]);

end

%% SOM full circle
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
    
    if nanmin(label_pro)>0.01 && nanmax(label_pro)<=0.3
    
    som_amp=[som_amp;som_event(i,:)];
    amp_index=[amp_index;i];
    
    end

end

lin1x=linspace(0,0,1000);lin1y=linspace(1,4,1000);
lin2x=linspace(sqrt(2)/2,4,1000);lin2y=linspace(sqrt(2)/2,4,1000);
lin3x=linspace(1,4,1000);lin3y=linspace(0,0,1000);
lin4x=linspace(sqrt(2)/2,4,1000);lin4y=linspace(-4,-sqrt(2)/2,1000);
lin5x=linspace(0,0,1000);lin5y=linspace(-4,-1,1000);
lin6x=linspace(-4,-sqrt(2)/2,1000);lin6y=linspace(-4,-sqrt(2)/2,1000);
lin7x=linspace(-4,-1,1000);lin7y=linspace(0,0,1000);
lin8x=linspace(-4,-sqrt(2)/2,1000);lin8y=linspace(sqrt(2)/2,4,1000);
t=0:pi/100:2*pi;
x=sin(t);
y=cos(t);
load('lon_lat_isccp.mat')
load('colormap_nature');
load('rmm');
load('enso_diurnal');
date_used=(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
figure('pos',[10 10 1500 1500]);
h=tight_subplot(9,5,[0.02 0.01],[0.03 0.03],[0.01 0.01]);
for i=1:45
axes(h(i));
mjo_here=som_amp(i,:);
rmm1_here=rmm1_full(mjo_here(1):mjo_here(2));
rmm2_here=rmm2_full(mjo_here(1):mjo_here(2));
enso_here=enso_used(mjo_here(1):mjo_here(2));

plot(rmm1_here,rmm2_here,'k','linewidth',2);
hold on
plot(rmm1_here(enso_here>0.5),rmm2_here(enso_here>0.5),'r','linewidth',2)
hold on
plot(rmm1_here(enso_here<-0.5),rmm2_here(enso_here<-0.5),'b','linewidth',2)
hold on
plot(rmm1_here(enso_here>=-0.5 & enso_here<=0.5),rmm2_here(enso_here>=-0.5 & enso_here<=0.5),'k','linewidth',2)
hold on
text(rmm1_full(mjo_here(1)),rmm2_full(mjo_here(1)),'start');
hold on
plot(x,y,'k','linewidth',2);
hold on
plot([lin1x(:) lin2x(:) lin3x(:) lin4x(:) lin5x(:) lin6x(:) lin7x(:) flipud(lin8x(:))],...
    [lin1y(:) lin2y(:) lin3y(:) flipud(lin4y(:)) lin5y(:) lin6y(:) lin7y(:) lin8y(:)],'k','linewidth',2);
hold on
text(rmm1_full(mjo_here(2)),rmm2_full(mjo_here(2)),'end');
xlim([-4 4]);
ylim([-4 4]);

if i~=41
    set(gca,'xtick',[],'ytick',[]);
end

title([datestr(fix(date_used(mjo_here(1)))) ' - ' datestr(fix(date_used(mjo_here(2))))]);

end

%% omi full circle
% full event
addpath('/Volumes/mydirve/cloud_annual/omi_associated');
load('omi_diurnal');

length_mjo=0;
a=[-1 0];
omi_event=[];
index_here=73;

ang_full=NaN(55512,1);

rmm1_full=rmm1_omi;
rmm2_full=rmm2_omi;

for i=1:length(ang_full);
    b=[rmm1_full(i) rmm2_full(i)];
    if rmm2_full(i)<=0
        ang=(acos(dot(a,b)/((norm(a)*norm(b)))))/pi*180;
    else
        ang=180-((acos(dot(a,b)/((norm(a)*norm(b)))))/pi*180)+180;
    end
    ang_full(i)=ang;
end

while index_here<55512
    ang=ang_full(index_here);
    if length_mjo==0;
        start_here=index_here;
        length_mjo=length_mjo+1;
    elseif length_mjo>0 
        if length_mjo<=240;
            length_mjo=length_mjo+1;
        elseif ang>90 
            length_mjo=length_mjo+1;
        elseif ang<90
            if nansum(ang_full(index_here:(index_here+40))<=180)./41==1
                end_here=index_here-1;
                omi_event=[omi_event;start_here end_here length_mjo];
                length_mjo=0;
            else
                length_mjo=length_mjo+1;
            end
        end
    end
    index_here=index_here+1;
end

save omi_event omi_event

% broad event
addpath('/Volumes/mydirve/cloud_annual')
load('omi_event');
load('omi_diurnal');
omi_amp=[];
date_used=(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
amp_index=[];

for i=1:size(omi_event,1);
    phase_here=phase_full(omi_event(i,1):omi_event(i,2));
    amp_here=omiamp(omi_event(i,1):omi_event(i,2));
    mjo_prop=[nansum(ismember(phase_here(amp_here>1),[1 2]))./length(phase_here(amp_here>1)) ...
       nansum(ismember(phase_here(amp_here>1),[3 4]))./length(phase_here(amp_here>1)) ...
       nansum(ismember(phase_here(amp_here>1),[5 6]))./length(phase_here(amp_here>1)) ...
       nansum(ismember(phase_here(amp_here>1),[7 8]))./length(phase_here(amp_here>1))];
    
    logic_prop=nanmin(mjo_prop)<0.1 | nanmax(mjo_prop)>0.6;
    
    if ~logic_prop
        
    omi_amp=[omi_amp;omi_event(i,:)];
    amp_index=[amp_index;i];
    end
end

save omi_amp_broad omi_amp

lin1x=linspace(0,0,1000);lin1y=linspace(1,4,1000);
lin2x=linspace(sqrt(2)/2,4,1000);lin2y=linspace(sqrt(2)/2,4,1000);
lin3x=linspace(1,4,1000);lin3y=linspace(0,0,1000);
lin4x=linspace(sqrt(2)/2,4,1000);lin4y=linspace(-4,-sqrt(2)/2,1000);
lin5x=linspace(0,0,1000);lin5y=linspace(-4,-1,1000);
lin6x=linspace(-4,-sqrt(2)/2,1000);lin6y=linspace(-4,-sqrt(2)/2,1000);
lin7x=linspace(-4,-1,1000);lin7y=linspace(0,0,1000);
lin8x=linspace(-4,-sqrt(2)/2,1000);lin8y=linspace(sqrt(2)/2,4,1000);
t=0:pi/100:2*pi;
x=sin(t);
y=cos(t);
load('lon_lat_isccp.mat')
load('colormap_nature');
load('omi_diurnal');
load('enso_diurnal');
date_used=(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
figure('pos',[10 10 1500 1500]);
h=tight_subplot(9,5,[0.02 0.01],[0.03 0.03],[0.01 0.01]);
for i=1:44
axes(h(i));
mjo_here=omi_amp(i,:);
rmm1_here=rmm1_omi(mjo_here(1):mjo_here(2));
rmm2_here=rmm2_omi(mjo_here(1):mjo_here(2));
enso_here=enso_used(mjo_here(1):mjo_here(2));

plot(rmm1_here,rmm2_here,'k','linewidth',2);
hold on
plot(rmm1_here(enso_here>0.5),rmm2_here(enso_here>0.5),'r','linewidth',2)
hold on
plot(rmm1_here(enso_here<-0.5),rmm2_here(enso_here<-0.5),'b','linewidth',2)
hold on
plot(rmm1_here(enso_here>=-0.5 & enso_here<=0.5),rmm2_here(enso_here>=-0.5 & enso_here<=0.5),'k','linewidth',2)
hold on
text(rmm1_omi(mjo_here(1)),rmm2_omi(mjo_here(1)),'start');
hold on
plot(x,y,'k','linewidth',2);
hold on
plot([lin1x(:) lin2x(:) lin3x(:) lin4x(:) lin5x(:) lin6x(:) lin7x(:) flipud(lin8x(:))],...
    [lin1y(:) lin2y(:) lin3y(:) flipud(lin4y(:)) lin5y(:) lin6y(:) lin7y(:) lin8y(:)],'k','linewidth',2);
hold on
text(rmm1_omi(mjo_here(2)),rmm2_omi(mjo_here(2)),'end');
xlim([-4 4]);
ylim([-4 4]);

if i~=41
    set(gca,'xtick',[],'ytick',[]);
end

title([datestr(fix(date_used(mjo_here(1)))) ' - ' datestr(fix(date_used(mjo_here(2))))]);

end

%% MJO prop ENSO
load('mjo_amp_broad');
load('enso_diurnal');
prop_enso=NaN(size(mjo_amp,1),3);

for i=1:size(mjo_amp,1);
    enso_here=enso_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

[~,ind]=nanmax(prop_enso,[],2);

save mjo_prop_enso prop_enso ind

%% MJO prop IOD
load('mjo_amp_broad');
load('iod_used');
prop_iod=NaN(size(mjo_amp,1),2);

for i=1:size(mjo_amp,1);
    enso_here=iod_used(mjo_amp(i,1):mjo_amp(i,2));
    
    prop_iod(i,1)=nansum(enso_here>0)./length(enso_here);
    prop_iod(i,2)=nansum(enso_here<-0)./length(enso_here);
end

[~,ind]=nanmax(prop_iod,[],2);

save mjo_prop_enso prop_enso ind

%% SOM prop ENSO
load('som_amp_broad');
load('enso_diurnal');
prop_enso=NaN(size(som_amp,1),3);

for i=1:size(som_amp,1);
    enso_here=enso_used(som_amp(i,1):som_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

[~,ind]=nanmax(prop_enso,[],2);

save som_prop_enso prop_enso ind

%% OMI prop ENSO
load('omi_amp_broad');
load('enso_diurnal');
prop_enso=NaN(size(omi_amp,1),3);

for i=1:size(omi_amp,1);
    enso_here=enso_used(omi_amp(i,1):omi_amp(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

[~,ind]=nanmax(prop_enso,[],2);

save omi_prop_enso prop_enso ind

%% MJO ENSO variation
load('mjo_amp_broad');
load('mjo_prop_enso');
load('amp_full');
load('phase_full');

mean_dur=[nanmean(mjo_amp(ind==1,3)) nanmean(mjo_amp(ind==2,3)) nanmean(mjo_amp(ind==3,3))]./8
mjo_dist=NaN(size(mjo_amp,1),8);
for i=1:size(mjo_amp,1);
    phase_here=phase_full(mjo_amp(i,1):mjo_amp(i,2));
    for j=1:8
        mjo_dist(i,j)=nansum(phase_here==j);
        
    end
end

mjo_36=nansum(mjo_dist(:,3:6),2);
mean_dur_36=[nanmean(mjo_36(ind==1)) nanmean(mjo_36(ind==2)) nanmean(mjo_36(ind==3))]./8

%% SOM ENSO variation
load('som_amp_broad');
load('som_prop_enso');
load('som_results_12','label_som');

mean_dur=[nanmean(som_amp(ind==1,3)) nanmean(som_amp(ind==2,3)) nanmean(som_amp(ind==3,3))]./8
som_dist=NaN(size(som_amp,1),8);
for i=1:size(som_amp,1);
    phase_here=label_som(som_amp(i,1):som_amp(i,2));
    for j=1:12
        som_dist(i,j)=nansum(phase_here==j);
        
    end
end

index_true=[3 2 1 5 9 10];

som_36=nansum(som_dist(:,index_true),2);
mean_dur_36=[nanmean(som_36(ind==1)) nanmean(som_36(ind==2)) nanmean(som_36(ind==3))]./8


%% OMI ENSO variation
load('omi_amp_broad');
load('omi_prop_enso');
load('omi_diurnal.mat','phase_full')

mean_dur=[nanmean(omi_amp(ind==1,3)) nanmean(omi_amp(ind==2,3)) nanmean(omi_amp(ind==3,3))]./8

omi_dist=NaN(size(omi_amp,1),8);
for i=1:size(omi_amp,1);
    phase_here=phase_full(omi_amp(i,1):omi_amp(i,2));
    for j=1:8
        omi_dist(i,j)=nansum(phase_here==j);
        
    end
end

omi_36=nansum(omi_dist(:,3:6),2);
mean_dur_36=[nanmean(omi_36(ind==1)) nanmean(omi_36(ind==2)) nanmean(omi_36(ind==3))]./8
