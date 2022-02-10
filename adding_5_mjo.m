addpath('/Volumes/mydirve/cloud_annual');

%% generating idx 41 42
load('tau_ts_c');
load('pc_ts_c');

load('idx');
idx(pc_ts_c<180)=5;

%% generating ca 41 42

hgg_ca_41=NaN(59,19,55512,18);
hgg_ca_42=NaN(59,19,55512,18);
load('idx_4142');
load('full_ts_c');

for i=1:length(ca_ts_c);
    if idx(i)==4
        
        hgg_ca_41(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i)...
            )=ca_ts_c(i);
    elseif idx(i)==5
        hgg_ca_42(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i)...
            )=ca_ts_c(i);
    end
    
end

%% generating pc 41 42
hgg_pc_41=NaN(59,19,55512,18);
hgg_pc_42=NaN(59,19,55512,18);
load('idx_4142');
load('full_ts_c','lat_ts_c','lon_ts_c','time_ts_c','type_ts_c');
load('pc_ts_c');
for i=1:length(pc_ts_c);
    if idx(i)==4
        
        hgg_pc_41(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i)...
            )=pc_ts_c(i);
    elseif idx(i)==5
        hgg_pc_42(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i)...
            )=pc_ts_c(i);
    end
    
end

%% generating tau 41 42
hgg_tau_41=NaN(59,19,55512,18);
hgg_tau_42=NaN(59,19,55512,18);
load('idx_4142');
load('full_ts_c','lat_ts_c','lon_ts_c','time_ts_c','type_ts_c');
load('tau_ts_c');
for i=1:length(tau_ts_c);
    if idx(i)==4
        
        hgg_tau_41(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i)...
            )=tau_ts_c(i);
    elseif idx(i)==5
        hgg_tau_42(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i)...
            )=tau_ts_c(i);
    end
    
end

%% p t h 41 42

% 41
pc_high=[180;310;440;560;680;800;2000];
pc_low=[0;180;310;440;560;680;800];

tau_high=[1.3;3.6;9.4;23;60;10000];
tau_low=[0;1.3;3.6;9.4;23;60];

p_t_h_41=NaN(length(pc_high),length(tau_high));

load('hgg_ca_4142','hgg_ca_41')
hgg_ca_hourly_ts=hgg_ca_41;
clear hgg_ca_41

load('hgg_pc_4142','hgg_pc_41')
hgg_pc_hourly_ts=hgg_pc_41;
clear hgg_pc_41

load('hgg_tau_4142','hgg_tau_41')
hgg_tau_hourly_ts=hgg_tau_41;
clear hgg_tau_41

for i=1:length(pc_high);
    logic_pc=hgg_pc_hourly_ts>=pc_low(i) & hgg_pc_hourly_ts<pc_high(i);
    for j=1:length(tau_high);
        
        logic_tau=hgg_tau_hourly_ts>=tau_low(j) & hgg_tau_hourly_ts<tau_high(j);
        
        ca_here=hgg_ca_hourly_ts(logic_tau & logic_pc);
        p_t_h_41(i,j)=nansum(ca_here)./(59*19*55512);
    end
end

% 42
pc_high=[180;310;440;560;680;800;2000];
pc_low=[0;180;310;440;560;680;800];

tau_high=[1.3;3.6;9.4;23;60;10000];
tau_low=[0;1.3;3.6;9.4;23;60];

p_t_h_42=NaN(length(pc_high),length(tau_high));

load('hgg_ca_4142','hgg_ca_42')
hgg_ca_hourly_ts=hgg_ca_42;
clear hgg_ca_42

load('hgg_pc_4142','hgg_pc_42')
hgg_pc_hourly_ts=hgg_pc_42;
clear hgg_pc_42

load('hgg_tau_4142','hgg_tau_42')
hgg_tau_hourly_ts=hgg_tau_42;
clear hgg_tau_42

for i=1:length(pc_high);
    logic_pc=hgg_pc_hourly_ts>=pc_low(i) & hgg_pc_hourly_ts<pc_high(i);
    for j=1:length(tau_high);
        
        logic_tau=hgg_tau_hourly_ts>=tau_low(j) & hgg_tau_hourly_ts<tau_high(j);
        
        ca_here=hgg_ca_hourly_ts(logic_tau & logic_pc);
        p_t_h_42(i,j)=nansum(ca_here)./(59*19*55512);
    end
end

%% MJO active
addpath('/Volumes/mydirve/cloud_annual');
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');

phase=double(ncread('phase.nc','phase'));
amp=double(ncread('amp.nc','amplitude'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
amp=amp((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);
amp_full=NaN(length(amp)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
    amp_full((1:8)+(i-1)*8)=amp(i);
end

% mjo anomaly

load('hgg_ca_anom_total');
load('hgg_ca_k_anom');
load('hgg_ca_4142_anom');

hgg_ca_anom_mjo_full=NaN(59,19,4,5);
hgg_ca_anom_mjo_41=NaN(59,19,4);
hgg_ca_anom_mjo_42=NaN(59,19,4);

% 8 - 1
hgg_ca_anom_mjo_full(:,:,1,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1,:),3);
hgg_ca_anom_mjo_full(:,:,1,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1),3);
hgg_ca_anom_mjo_41(:,:,1)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1),3);
hgg_ca_anom_mjo_42(:,:,1)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1),3);

% 2 - 3
hgg_ca_anom_mjo_full(:,:,2,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1,:),3);
hgg_ca_anom_mjo_full(:,:,2,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1),3);
hgg_ca_anom_mjo_41(:,:,2)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1),3);
hgg_ca_anom_mjo_42(:,:,2)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1),3);

% 4 - 5 
hgg_ca_anom_mjo_full(:,:,3,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1,:),3);
hgg_ca_anom_mjo_full(:,:,3,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1),3);
hgg_ca_anom_mjo_41(:,:,3)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1),3);
hgg_ca_anom_mjo_42(:,:,3)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1),3);

% 6 - 7
hgg_ca_anom_mjo_full(:,:,4,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1,:),3);
hgg_ca_anom_mjo_full(:,:,4,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1),3);
hgg_ca_anom_mjo_41(:,:,4)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1),3);
hgg_ca_anom_mjo_42(:,:,4)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1),3);

