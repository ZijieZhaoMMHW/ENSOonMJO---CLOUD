%% COEF
load('precip_interp_anom');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
hgg_ca_41_anom=hgg_ca_41_anom(:,:,2929:end);
hgg_ca_42_anom=hgg_ca_42_anom(:,:,2929:end);
hgg_ca_k_anom=hgg_ca_k_anom(:,:,2929:end,:);

rsq=NaN(59,19);
coef_1=NaN(59,19,2);
coef_2=NaN(59,19,2);
coef_3=NaN(59,19,2);
coef_4=NaN(59,19,2);
coef_41=NaN(59,19,2);
coef_42=NaN(59,19,2);

t_full=(1:size(hgg_ca_k_anom,3))';

for i=1:59;
    tic
    coef1_here=NaN(19,2);
    coef2_here=NaN(19,2);
    coef3_here=NaN(19,2);
    coef4_here=NaN(19,2);
    coef41_here=NaN(19,2);
    coef42_here=NaN(19,2);
    for j=1:19;
        precip_here=squeeze(precip_interp_anom(i,j,:));
        ca1_here=squeeze(hgg_ca_k_anom(i,j,~isnan(precip_here),1));
        ca2_here=squeeze(hgg_ca_k_anom(i,j,~isnan(precip_here),2));
        ca3_here=squeeze(hgg_ca_k_anom(i,j,~isnan(precip_here),3));
        ca4_here=squeeze(hgg_ca_k_anom(i,j,~isnan(precip_here),4));
        
        ca41_here=squeeze(hgg_ca_41_anom(i,j,~isnan(precip_here)));
        ca42_here=squeeze(hgg_ca_42_anom(i,j,~isnan(precip_here)));
        t_here=t_full(~isnan(precip_here));
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca1_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef1_here(j,1)=b(2);
            coef1_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca2_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef2_here(j,1)=b(2);
            coef2_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca3_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef3_here(j,1)=b(2);
            coef3_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca4_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef4_here(j,1)=b(2);
            coef4_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca41_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef41_here(j,1)=b(2);
            coef41_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca42_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef42_here(j,1)=b(2);
            coef42_here(j,2)=double(bint(2,1).*bint(2,2)>0);
        end
    end
    coef_1(i,:,:)=coef1_here;
    coef_2(i,:,:)=coef2_here;
    coef_3(i,:,:)=coef3_here;
    coef_4(i,:,:)=coef4_here;
    coef_41(i,:,:)=coef41_here;
    coef_42(i,:,:)=coef42_here;
    toc
end

%% COEF MJO
addpath('/Volumes/mydirve/cloud_annual')
load('precip_interp_anom');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('phase_full');
phase_full=phase_full(2929:end);
hgg_ca_41_anom=hgg_ca_41_anom(:,:,2929:end);
hgg_ca_42_anom=hgg_ca_42_anom(:,:,2929:end);
hgg_ca_k_anom=hgg_ca_k_anom(:,:,2929:end,:);

rsq=NaN(59,19);
coef_1=NaN(59,19,2,4);
coef_2=NaN(59,19,2,4);
coef_3=NaN(59,19,2,4);
coef_4=NaN(59,19,2,4);
coef_41=NaN(59,19,2,4);
coef_42=NaN(59,19,2,4);

t_full=(1:size(hgg_ca_k_anom,3))';

phase_cate=[8 1;2 3;4 5;6 7];

for i=1:59;
    tic
    coef1_here=NaN(19,2,4);
    coef2_here=NaN(19,2,4);
    coef3_here=NaN(19,2,4);
    coef4_here=NaN(19,2,4);
    coef41_here=NaN(19,2,4);
    coef42_here=NaN(19,2,4);
    for j=1:19;
        for k=1:4
        precip_here=squeeze(precip_interp_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca1_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),1));
        ca1_here=ca1_here(~isnan(precip_here));
        ca2_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),2));
        ca2_here=ca2_here(~isnan(precip_here));
        ca3_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),3));
        ca3_here=ca3_here(~isnan(precip_here));
        ca4_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),4));
        ca4_here=ca4_here(~isnan(precip_here));
        
        ca41_here=squeeze(hgg_ca_41_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca41_here=ca41_here(~isnan(precip_here));
        ca42_here=squeeze(hgg_ca_42_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca42_here=ca42_here(~isnan(precip_here));
        
        t_here=t_full(ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]));
        t_here=t_here(~isnan(precip_here));
        
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca1_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef1_here(j,1,k)=b(2);
            coef1_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca2_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef2_here(j,1,k)=b(2);
            coef2_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca3_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef3_here(j,1,k)=b(2);
            coef3_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca4_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef4_here(j,1,k)=b(2);
            coef4_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca41_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef41_here(j,1,k)=b(2);
            coef41_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca42_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef42_here(j,1,k)=b(2);
            coef42_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
        end
        
        end
    end
    coef_1(i,:,:,:)=coef1_here;
    coef_2(i,:,:,:)=coef2_here;
    coef_3(i,:,:,:)=coef3_here;
    coef_4(i,:,:,:)=coef4_here;
    coef_41(i,:,:,:)=coef41_here;
    coef_42(i,:,:,:)=coef42_here;
    toc
