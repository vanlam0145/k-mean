a=ClassData;%khoi tao doi tuong a
b=Class_K_mean;%khoi tao doi tuong b
a.m=100;%so diem cua 1 cum
a.k=3;%so cum
a.dim=1000;%so chieu
b.minDist=0.01;%dieu kien dung
zonedata=[-3 -1.5;-1 1;1.5 3];%%khong chong lap
%zonedata=[-2 0;-1 1;0 2;-3 -1.5];%%chong lap
b.k=a.k;%so cum

a.genData(zonedata);%tao du lieu cho doi tuong a
b.initCenter(a);%khoi tao tam cho a
b.learned_lb=a.true_lb;%gan gia tri ban dau cho learned_lb
b.Clustering(a);%phan cum a
b.Compute_F1_score(a);%tinh f1_score
f1_score=b.F1_score%xuat gia tri f1_score
a.plotData(b)%ve do thi