%% ENSO 41 42
% enso anomaly
load('hgg_ca_4142_anom');
load('enso_diurnal');

hgg_ca_anom_enso_41=NaN(59,19,3);
hgg_ca_anom_enso_42=NaN(59,19,3);
% el
hgg_ca_anom_enso_41(:,:,1)=nanmean(hgg_ca_41_anom(:,:,enso_used>0.5),3);
hgg_ca_anom_enso_42(:,:,1)=nanmean(hgg_ca_42_anom(:,:,enso_used>0.5),3);

% la
hgg_ca_anom_enso_41(:,:,2)=nanmean(hgg_ca_41_anom(:,:,enso_used<-0.5),3);
hgg_ca_anom_enso_42(:,:,2)=nanmean(hgg_ca_42_anom(:,:,enso_used<-0.5),3);

% ne
hgg_ca_anom_enso_41(:,:,3)=nanmean(hgg_ca_41_anom(:,:,(enso_used>=-0.5 & enso_used<=0.5)),3);
hgg_ca_anom_enso_42(:,:,3)=nanmean(hgg_ca_42_anom(:,:,(enso_used>=-0.5 & enso_used<=0.5)),3);

%% 41 42 amp

load('hgg_ca_4142_sum');
load('lon_lat_isccp');
date_num = length(datenum(1997,1,1):datenum(2015,12,31));

hgg_ca_41_d=NaN(59,19,date_num,8);
hgg_ca_42_d=NaN(59,19,date_num,8);

for i=1:date_num
    hgg_ca_41_d(:,:,i,:) = hgg_ca_41(:,:,(1:8)+(i-1)*8,:);
    hgg_ca_42_d(:,:,i,:) = hgg_ca_42(:,:,(1:8)+(i-1)*8);
end

amp_cloud_41=NaN(59,19,date_num);
amp_cloud_42=NaN(59,19,date_num);
hour_data=0:3:21;
hour_example=0:0.1:23.9;
x=parpool(4);
x.IdleTimeout=6000;

lon_re=lon_isccp;lat_re=lat_isccp;
load('lon_lat_isccp');
for i=1:size(hgg_ca_41_d,1);
    tic
    if lon_re(i)<112.5
        offset=7;
    elseif lon_re(i)>=112.5 && lon_re(i)<127.5
        offset=8;
    else
        offset=9;
    end
    for j=1:size(hgg_ca_41_d,2);
        for m=1:size(hgg_ca_41_d,3);
            
            cloud_here=squeeze(hgg_ca_41_d(i,j,m,:));
%             hour_data_here=m_full(m)+(hour_data)./24;
%             hour_data_here=hour_data_here(~isnan(cloud_here));
            cloud_here=cloud_here(~isnan(cloud_here));
            if length(cloud_here)>=3
                %                     mdl_here=fit(hour_data_here(:),cloud_here,'a*sin((pi./12)*x+b)+c');
                %                     coef_here=coeffvalues(mdl_here);
                %                     amp_cloud(i,j,m,k)=coef_here(1);
                %                     amp_example=mdl_here(hour_example);
                %                     maxhour=nanmean(hour_example((amp_example==nanmax(amp_example))));
                %                     lct_cloud(i,j,m,k)=maxhour;
                amp_cloud_41(i,j,m)=nanmax(cloud_here)-nanmin(cloud_here);
%                 lst_cloud_clim(i,j,m)=hour_data_here(nanmin(find(cloud_here==nanmax(cloud_here))));
            end
            
            
            cloud_here=squeeze(hgg_ca_42_d(i,j,m,:));
%             hour_data_here=m_full(m)+(hour_data)./24;
%             hour_data_here=hour_data_here(~isnan(cloud_here));
            cloud_here=cloud_here(~isnan(cloud_here));
            if length(cloud_here)>=3
                %                     mdl_here=fit(hour_data_here(:),cloud_here,'a*sin((pi./12)*x+b)+c');
                %                     coef_here=coeffvalues(mdl_here);
                %                     amp_cloud(i,j,m,k)=coef_here(1);
                %                     amp_example=mdl_here(hour_example);
                %                     maxhour=nanmean(hour_example((amp_example==nanmax(amp_example))));
                %                     lct_cloud(i,j,m,k)=maxhour;
                amp_cloud_42(i,j,m)=nanmax(cloud_here)-nanmin(cloud_here);
%                 lst_cloud_clim(i,j,m)=hour_data_here(nanmin(find(cloud_here==nanmax(cloud_here))));
            end
            
            
            
        end
    end
    toc
end

%% MJO active amp
% MJO
load('amp_cloud');
load('amp_cloud_4142');
addpath('/Volumes/mydirve/cloud_annual');
 addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');