end

%% COEF MJO
addpath('/Volumes/mydirve/cloud_annual')
load('precip_interp_anom');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('phase_full');
phase_full=phase_full(2929:end);
hgg_ca_41_anom=hgg_ca_41_anom(:,:,2929:end);
hgg_ca_42_anom=hgg_ca_42_anom(:,:,2929:end);
hgg_ca_k_anom=hgg_ca_k_anom(:,:,2929:end,:);

rsq=NaN(59,19);
coef_1=NaN(59,19,2,4);
coef_2=NaN(59,19,2,4);
coef_3=NaN(59,19,2,4);
coef_4=NaN(59,19,2,4);
coef_41=NaN(59,19,2,4);
coef_42=NaN(59,19,2,4);

t_full=(1:size(hgg_ca_k_anom,3))';

phase_cate=[8 1;2 3;4 5;6 7];

for i=1:59;
    tic
    coef1_here=NaN(19,2,4);
    coef2_here=NaN(19,2,4);
    coef3_here=NaN(19,2,4);
    coef4_here=NaN(19,2,4);
    coef41_here=NaN(19,2,4);
    coef42_here=NaN(19,2,4);
    for j=1:19;
        for k=1:4
        precip_here=squeeze(precip_interp_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca1_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),1));
        ca1_here=ca1_here(~isnan(precip_here));
        ca2_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),2));
        ca2_here=ca2_here(~isnan(precip_here));
        ca3_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),3));
        ca3_here=ca3_here(~isnan(precip_here));
        ca4_here=squeeze(hgg_ca_k_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]),4));
        ca4_here=ca4_here(~isnan(precip_here));
        
        ca41_here=squeeze(hgg_ca_41_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca41_here=ca41_here(~isnan(precip_here));
        ca42_here=squeeze(hgg_ca_42_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca42_here=ca42_here(~isnan(precip_here));
        
        t_here=t_full(ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]));
        t_here=t_here(~isnan(precip_here));
        
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca1_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef1_here(j,1,k)=b(2);
            coef1_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca2_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef2_here(j,1,k)=b(2);
            coef2_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca3_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef3_here(j,1,k)=b(2);
            coef3_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca4_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef4_here(j,1,k)=b(2);
            coef4_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca41_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef41_here(j,1,k)=b(2);
            coef41_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca42_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef42_here(j,1,k)=b(2);
            coef42_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
        end
        
        end
    end
    coef_1(i,:,:,:)=coef1_here;
    coef_2(i,:,:,:)=coef2_here;
    coef_3(i,:,:,:)=coef3_here;
    coef_4(i,:,:,:)=coef4_here;
    coef_41(i,:,:,:)=coef41_here;
    coef_42(i,:,:,:)=coef42_here;
    toc
end

%% COEF total

% full

load('precip_interp_anom');
load('hgg_ca_anom_total');
hgg_ca_anom=hgg_ca_anom(:,:,2929:end);

rsq=NaN(59,19);
coef_total=NaN(59,19,2);

t_full=(1:size(hgg_ca_anom,3))';

for i=1:59;
    tic
    coef_here=NaN(19,2);
    
    for j=1:19;
        precip_here=squeeze(precip_interp_anom(i,j,:));
        ca_here=squeeze(hgg_ca_anom(i,j,~isnan(precip_here)));
        
        t_here=t_full(~isnan(precip_here));
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef_here(j,1)=b(2);
            coef_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            
        end
    end
    coef_total(i,:,:)=coef_here;
    
    toc
end

% mjo

load('precip_interp_anom');
load('hgg_ca_anom_total');
load('phase_full');
phase_full=phase_full(2929:end);
hgg_ca_anom=hgg_ca_anom(:,:,2929:end);

rsq=NaN(59,19);
coef_total_mjo=NaN(59,19,2,4);

