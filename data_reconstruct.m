load('cloud_interp_ts','hgg_ca_hourly_ts');
lon_full=repmat((1:59)',1,19,55512,18);
lat_full=repmat((1:19),59,1,55512,18);
time_full=repmat(reshape((1:55512)',1,1,55512),59,19,1,18);
type_full=repmat(reshape((1:18)',1,1,1,18),59,19,55512,1);

ca_ts=hgg_ca_hourly_ts(:);
clear hgg_ca_hourly_ts
lon_ts=lon_full(:);
clear lon_full
lat_ts=lat_full(:);
clear lat_full
time_ts=time_full(:);
clear time_full
type_ts=type_full(:);
clear type_full

load('pc_k','pc_nonnan_index');
ca_ts_c=ca_ts(pc_nonnan_index);
clear ca_ts
lat_ts_c=lat_ts(pc_nonnan_index);
clear lat_ts
lon_ts_c=lon_ts(pc_nonnan_index);
clear lon_ts
time_ts_c=time_ts(pc_nonnan_index);
clear time_ts
type_ts_c=type_ts(pc_nonnan_index);
clear type_ts

idx=ncread('idx.nc','idx');
hgg_ca_k=NaN(59,19,55512,18,4);

for i=1:length(ca_ts_c);
    
    hgg_ca_k(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i),...
        idx(i))=ca_ts_c(i);
    
end

%% getting pc and tau for k
load('cloud_interp_ts','hgg_pc_hourly_ts');
load('pc_k','pc_nonnan_index');
pc_ts_c=hgg_pc_hourly_ts(:);
pc_ts_c=pc_ts_c(pc_nonnan_index);
save pc_ts_c pc_ts_c
clear

load('cloud_interp_ts','hgg_tau_hourly_ts');
load('tau_k','tau_nonnan_index');
tau_ts_c=hgg_tau_hourly_ts(:);
tau_ts_c=tau_ts_c(tau_nonnan_index);
save tau_ts_c tau_ts_c
clear

idx=ncread('idx.nc','idx');
load('full_ts_c','lat_ts_c','lon_ts_c','time_ts_c','type_ts_c');
load('pc_ts_c');
hgg_pc_k=NaN(59,19,55512,18,4);
for i=1:length(pc_ts_c);
    
    hgg_pc_k(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i),...
        idx(i))=pc_ts_c(i);
    
end
save hgg_pc_k hgg_pc_k
clear

idx=ncread('idx.nc','idx');
load('full_ts_c','lat_ts_c','lon_ts_c','time_ts_c','type_ts_c');
load('tau_ts_c');
hgg_tau_k=NaN(59,19,55512,18,4);
for i=1:length(tau_ts_c);
    
    hgg_tau_k(lon_ts_c(i),lat_ts_c(i),time_ts_c(i),type_ts_c(i),...
        idx(i))=tau_ts_c(i);
    
end
save hgg_tau_k hgg_tau_k
clear
%% see p_t_h
pc_high=[180;310;440;560;680;800;2000];
pc_low=[0;180;310;440;560;680;800];

tau_high=[1.3;3.6;9.4;23;60;10000];
tau_low=[0;1.3;3.6;9.4;23;60];

p_t_h=NaN(length(pc_high),length(tau_high));

for i=6:length(pc_high);
    logic_pc=hgg_pc_hourly_ts>=pc_low(i) & hgg_pc_hourly_ts<pc_high(i);
    for j=1:length(tau_high);
        
        logic_tau=hgg_tau_hourly_ts>=tau_low(j) & hgg_tau_hourly_ts<tau_high(j);
        
        ca_here=hgg_ca_hourly_ts(logic_tau & logic_pc);
        p_t_h(i,j)=nansum(ca_here)./(59*19*55512);
    end
end

%% separate store
load('hgg_ca_k');
for i=1:4;
    eval(['hgg_ca_' num2str(i) '_s=hgg_ca_k(:,:,:,:,i);'])
    save(['hgg_ca_' num2str(i)],(['hgg_ca_' num2str(i) '_s']));
    clear *_s
end
clear

load('hgg_pc_k');
for i=1:4;
    eval(['hgg_pc_' num2str(i) '_s=hgg_pc_k(:,:,:,:,i);'])
    save(['hgg_pc_' num2str(i)],(['hgg_pc_' num2str(i) '_s']));
    clear *_s
end
clear

load('hgg_tau_k');
for i=1:4;
    eval(['hgg_tau_' num2str(i) '_s=hgg_tau_k(:,:,:,:,i);'])
    save(['hgg_tau_' num2str(i)],(['hgg_tau_' num2str(i) '_s']));
    clear *_s
end
clear


%% see p_t_h_k
pc_high=[180;310;440;560;680;800;2000];
pc_low=[0;180;310;440;560;680;800];

tau_high=[1.3;3.6;9.4;23;60;10000];
tau_low=[0;1.3;3.6;9.4;23;60];


p_t_h=NaN(length(pc_high),length(tau_high),4);

for k=1:4;
    file_ca=['hgg_ca_' num2str(k)];file_pc=['hgg_pc_' num2str(k)];
    file_tau=['hgg_tau_' num2str(k)];
    load(file_ca);load(file_tau);load(file_pc);
    eval(['hgg_ca_hourly_ts=hgg_ca_' num2str(k) '_s;']);
    eval(['hgg_pc_hourly_ts=hgg_pc_' num2str(k) '_s;']);
    eval(['hgg_tau_hourly_ts=hgg_tau_' num2str(k) '_s;']);
    clear *_s
for i=1:length(pc_high);
    logic_pc=hgg_pc_hourly_ts>=pc_low(i) & hgg_pc_hourly_ts<pc_high(i);
    for j=1:length(tau_high);
        
        logic_tau=hgg_tau_hourly_ts>=tau_low(j) & hgg_tau_hourly_ts<tau_high(j);
        
        ca_here=hgg_ca_hourly_ts(logic_tau & logic_pc);
        p_t_h(i,j,k)=nansum(ca_here)./(59*19*55512);
    end
end

end

    