phase=double(ncread('phase.nc','phase'));
amp=double(ncread('amp.nc','amplitude'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
amp=amp((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);
amp_full=NaN(length(amp)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
    amp_full((1:8)+(i-1)*8)=amp(i);
end
amp_cloud_k_MJO=NaN(59,19,4,4);
amp_cloud_41_MJO=NaN(59,19,4);
amp_cloud_42_MJO=NaN(59,19,4);
amp_cloud_total_MJO=NaN(59,19,4);

amp_cloud_k_mean=squeeze(nanmean(amp_cloud_k,3));
amp_cloud_total_mean=squeeze(nanmean(amp_cloud_total,3));
amp_cloud_41_mean=squeeze(nanmean(amp_cloud_41,3));
amp_cloud_42_mean=squeeze(nanmean(amp_cloud_42,3));

amp_cloud_k_MJO(:,:,1,:)=nanmean(amp_cloud_k(:,:,ismember(phase,[8 1]) & amp>1,:),3);
amp_cloud_k_MJO(:,:,2,:)=nanmean(amp_cloud_k(:,:,ismember(phase,[2 3]) & amp>1,:),3);
amp_cloud_k_MJO(:,:,3,:)=nanmean(amp_cloud_k(:,:,ismember(phase,[4 5]) & amp>1,:),3);
amp_cloud_k_MJO(:,:,4,:)=nanmean(amp_cloud_k(:,:,ismember(phase,[6 7]) & amp>1,:),3);

amp_cloud_total_MJO(:,:,1)=nanmean(amp_cloud_total(:,:,ismember(phase,[8 1]) & amp>1),3);
amp_cloud_total_MJO(:,:,2)=nanmean(amp_cloud_total(:,:,ismember(phase,[2 3]) & amp>1),3);
amp_cloud_total_MJO(:,:,3)=nanmean(amp_cloud_total(:,:,ismember(phase,[4 5]) & amp>1),3);
amp_cloud_total_MJO(:,:,4)=nanmean(amp_cloud_total(:,:,ismember(phase,[6 7]) & amp>1),3);

amp_cloud_41_MJO(:,:,1)=nanmean(amp_cloud_41(:,:,ismember(phase,[8 1]) & amp>1),3);
amp_cloud_41_MJO(:,:,2)=nanmean(amp_cloud_41(:,:,ismember(phase,[2 3]) & amp>1),3);
amp_cloud_41_MJO(:,:,3)=nanmean(amp_cloud_41(:,:,ismember(phase,[4 5]) & amp>1),3);
amp_cloud_41_MJO(:,:,4)=nanmean(amp_cloud_41(:,:,ismember(phase,[6 7]) & amp>1),3);

amp_cloud_42_MJO(:,:,1)=nanmean(amp_cloud_42(:,:,ismember(phase,[8 1]) & amp>1),3);
amp_cloud_42_MJO(:,:,2)=nanmean(amp_cloud_42(:,:,ismember(phase,[2 3]) & amp>1),3);
amp_cloud_42_MJO(:,:,3)=nanmean(amp_cloud_42(:,:,ismember(phase,[4 5]) & amp>1),3);
amp_cloud_42_MJO(:,:,4)=nanmean(amp_cloud_42(:,:,ismember(phase,[6 7]) & amp>1),3);

%% ENSO 41 42
load('amp_cloud_4142');
load('enso_diurnal');
enso_day=NaN(length(enso_used)./8,1);

for i=1:(length(enso_used)./8)
    enso_day(i)=enso_used(1+(i-1)*8);
end

amp_cloud_41_mean=squeeze(nanmean(amp_cloud_41,3));
amp_cloud_42_mean=squeeze(nanmean(amp_cloud_42,3));

amp_cloud_41_ENSO=NaN(59,19,3);
amp_cloud_42_ENSO=NaN(59,19,3);

amp_cloud_41_ENSO(:,:,1)=nanmean(amp_cloud_41(:,:,enso_day>0.5),3);
amp_cloud_41_ENSO(:,:,2)=nanmean(amp_cloud_41(:,:,enso_day<-0.5),3);
amp_cloud_41_ENSO(:,:,3)=nanmean(amp_cloud_41(:,:,enso_day<=0.5 & enso_day>=-0.5),3);

amp_cloud_42_ENSO(:,:,1)=nanmean(amp_cloud_42(:,:,enso_day>0.5),3);
amp_cloud_42_ENSO(:,:,2)=nanmean(amp_cloud_42(:,:,enso_day<-0.5),3);
amp_cloud_42_ENSO(:,:,3)=nanmean(amp_cloud_42(:,:,enso_day<=0.5 & enso_day>=-0.5),3);

%% MJO WHO4 diagram
 addpath('/Volumes/mydirve/cloud_annual');
 addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');

phase=double(ncread('phase.nc','phase'));
amp=double(ncread('amp.nc','amplitude'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
amp=amp((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);
amp_full=NaN(length(amp)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
    amp_full((1:8)+(i-1)*8)=amp(i);
end

load('som_results_12','label_som');

mjo_index=xlsread('MJO_index.xlsx');
mjo_index=mjo_index((datenum(1997,1,1)-datenum(1995,1,1)+1):end,:);

rmm1=mjo_index(:,4);
rmm2=mjo_index(:,5);

rmm1_full=NaN(length(rmm1)*8,1);
rmm2_full=NaN(length(rmm2)*8,1);

for i=1:length(rmm1);
    rmm1_full((1:8)+(i-1)*8)=rmm1(i);
    rmm2_full((1:8)+(i-1)*8)=rmm2(i);
end

rmm1_som=[];
rmm2_som=[];
for i=1:12;
    rmm1_som=[rmm1_som;nanmean(rmm1_full(label_som==i & amp_full>1))];
    rmm2_som=[rmm2_som;nanmean(rmm2_full(label_som==i & amp_full>1))];
end
    
plot(rmm1_som,rmm2_som,'.','linewidth',2);

%% Cloud Anomaly MJO - ENSO
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('amp_full');load('phase_full');
load('enso_diurnal');
load('hgg_ca_anom_total');

phase_full=phase_full(:);

% enso+

hgg_ca_anom_mjo_full_e=NaN(59,19,4,5);
hgg_ca_anom_mjo_41_e=NaN(59,19,4);
hgg_ca_anom_mjo_42_e=NaN(59,19,4);


% 8 - 1
hgg_ca_anom_mjo_full_e(:,:,1,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used>0.5,:),3);
hgg_ca_anom_mjo_full_e(:,:,1,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_41_e(:,:,1)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_42_e(:,:,1)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used>0.5),3);

% 2 - 3
hgg_ca_anom_mjo_full_e(:,:,2,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used>0.5,:),3);
hgg_ca_anom_mjo_full_e(:,:,2,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_41_e(:,:,2)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_42_e(:,:,2)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used>0.5),3);

% 4 - 5 
hgg_ca_anom_mjo_full_e(:,:,3,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used>0.5,:),3);
hgg_ca_anom_mjo_full_e(:,:,3,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_41_e(:,:,3)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_42_e(:,:,3)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used>0.5),3);

% 6 - 7
hgg_ca_anom_mjo_full_e(:,:,4,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used>0.5,:),3);
hgg_ca_anom_mjo_full_e(:,:,4,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_41_e(:,:,4)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_42_e(:,:,4)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used>0.5),3);

% enso-