t_full=(1:size(hgg_ca_anom,3))';

phase_cate=[8 1;2 3;4 5;6 7];

for i=1:59;
    tic
    coef_here=NaN(19,2,4);
    
    for j=1:19;
        for k=1:4
        precip_here=squeeze(precip_interp_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca_here=squeeze(hgg_ca_anom(i,j,...
            ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)])));
        ca_here=ca_here(~isnan(precip_here));
        
        
        t_here=t_full(ismember(phase_full,[phase_cate(k,1) phase_cate(k,2)]));
        t_here=t_here(~isnan(precip_here));
        
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef_here(j,1,k)=b(2);
            coef_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            
        end
        
        end
    end
    coef_total_mjo(i,:,:,:)=coef_here;
    
    toc
end

% enso

load('precip_interp_anom');
load('hgg_ca_anom_total');
load('enso_diurnal');
enso_used=enso_used(2929:end);
hgg_ca_anom=hgg_ca_anom(:,:,2929:end);

rsq=NaN(59,19);
coef_total_enso=NaN(59,19,2,3);

t_full=(1:size(hgg_ca_anom,3))';

phase_cate{1}=enso_used>0.5;
phase_cate{2}=enso_used<-0.5;
phase_cate{3}=enso_used<=0.5 & enso_used>=-0.5;

for i=1:59;
    tic
    coef_here=NaN(19,2,3);
    
    for j=1:19;
        for k=1:3
        precip_here=squeeze(precip_interp_anom(i,j,...
            phase_cate{k}));
        ca_here=squeeze(hgg_ca_anom(i,j,...
            phase_cate{k}));
        ca_here=ca_here(~isnan(precip_here));
        
        
        t_here=t_full(phase_cate{k});
        t_here=t_here(~isnan(precip_here));
        
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef_here(j,1,k)=b(2);
            coef_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            
        end
        
        end
    end
    coef_total_enso(i,:,:,:)=coef_here;
    
    toc
end

%% COEF ENSO
addpath('/Volumes/mydirve/cloud_annual')
load('precip_interp_anom');
load('hgg_ca_4142_anom');
load('hgg_ca_k_anom');
load('enso_diurnal');
enso_used=enso_used(2929:end);
hgg_ca_41_anom=hgg_ca_41_anom(:,:,2929:end);
hgg_ca_42_anom=hgg_ca_42_anom(:,:,2929:end);
hgg_ca_k_anom=hgg_ca_k_anom(:,:,2929:end,:);

rsq=NaN(59,19);
coef_1=NaN(59,19,2,3);
coef_2=NaN(59,19,2,3);
coef_3=NaN(59,19,2,3);
coef_4=NaN(59,19,2,3);
coef_41=NaN(59,19,2,3);
coef_42=NaN(59,19,2,3);

t_full=(1:size(hgg_ca_k_anom,3))';

phase_cate{1}=enso_used>0.5;
phase_cate{2}=enso_used<-0.5;
phase_cate{3}=enso_used<=0.5 & enso_used>=-0.5;

for i=1:59;
    tic
    coef1_here=NaN(19,2,3);
    coef2_here=NaN(19,2,3);
    coef3_here=NaN(19,2,3);
    coef4_here=NaN(19,2,3);
    coef41_here=NaN(19,2,3);
    coef42_here=NaN(19,2,3);
    for j=1:19;
        for k=1:3
        precip_here=squeeze(precip_interp_anom(i,j,...
            phase_cate{k}));
        ca1_here=squeeze(hgg_ca_k_anom(i,j,...
            phase_cate{k},1));
        ca1_here=ca1_here(~isnan(precip_here));
        ca2_here=squeeze(hgg_ca_k_anom(i,j,...
            phase_cate{k},2));
        ca2_here=ca2_here(~isnan(precip_here));
        ca3_here=squeeze(hgg_ca_k_anom(i,j,...
            phase_cate{k},3));
        ca3_here=ca3_here(~isnan(precip_here));
        ca4_here=squeeze(hgg_ca_k_anom(i,j,...
            phase_cate{k},4));
        ca4_here=ca4_here(~isnan(precip_here));
        
        ca41_here=squeeze(hgg_ca_41_anom(i,j,...
            phase_cate{k}));
        ca41_here=ca41_here(~isnan(precip_here));
        ca42_here=squeeze(hgg_ca_42_anom(i,j,...
            phase_cate{k}));
        ca42_here=ca42_here(~isnan(precip_here));
        
        t_here=t_full(phase_cate{k});
        t_here=t_here(~isnan(precip_here));
        
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca1_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef1_here(j,1,k)=b(2);
            coef1_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca2_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef2_here(j,1,k)=b(2);
            coef2_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca3_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef3_here(j,1,k)=b(2);
            coef3_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca4_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef4_here(j,1,k)=b(2);
            coef4_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca41_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef41_here(j,1,k)=b(2);
            coef41_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
            
            data_used=[ones(size(precip_here,1),1) ca42_here t_here];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef42_here(j,1,k)=b(2);
            coef42_here(j,2,k)=double(bint(2,1).*bint(2,2)>0);
        end
        
        end
    end
    coef_1(i,:,:,:)=coef1_here;
    coef_2(i,:,:,:)=coef2_here;
    coef_3(i,:,:,:)=coef3_here;
    coef_4(i,:,:,:)=coef4_here;
    coef_41(i,:,:,:)=coef41_here;
    coef_42(i,:,:,:)=coef42_here;
    toc
