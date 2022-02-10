%% MJO
load('hgg_ca_k_total');
hgg_ca_total=nansum(hgg_ca_k_total,4);

date_num = length(datenum(1997,1,1):datenum(2015,12,31));

hgg_ca_k_total_d=NaN(59,19,date_num,8,4);
hgg_ca_total_d=NaN(59,19,date_num,8);

for i=1:date_num
    hgg_ca_k_total_d(:,:,i,:,:) = hgg_ca_k_total(:,:,(1:8)+(i-1)*8,:);
    hgg_ca_total_d(:,:,i,:) = hgg_ca_total(:,:,(1:8)+(i-1)*8);
end

amp_cloud_k=NaN(59,19,date_num,4);
amp_cloud_total=NaN(59,19,date_num);
% lst_cloud_mjo=NaN(59,19,360,4);
% lst_cloud_clim=NaN(59,19,360);
hour_data=0:3:21;
hour_example=0:0.1:23.9;
x=parpool(4);
x.IdleTimeout=6000;
% m_full=repmat((1:90)',4,1);

lon_re=lon_isccp;lat_re=lat_isccp;

for i=1:size(hgg_ca_k_total,1);
    tic
    if lon_re(i)<112.5
        offset=7;
    elseif lon_re(i)>=112.5 && lon_re(i)<127.5
        offset=8;
    else
        offset=9;
    end
    for j=1:size(hgg_ca_k_total,2);
        for m=1:size(hgg_ca_total_d,3);
            
            cloud_here=squeeze(hgg_ca_total_d(i,j,m,:));
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
                amp_cloud_total(i,j,m)=nanmax(cloud_here)-nanmin(cloud_here);
%                 lst_cloud_clim(i,j,m)=hour_data_here(nanmin(find(cloud_here==nanmax(cloud_here))));
            end
            
            
            for k=1:4
                cloud_here=squeeze(hgg_ca_k_total_d(i,j,m,:,k));
%                 hour_data_here=m_full(m)+(hour_data+offset)./24;
%                 hour_data_here=hour_data_here(~isnan(cloud_here));
                cloud_here=cloud_here(~isnan(cloud_here));
                if length(cloud_here)>=3
                    %                     mdl_here=fit(hour_data_here(:),cloud_here,'a*sin((pi./12)*x+b)+c');
                    %                     coef_here=coeffvalues(mdl_here);
                    %                     amp_cloud(i,j,m,k)=coef_here(1);
                    %                     amp_example=mdl_here(hour_example);
                    %                     maxhour=nanmean(hour_example((amp_example==nanmax(amp_example))));
                    %                     lct_cloud(i,j,m,k)=maxhour;
                    amp_cloud_k(i,j,m,k)=nanmax(cloud_here)-nanmin(cloud_here);
%                     lst_cloud_mjo(i,j,m,k)=hour_data_here(nanmin(find(cloud_here==nanmax(cloud_here))));
                end
            end
            
        end
    end
    toc
end