hgg_ca_anom_mjo_full_l=NaN(59,19,4,5);
hgg_ca_anom_mjo_41_l=NaN(59,19,4);
hgg_ca_anom_mjo_42_l=NaN(59,19,4);


% 8 - 1
hgg_ca_anom_mjo_full_l(:,:,1,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used<-0.5,:),3);
hgg_ca_anom_mjo_full_l(:,:,1,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_41_l(:,:,1)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_42_l(:,:,1)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[8 1]) & amp_full>1 & enso_used<-0.5),3);

% 2 - 3
hgg_ca_anom_mjo_full_l(:,:,2,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used<-0.5,:),3);
hgg_ca_anom_mjo_full_l(:,:,2,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_41_l(:,:,2)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_42_l(:,:,2)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[2 3]) & amp_full>1 & enso_used<-0.5),3);

% 4 - 5 
hgg_ca_anom_mjo_full_l(:,:,3,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used<-0.5,:),3);
hgg_ca_anom_mjo_full_l(:,:,3,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_41_l(:,:,3)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_42_l(:,:,3)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[4 5]) & amp_full>1 & enso_used<-0.5),3);

% 6 - 7
hgg_ca_anom_mjo_full_l(:,:,4,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used<-0.5,:),3);
hgg_ca_anom_mjo_full_l(:,:,4,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_41_l(:,:,4)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_42_l(:,:,4)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[6 7]) & amp_full>1 & enso_used<-0.5),3);

%% Cloud Anomaly MJO - ENSO 1 - 8
addpath('/Volumes/mydirve/cloud_annual');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('amp_full');load('phase_full');
load('enso_diurnal');
load('hgg_ca_anom_total');

phase_full=phase_full(:);

% enso+

hgg_ca_anom_mjo_full_e=NaN(59,19,8,5);
hgg_ca_anom_mjo_41_e=NaN(59,19,8);
hgg_ca_anom_mjo_42_e=NaN(59,19,8);

% enso-

hgg_ca_anom_mjo_full_l=NaN(59,19,8,5);
hgg_ca_anom_mjo_41_l=NaN(59,19,8);
hgg_ca_anom_mjo_42_l=NaN(59,19,8);

for i=1:8

hgg_ca_anom_mjo_full_e(:,:,i,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used>0.5,:),3);
hgg_ca_anom_mjo_full_e(:,:,i,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_41_e(:,:,i)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used>0.5),3);
hgg_ca_anom_mjo_42_e(:,:,i)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used>0.5),3);

hgg_ca_anom_mjo_full_l(:,:,i,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used<-0.5,:),3);
hgg_ca_anom_mjo_full_l(:,:,i,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_41_l(:,:,i)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used<-0.5),3);
hgg_ca_anom_mjo_42_l(:,:,i)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used<-0.5),3);
end



%% MJO index

% amp > 1

load('amp_full');load('enso_diurnal');load('phase_full');
phase_full=phase_full(:);
amp_drawing=NaN(8,4);

for i=1:8;
    see=amp_full(phase_full==i & enso_used>0.5);
    amp_drawing(i,1)=nansum(see>1)./length(see);
    see=amp_full(phase_full==i & enso_used<-0.5);
    amp_drawing(i,2)=nansum(see>1)./length(see);
    see=amp_full(phase_full==i & enso_used<=0.5 & enso_used>=-0.5);
    amp_drawing(i,3)=nansum(see>1)./length(see);
    see=amp_full(phase_full==i);
    amp_drawing(i,4)=nansum(see>1)./length(see);
end
figure('pos',[10 10 1500 1500]);
h=bar(amp_drawing);
legend(h,{'ENSO+','ENSO-','Neutral','All'});
xlabel('MJO Phase','fontsize',16,'fontweight','bold');
ylabel('Amp > 1','fontsize',16,'fontweight','bold');
set(gca,'fontsize',16);

% Number of Days
load('amp_full');load('enso_diurnal');load('phase_full');
phase_full=phase_full(:);
days_drawing=NaN(8,4);

for i=1:8;
    see=nansum(phase_full==i & enso_used>0.5 & amp_full>1);
    days_drawing(i,1)=see;
    see=nansum(phase_full==i & enso_used<-0.5 & amp_full>1);
    days_drawing(i,2)=see;
    see=nansum(phase_full==i & enso_used>=-0.5 & enso_used<=0.5 & amp_full>1);
    days_drawing(i,3)=see;
    see=nansum(phase_full==i & amp_full>1);
    days_drawing(i,4)=see;
end

figure('pos',[10 10 1500 1500]);
h=bar(days_drawing);
legend(h,{'ENSO+','ENSO-','Neutral','All'});
xlabel('MJO Phase','fontsize',16,'fontweight','bold');
ylabel('Number of Days','fontsize',16,'fontweight','bold');
set(gca,'fontsize',16);

%% mjo event 
load('amp_full');load('enso_diurnal');load('phase_full');load('rmm');
length_mjo=0;
a=[-1 0];
mjo_event=[];
index_here=73;

ang_full=NaN(55512,1);

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
                mjo_event=[mjo_event;start_here end_here length_mjo];
                length_mjo=0;
            else
                length_mjo=length_mjo+1;
            end
        end
    end
    index_here=index_here+1;
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

for i=1:140
figure
plot(rmm1_full(mjo_event(i,1):mjo_event(i,2)),rmm2_full(mjo_event(i,1):mjo_event(i,2)),'r','linewidth',2)
hold on
text(rmm1_full(mjo_event(i,1)),rmm2_full(mjo_event(i,1)),'start');
hold on
plot(x,y,'b','linewidth',2);
hold on
plot([lin1x(:) lin2x(:) lin3x(:) lin4x(:) lin5x(:) lin6x(:) lin7x(:) flipud(lin8x(:))],...
    [lin1y(:) lin2y(:) lin3y(:) flipud(lin4y(:)) lin5y(:) lin6y(:) lin7y(:) lin8y(:)],'b','linewidth',2);
hold on
text(rmm1_full(mjo_event(i,2)),rmm2_full(mjo_event(i,2)),'end');
xlim([-4 4]);
ylim([-4 4]);
file_here=['mjo' num2str(i) '.png'];
print(file_here,'-dpng')
close all
end

