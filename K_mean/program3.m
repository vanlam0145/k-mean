a=ClassData;%khoi tao doi tuong a
b=Class_K_mean;%khoi tao doi tuong b
a.m=5;%so diem cua 1 cum
a.k=10;%so cum
b.k=10;%so cum
a.dim=10*10;%so chieu
b.minDist=0.0001;%dieu kien dung
forder= 'C:\Users\Administrator\Documents\MATLAB\K_mean\ime2\';
a.docfile(foder);%lay du lieu tu hinh anh
for i=1:a.k
    for j=1:a.m
        a.true_lb=cat(2,a.true_lb,i);%khoi tao true_lb
    end
end
b.dataCenter=[a.dataArray(1,:);a.dataArray(1+a.m,:);
    a.dataArray(1+a.m*2,:);a.dataArray(1+a.m*3,:);
    a.dataArray(1+a.m*4,:); a.dataArray(1+a.m*5,:);
    a.dataArray(1+a.m*6,:);a.dataArray(1+a.m*7,:);
    a.dataArray(1+a.m*8,:); a.dataArray(1+a.m*9,:)];%gan tam
b.Clustering(a);%phan cum
b.Compute_F1_score(a);%tinh f1_score
f1_score= b.F1_score
