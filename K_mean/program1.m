a=ClassData;%khoi tao doi tuong a
b=Class_K_mean;%khoi tao doi tuong b
a.m=5;%so diem cua 1 cum
a.k=10;%so cum
b.k=10;%so cum
a.dim=10*10;%so chieu
b.minDist=0.00001;%dieu kien dung
foder='C:\Users\Administrator\Documents\MATLAB\K_mean\ime2\';
%noi luu tru hinh anh
a.docfile(foder);%lay du lieu tu hinh anh
for i=1:a.k
    for j=1:a.m
        a.true_lb=cat(2,a.true_lb,i);%khoi tao true_lb
    end
end
b.initCenter(a);%khoi tao tam
b.Clustering(a);%phan cum
b.Compute_F1_score(a);%tinh f1_score
f1_score= b.F1_score