%% MJO active 1 - 8
addpath('/Volumes/mydirve/cloud_annual');
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');
addpath('/Volumes/mydirve/cloud_annual')
load('phase_full');load('amp_full');

% mjo anomaly
load('hgg_ca_anom_total');
load('hgg_ca_k_anom');
load('hgg_ca_4142_anom');
phase_full=phase_full(:);
hgg_ca_anom_mjo_full=NaN(59,19,8,5);
hgg_ca_anom_mjo_41=NaN(59,19,8);
hgg_ca_anom_mjo_42=NaN(59,19,8);

for i=1:8
    hgg_ca_anom_mjo_full(:,:,i,1:4)=nanmean(hgg_ca_k_anom(:,:,ismember(phase_full,i) & amp_full>1,:),3);
    hgg_ca_anom_mjo_full(:,:,i,end)=nanmean(hgg_ca_anom(:,:,ismember(phase_full,i) & amp_full>1),3);
    hgg_ca_anom_mjo_41(:,:,i)=nanmean(hgg_ca_41_anom(:,:,ismember(phase_full,i) & amp_full>1),3);
    hgg_ca_anom_mjo_42(:,:,i)=nanmean(hgg_ca_42_anom(:,:,ismember(phase_full,i) & amp_full>1),3);
end

%% MJO active Amp 1-8
load('amp_cloud');
load('amp_cloud_4142');
addpath('/Volumes/mydirve/cloud_annual');
 addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');

phase=double(ncread('phase.nc','phase'));
amp=double(ncread('amp.nc','amplitude'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
amp=amp((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);
amp_full=NaN(length(amp)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
    amp_full((1:8)+(i-1)*8)=amp(i);
end
amp_cloud_k_MJO=NaN(59,19,8,4);
amp_cloud_41_MJO=NaN(59,19,8);
amp_cloud_42_MJO=NaN(59,19,8);
amp_cloud_total_MJO=NaN(59,19,8);

amp_cloud_k_mean=squeeze(nanmean(amp_cloud_k,3));
amp_cloud_total_mean=squeeze(nanmean(amp_cloud_total,3));
amp_cloud_41_mean=squeeze(nanmean(amp_cloud_41,3));
amp_cloud_42_mean=squeeze(nanmean(amp_cloud_42,3));

for i=1:8;
    
    amp_cloud_k_MJO(:,:,i,:)=nanmean(amp_cloud_k(:,:,ismember(phase,[i]) & amp>1,:),3);
    
    amp_cloud_total_MJO(:,:,i)=nanmean(amp_cloud_total(:,:,ismember(phase,[i]) & amp>1),3);
    
    amp_cloud_41_MJO(:,:,i)=nanmean(amp_cloud_41(:,:,ismember(phase,[i]) & amp>1),3);
    
    amp_cloud_42_MJO(:,:,i)=nanmean(amp_cloud_42(:,:,ismember(phase,[i]) & amp>1),3);
    
end

%% MJO active Amp 1-8 ENSO
load('amp_cloud');
load('amp_cloud_4142');
addpath('/Volumes/mydirve/cloud_annual');
 addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo');

phase=double(ncread('phase.nc','phase'));
amp=double(ncread('amp.nc','amplitude'));
phase=phase((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
amp=amp((datenum(1997,1,1)-datenum(1974,6,1)+1):...
    (datenum(2015,12,31)-datenum(1974,6,1)+1));
phase_full=NaN(length(phase)*8,1);
amp_full=NaN(length(amp)*8,1);

for i=1:length(phase);
    phase_full((1:8)+(i-1)*8)=phase(i);
    amp_full((1:8)+(i-1)*8)=amp(i);
end
amp_cloud_k_MJO=NaN(59,19,8,4);
amp_cloud_41_MJO=NaN(59,19,8);
amp_cloud_42_MJO=NaN(59,19,8);
amp_cloud_total_MJO=NaN(59,19,8);

amp_cloud_k_mean=squeeze(nanmean(amp_cloud_k,3));
amp_cloud_total_mean=squeeze(nanmean(amp_cloud_total,3));
amp_cloud_41_mean=squeeze(nanmean(amp_cloud_41,3));
amp_cloud_42_mean=squeeze(nanmean(amp_cloud_42,3));

for i=1:8;
    
    amp_cloud_k_MJO(:,:,i,:)=nanmean(amp_cloud_k(:,:,ismember(phase,[i]) & amp>1,:),3);
    
    amp_cloud_total_MJO(:,:,i)=nanmean(amp_cloud_total(:,:,ismember(phase,[i]) & amp>1),3);
    
    amp_cloud_41_MJO(:,:,i)=nanmean(amp_cloud_41(:,:,ismember(phase,[i]) & amp>1),3);
    
    amp_cloud_42_MJO(:,:,i)=nanmean(amp_cloud_42(:,:,ismember(phase,[i]) & amp>1),3);
    
end

%% SST aMJO 1 - 8
addpath('/Volumes/mydirve/cloud_annual');
load('sst_anom_d');
load('phase_full');
load('amp_full');
phase_full=phase_full(:);
sst_anom_mjo=NaN(232,72,8);

for i=1:8
sst_anom_mjo(:,:,i)=nanmean(sst_anom_d(:,:,phase_full==i & amp_full>1),3);

end

%% SST OMI 1 - 8
addpath('/Volumes/mydirve/cloud_annual/omi_associated');
addpath('/Volumes/mydirve/cloud_annual');
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo')
load('sst_anom_d');
load('omi_diurnal');
phase_full=phase_full(:);
sst_anom_omi=NaN(232,72,8);

for i=1:8
sst_anom_omi(:,:,i)=nanmean(sst_anom_d(:,:,phase_full==i & omiamp>1),3);

end
save sst_anom_omi sst_anom_omi

%% SST aMJO 1 - 8 ENSO
addpath('/Volumes/mydirve/cloud_annual');
load('sst_anom_d');
load('phase_full');
load('amp_full');
load('enso_diurnal');
phase_full=phase_full(:);
sst_anom_mjo_e=NaN(232,72,8);
sst_anom_mjo_l=NaN(232,72,8);
sst_anom_mjo_n=NaN(232,72,8);

for i=1:8
sst_anom_mjo_e(:,:,i)=nanmean(sst_anom_d(:,:,phase_full==i & amp_full>1 & enso_used>0.5),3);
sst_anom_mjo_l(:,:,i)=nanmean(sst_anom_d(:,:,phase_full==i & amp_full>1 & enso_used<-0.5),3);
end

%% selected mjo
load('mjo_event');
s_mjo=[17 30 41 44 53 62 69 75 84 115 137];
mjo_selected=mjo_event(s_mjo,:);
load('enso_diurnal');
prop_enso=NaN(size(mjo_selected,1),3);

for i=1:size(mjo_selected,1);
    enso_here=enso_used(mjo_selected(i,1):mjo_selected(i,2));
    
    prop_enso(i,1)=nansum(enso_here>0.5)./length(enso_here);
    prop_enso(i,2)=nansum(enso_here<-0.5)./length(enso_here);
    prop_enso(i,3)=nansum(enso_here>=-0.5 & enso_here<=0.5)./length(enso_here);
end

%% Select ENSO 
load('mjo_selected');
load('prop_mjo_enso');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('hgg_ca_anom_total');
load('s_mjo');
load('lon_lat_isccp.mat')

[lat_isccp,lon_isccp]=meshgrid(lat_isccp,lon_isccp);

hgg_ca_anom=hgg_ca_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_41_anom=hgg_ca_41_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_42_anom=hgg_ca_42_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3));
hgg_ca_k_anom=hgg_ca_k_anom.*repmat(cosd(lat_isccp),1,1,size(hgg_ca_anom,3),4);

date_used=datevec(datenum(1997,1,1):(1/8):datenum(2015,12,31)+1-(1/8));
                
% La Nina - 9
mjo_here=mjo_selected(9,:);
hgg_ca_k_anom_l9=squeeze(nanmean(hgg_ca_k_anom(:,:,mjo_here(1):mjo_here(2),:),2));
hgg_ca_41_anom_l9=squeeze(nanmean(hgg_ca_41_anom(:,:,mjo_here(1):mjo_here(2)),2));
hgg_ca_42_anom_l9=squeeze(nanmean(hgg_ca_42_anom(:,:,mjo_here(1):mjo_here(2)),2));
hgg_ca_total_anom_l9=squeeze(nanmean(hgg_ca_anom(:,:,mjo_here(1):mjo_here(2)),2));

% El Nino - 4
mjo_here=mjo_selected(4,:);
hgg_ca_k_anom_e4=squeeze(nanmean(hgg_ca_k_anom(:,:,mjo_here(1):mjo_here(2),:),2));
hgg_ca_41_anom_e4=squeeze(nanmean(hgg_ca_41_anom(:,:,mjo_here(1):mjo_here(2)),2));
hgg_ca_42_anom_e4=squeeze(nanmean(hgg_ca_42_anom(:,:,mjo_here(1):mjo_here(2)),2));
hgg_ca_total_anom_e4=squeeze(nanmean(hgg_ca_anom(:,:,mjo_here(1):mjo_here(2)),2));

% Neutral - 5
mjo_here=mjo_selected(5,:);
hgg_ca_k_anom_n5=squeeze(nanmean(hgg_ca_k_anom(:,:,mjo_here(1):mjo_here(2),:),2));
hgg_ca_41_anom_n5=squeeze(nanmean(hgg_ca_41_anom(:,:,mjo_here(1):mjo_here(2)),2));
hgg_ca_42_anom_n5=squeeze(nanmean(hgg_ca_42_anom(:,:,mjo_here(1):mjo_here(2)),2));
hgg_ca_total_anom_n5=squeeze(nanmean(hgg_ca_anom(:,:,mjo_here(1):mjo_here(2)),2));

%% TRMM aMJO 1 - 8
load('precip_trmm_anom');
load('phase_full');
phase_full=(phase_full(2929:end))';
load('amp_full');
amp_full=amp_full(2929:end);

precip_anom_mjo=NaN(73,233,8);

for i=1:8

precip_anom_mjo(:,:,i)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[i]) & amp_full>1),3);

end

load('enso_diurnal');

precip_anom_mjo_e=NaN(73,233,8);
precip_anom_mjo_l=NaN(73,233,8);
precip_anom_mjo_n=NaN(73,233,8);

enso_used=enso_used(2929:end);

for i=1:8

precip_anom_mjo_e(:,:,i)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used>0.5),3);
precip_anom_mjo_l(:,:,i)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used<-0.5),3);