end

%% predict?
load('hgg_pc_k');

hgg_pc_k_mean=squeeze(nanmean(hgg_pc_k,4));
save hgg_pc_k_mean hgg_pc_k_mean

load('hgg_tau_k');

hgg_tau_k_mean=squeeze(nanmean(hgg_tau_k,4));
save hgg_tau_k_mean hgg_tau_k_mean

addpath('/Volumes/mydirve/cloud_annual');
load('precip_interp');
load('hgg_tau_k_mean');
load('hgg_pc_k_mean');
load('hgg_ca_k_total');
hgg_tau_k_mean=hgg_tau_k_mean(:,:,2929:end,:);
hgg_pc_k_mean=hgg_pc_k_mean(:,:,2929:end,:);
hgg_ca_k_total=hgg_ca_k_total(:,:,2929:end,:);

rsq=NaN(59,19);
coef_1=NaN(59,19,2);
coef_2=NaN(59,19,2);
coef_3=NaN(59,19,2);
coef_4=NaN(59,19,2);
coef_41=NaN(59,19,2);
coef_42=NaN(59,19,2);

t_full=(1:size(hgg_ca_k_anom,3))';

for i=1:59;
    tic
    coef1_here=NaN(19,2);
    coef2_here=NaN(19,2);
    coef3_here=NaN(19,2);
    coef4_here=NaN(19,2);
    coef41_here=NaN(19,2);
    coef42_here=NaN(19,2);
    for j=1:19;
        precip_here=squeeze(precip_interp(i,j,:));
        ca1_here=squeeze(hgg_ca_k_total(i,j,~isnan(precip_here),1));
        ca2_here=squeeze(hgg_ca_k_total(i,j,~isnan(precip_here),2));
        ca3_here=squeeze(hgg_ca_k_total(i,j,~isnan(precip_here),3));
        ca4_here=squeeze(hgg_ca_k_total(i,j,~isnan(precip_here),4));
        
        tau1_here=squeeze(hgg_tau_k_mean(i,j,~isnan(precip_here),1));
        tau2_here=squeeze(hgg_tau_k_mean(i,j,~isnan(precip_here),2));
        tau3_here=squeeze(hgg_tau_k_mean(i,j,~isnan(precip_here),3));
        tau4_here=squeeze(hgg_tau_k_mean(i,j,~isnan(precip_here),4));
        
        pc1_here=squeeze(hgg_pc_k_mean(i,j,~isnan(precip_here),1));
        pc2_here=squeeze(hgg_pc_k_mean(i,j,~isnan(precip_here),2));
        pc3_here=squeeze(hgg_pc_k_mean(i,j,~isnan(precip_here),3));
        pc4_here=squeeze(hgg_pc_k_mean(i,j,~isnan(precip_here),4));
        
        
        
        
        t_here=t_full(~isnan(precip_here));
        precip_here=precip_here(~isnan(precip_here));
        
        if ~isempty(precip_here)
            data_used=[ones(size(precip_here,1),1) ca1_here ca2_here ca3_here ca4_here...
                ];
            [b,bint,~,~,stats] = regress(precip_here,data_used);
            coef1_here(j,1)=b(2);
            coef1_here(j,2)=double(bint(2,1).*bint(2,2)>0);
            
            
        end
    end
    coef_1(i,:,:)=coef1_here;
    coef_2(i,:,:)=coef2_here;
    coef_3(i,:,:)=coef3_here;
    coef_4(i,:,:)=coef4_here;
    coef_41(i,:,:)=coef41_here;
    coef_42(i,:,:)=coef42_here;
    toc
end
            