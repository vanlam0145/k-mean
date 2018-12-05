
classdef Class_K_mean< handle
    properties
        minDist
        F1_score
        learned_lb
        true_lb
        k
        dataCenter
    end
    methods (Static)
        %%
        function dis=Compute_Dist(pA,pB)
            dis=norm(pA-pB);
        end
    end
    methods
        %%
        % Khoi tao tam
        function initCenter(obj, a)
            obj.dataCenter = [];
            for i=1:obj.k
                DiemNgauNhien = randi(obj.k*a.m);
                obj.dataCenter = cat(1,obj.dataCenter, a.dataArray(DiemNgauNhien,:));
            end           
        end
        %%
        function Clustering(obj,a) % data
            
            obj.true_lb = a.true_lb;
            flag=0;
            while(flag==0)
                
                % Assign data points to groups
                obj.learned_lb=[];
                ii=1;
                while(ii<=(obj.k*a.m))
                    dist=[];
                    for jj=1:a.k
                        kc=Class_K_mean.Compute_Dist(a.dataArray(ii,:),obj.dataCenter(jj,:));
                        dist=cat(1,dist,kc);
                    end
                    [~, id] = min(dist);
                    obj.learned_lb=cat(2,obj.learned_lb,id);
                    ii=ii+1;
                end
                
                % Compute new centers
                dataNewCenter=[];
                for jj=1:a.k
                    newCenter=[];
                    dataClustering=[];
                    for kk=1:length(obj.learned_lb)
                        if (obj.learned_lb(kk)==jj)
                            dataClustering=cat(1,dataClustering,a.dataArray(kk,:));
                        end
                    end
                    if(isempty(dataClustering))
                        newCenter=obj.dataCenter(jj,:);
                    else
                        newCenter=mean(dataClustering,1);
                    end
                    dataNewCenter=cat(1,dataNewCenter,newCenter);
                end
                
                % Tinh dieu kien dung
                dem=0;
                for jj=1:a.k
                    kc=Class_K_mean.Compute_Dist(obj.dataCenter(jj,:),dataNewCenter(jj,:));
                    if (kc<=obj.minDist)
                        dem=dem+1;
                        obj.dataCenter(jj,:)=dataNewCenter(jj,:);
                    else
                        dem=dem-1;
                        obj.dataCenter(jj,:)=dataNewCenter(jj,:);
                    end
                end
                if dem==a.k
                    flag=1;
                else
                    flag=0;
                end
            end
        end
        %%
        function Compute_F1_score(obj,a)
            TP=0; FN=0;FP=0; TN=0;
            obj.true_lb = a.true_lb;
            for ii=1:(length(obj.true_lb)-1)
                for jj=ii+1:length(obj.true_lb)
                    if(obj.true_lb(ii)==obj.true_lb(jj))
                        if(obj.learned_lb(ii)==obj.learned_lb(jj))
                            TP=TP+1;
                        else
                            FN=FN+1;
                        end
                    else
                        if(obj.learned_lb(ii)==obj.learned_lb(jj))
                            FP=FP+1;
                        else
                            TN=TN+1;
                        end
                    end
                end
            end
            P=TP/(TP+FP);
            R=TP/(TP+FN);
            obj.F1_score=2*P*R/(P+R);
        end
    end
end