end

%% TRMM OMI 1 - 8
load('precip_trmm_anom');
load('omi_diurnal');
phase_full=(phase_full(2929:end));
omiamp=omiamp(2929:end);

precip_anom_omi=NaN(73,233,8);

for i=1:8

precip_anom_omi(:,:,i)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[i]) & omiamp>1),3);

end

save precip_anom_omi precip_anom_omi

%% u anom aMJO 1 - 8
load('u_anom');
load('phase_full');
phase_full=phase_full';
load('amp_full');

u_anom_mjo=NaN(233,73,8,2);

for i=1:8

u_anom_mjo(:,:,i,:)=squeeze(nanmean(u_anom(:,:,:,ismember(phase_full,[i]) & amp_full>1),4));

end

load('enso_diurnal');

u_anom_mjo_e=NaN(233,73,8,2);
u_anom_mjo_l=NaN(233,73,8,2);
u_anom_mjo_n=NaN(233,73,8,2);


for i=1:8

u_anom_mjo_e(:,:,i,:)=squeeze(nanmean(u_anom(:,:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used>0.5),4));
u_anom_mjo_l(:,:,i,:)=squeeze(nanmean(u_anom(:,:,:,ismember(phase_full,[i]) & amp_full>1 & enso_used<-0.5),4));

end

%% u anom OMI 1 - 8
load('u_anom');
load('omi_diurnal');

u_anom_omi=NaN(233,73,8,2);

for i=1:8

u_anom_omi(:,:,i,:)=squeeze(nanmean(u_anom(:,:,:,ismember(phase_full,[i]) & omiamp>1),4));

end

save u_anom_omi u_anom_omi

%% Pres anom OMI 1 - 8
load('pres_anom');
load('omi_diurnal');

pres_anom_omi=NaN(233,73,8);

for i=1:8

pres_anom_omi(:,:,i)=nanmean(pres_anom(:,:,ismember(phase_full,[i]) & omiamp>1),3);

end

save pres_anom_omi pres_anom_omi

%% Background SOM
% sst
addpath('/Volumes/mydirve/cloud_annual/omi_associated');
addpath('/Volumes/mydirve/cloud_annual');
addpath('/Volumes/mydirve/cloud_annual/adding_5_mjo')
load('sst_anom_d');
load('som_results_12','label_som');
phase_full=label_som;
sst_anom_som=NaN(232,72,12);

for i=1:12
sst_anom_som(:,:,i)=nanmean(sst_anom_d(:,:,label_som==i),3);

end
save sst_anom_som sst_anom_som
clear

% trmm
load('precip_trmm_anom');
load('som_results_12','label_som');
phase_full=(label_som(2929:end));

precip_anom_som=NaN(73,233,12);

for i=1:12

precip_anom_som(:,:,i)=nanmean(precip_trmm_anom(:,:,ismember(phase_full,[i])),3);

end

save precip_anom_som precip_anom_som
clear

% u
load('u_anom');
load('som_results_12','label_som');

u_anom_som=NaN(233,73,12,2);

for i=1:12

u_anom_som(:,:,i,:)=squeeze(nanmean(u_anom(:,:,:,ismember(label_som,[i])),4));

end

save u_anom_som u_anom_som
clear

% pres
load('pres_anom');
load('som_results_12','label_som');

pres_anom_som=NaN(233,73,12);

for i=1:12

pres_anom_som(:,:,i)=nanmean(pres_anom(:,:,ismember(label_som,[i])),3);

end

save pres_anom_som pres_anom_som
clear

%% dif aMJO enso
% K1 - 4 
load('hgg_anom_aMJO_1_8','hgg_ca_anom_mjo_full');
load('hgg_anom_aMJO_enso_1_8','hgg_ca_anom_mjo_full_e');

for i=1:4
    eval(['k' num2str(i) '_table=hgg_ca_anom_mjo_full_e(:,:,:,i)-hgg_ca_anom_mjo_full(:,:,:,i);'])
    load('lon_lat_isccp');
    [lat,lon]=meshgrid(lat_isccp,lon_isccp);
    eval(['k' num2str(i) '_table=k' num2str(i) '_table.*repmat(cosd(lat),1,1,8);'])
    eval(['k' num2str(i) '_table_f=NaN(8,1);'])
    for j=1:8;
        eval(['see=k' num2str(i) '_table(:,:,j);'])
        eval(['k' num2str(i) '_table_f(j)=nanmean(see(:));'])
    end
end

% Total

load('hgg_anom_aMJO_1_8','hgg_ca_anom_mjo_full');
load('hgg_anom_aMJO_enso_1_8','hgg_ca_anom_mjo_full_e');
kt_table=hgg_ca_anom_mjo_full_e(:,:,:,end)-hgg_ca_anom_mjo_full(:,:,:,end);
load('lon_lat_isccp');
[lat,lon]=meshgrid(lat_isccp,lon_isccp);
kt_table=kt_table.*repmat(cosd(lat),1,1,8);
kt_table_f=NaN(8,1);
for i=1:8;
    see=kt_table(:,:,i);
    kt_table_f(i)=nanmean(see(:));
end

%% dif SOM enso
% K1 - 4 
load('dcp_som_k_re');
load('dcp_12_enso','dcp_12_e');
load('lon_lat_isccp');
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/4);%<=
lon_2=quantile(lon_isccp,2/4);%> <=
lon_3=quantile(lon_isccp,3/4);
lat_1=quantile(lat_isccp,1/2);%<=

lon_logic=[lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3 ...
    lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3];
lat_logic=[lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 ...
    lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1];

dcp_k_table=NaN(4,12,8);

for l=1:8
    lon_logic_here=lon_logic(:,l);
    lat_logic_here=lat_logic(:,l);
for i=1:4
    dcp_table=dcp_12_e(lon_logic_here,lat_logic_here,:,i)-dcp_som_k_re(lon_logic_here,lat_logic_here,:,i);
    [lat,lon]=meshgrid(lat_isccp(lat_logic_here),lon_isccp(lon_logic_here));
    dcp_table=dcp_table.*repmat(cosd(lat),1,1,12);
    dcp_table_f=NaN(12,1);
    for j=1:12
        see=dcp_table(:,:,j);
        dcp_table_f(j)=nanmean(see(:));
    end
    dcp_k_table(i,:,l)=dcp_table_f;
end

end

% dcp total

load('dcp_total_enso','dcp_total_e');
load('dcp_total');
load('lon_lat_isccp');
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/4);%<=
lon_2=quantile(lon_isccp,2/4);%> <=
lon_3=quantile(lon_isccp,3/4);
lat_1=quantile(lat_isccp,1/2);%<=

lon_logic=[lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3 ...
    lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3];
lat_logic=[lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 ...
    lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1];

dcp_total_table=NaN(12,8);

for l=1:8
    lon_logic_here=lon_logic(:,l);
    lat_logic_here=lat_logic(:,l);
    dcp_table=dcp_total_e(lon_logic_here,lat_logic_here,:)-dcp_total(lon_logic_here,lat_logic_here,:);
    [lat,lon]=meshgrid(lat_isccp(lat_logic_here),lon_isccp(lon_logic_here));
    dcp_table=dcp_table.*repmat(cosd(lat),1,1,12);
    dcp_table_f=NaN(12,1);
    for j=1:12
        see=dcp_table(:,:,j);
        dcp_table_f(j)=nanmean(see(:));
    end
    dcp_total_table(:,l)=dcp_table_f;
    
    
    
end

% u250
load('uv_som_enso','u_som_enso');
u_som_enso=squeeze(u_som_enso(:,:,1,:,1));
load('uv_som');
u_som=squeeze(u_som(:,:,1,:));
load('lonlat_wind');
lon_isccp=lon;
lat_isccp=lat;
clear lon lat
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/4);%<=
lon_2=quantile(lon_isccp,2/4);%> <=
lon_3=quantile(lon_isccp,3/4);
lat_1=quantile(lat_isccp,1/2);%<=

lon_logic=[lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3 ...
    lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3];
lat_logic=[lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 ...
    lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1];

u250_table=NaN(12,8);

for l=1:8
    lon_logic_here=lon_logic(:,l);
    lat_logic_here=lat_logic(:,l);
    dcp_table=u_som_enso(lon_logic_here,lat_logic_here,:)-u_som(lon_logic_here,lat_logic_here,:);
    [lat,lon]=meshgrid(lat_isccp(lat_logic_here),lon_isccp(lon_logic_here));
    dcp_table=dcp_table.*repmat(cosd(lat),1,1,12);
    dcp_table_f=NaN(12,1);
    for j=1:12
        see=dcp_table(:,:,j);
        dcp_table_f(j)=nanmean(see(:));
    end
    u250_table(:,l)=dcp_table_f;
end

% u850
load('uv_som_enso','u_som_enso');
u_som_enso=squeeze(u_som_enso(:,:,2,:,1));
load('uv_som');
u_som=squeeze(u_som(:,:,2,:));
load('lonlat_wind');
lon_isccp=lon;
lat_isccp=lat;
clear lon lat
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/4);%<=
lon_2=quantile(lon_isccp,2/4);%> <=
lon_3=quantile(lon_isccp,3/4);
lat_1=quantile(lat_isccp,1/2);%<=

lon_logic=[lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3 ...
    lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3];
lat_logic=[lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 ...
    lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1];

u850_table=NaN(12,8);

for l=1:8
    lon_logic_here=lon_logic(:,l);
    lat_logic_here=lat_logic(:,l);
    dcp_table=u_som_enso(lon_logic_here,lat_logic_here,:)-u_som(lon_logic_here,lat_logic_here,:);
    [lat,lon]=meshgrid(lat_isccp(lat_logic_here),lon_isccp(lon_logic_here));
    dcp_table=dcp_table.*repmat(cosd(lat),1,1,12);
    dcp_table_f=NaN(12,1);
    for j=1:12
        see=dcp_table(:,:,j);
        dcp_table_f(j)=nanmean(see(:));
    end
    u850_table(:,l)=dcp_table_f;
end

% pres
load('pres_som_enso','pres_som_enso');
pres_som_enso=pres_som_enso(:,:,:,1);
load('pres_som');
load('lonlat_wind');
lon_isccp=lon;
lat_isccp=lat;
clear lon lat
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/4);%<=
lon_2=quantile(lon_isccp,2/4);%> <=
lon_3=quantile(lon_isccp,3/4);
lat_1=quantile(lat_isccp,1/2);%<=

lon_logic=[lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3 ...
    lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3];
lat_logic=[lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 ...
    lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1];

pres_table=NaN(12,8);

for l=1:8
    lon_logic_here=lon_logic(:,l);
    lat_logic_here=lat_logic(:,l);
    dcp_table=pres_som_enso(lon_logic_here,lat_logic_here,:)-pres_som(lon_logic_here,lat_logic_here,:);
    [lat,lon]=meshgrid(lat_isccp(lat_logic_here),lon_isccp(lon_logic_here));
    dcp_table=dcp_table.*repmat(cosd(lat),1,1,12);
    dcp_table_f=NaN(12,1);
    for j=1:12
        see=dcp_table(:,:,j);
        dcp_table_f(j)=nanmean(see(:));
    end
    pres_table(:,l)=dcp_table_f;
end

% sst
load('sst_som_enso','sst_som_enso');
sst_som_enso=sst_som_enso(:,:,:,1);
load('sst_anom_som');
sst_som=sst_anom_som;
load('lonlat_sst');
lon_isccp=lon_full(lon_loc);
lat_isccp=lat_full(lat_loc);
clear lon_full lat_full lon_loc lat_loc
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/4);%<=
lon_2=quantile(lon_isccp,2/4);%> <=
lon_3=quantile(lon_isccp,3/4);
lat_1=quantile(lat_isccp,1/2);%<=

lon_logic=[lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3 ...
    lon_isccp<=lon_1 lon_isccp>lon_1 & lon_isccp<=lon_2 lon_isccp>lon_2 & lon_isccp<=lon_3 lon_isccp>lon_3];
lat_logic=[lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 lat_isccp>lat_1 ...
    lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1 lat_isccp<=lat_1];

sst_table=NaN(12,8);

for l=1:8
    lon_logic_here=lon_logic(:,l);
    lat_logic_here=lat_logic(:,l);
    dcp_table=sst_som_enso(lon_logic_here,lat_logic_here,:)-sst_som(lon_logic_here,lat_logic_here,:);
    [lat,lon]=meshgrid(lat_isccp(lat_logic_here),lon_isccp(lon_logic_here));
    dcp_table=dcp_table.*repmat(cosd(lat),1,1,12);
    dcp_table_f=NaN(12,1);
    for j=1:12
        see=dcp_table(:,:,j);
        dcp_table_f(j)=nanmean(see(:));
    end
    sst_table(:,l)=dcp_table_f;
end

%% cut the region?
load('lon_lat_isccp');
[lat_used,lon_used]=meshgrid(lat_isccp,lon_isccp);
lon_1=quantile(lon_isccp,1/3);%<=
lon_2=quantile(lon_isccp,2/3);%> <=
lat_1=quantile(lat_isccp,1/2);%<=

m_coast('linewidth',2,'color','k');
m_grid('fontsize',16);
hold on
m_plot(repmat(lon_1,500,1),(linspace(nanmin(lat_used(:)),nanmax(lat_used(:)),500))');
hold on
m_plot(repmat(lon_2,500,1),(linspace(nanmin(lat_used(:)),nanmax(lat_used(:)),500))');
hold on
m_plot((linspace(nanmin(lon_used(:)),nanmax(lon_used(:)),500))',repmat(lat_1,500,1));





        
    

