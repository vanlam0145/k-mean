%% Tao du lieu
m=100;
k=3;
l=m*k*2-1;
a=[1+(4-1)*rand(m,1),1+(4.5-1)*rand(m,1)]
b=[-1+(1+1)*rand(m,1),4+(5-4)*rand(m,1)]
c=[-3+(2+3)*rand(m,1),-1.5+(1.5+1.5)*rand(m,1)]
trueLbl = [ones(1,m),2*ones(1,m),3*ones(1,m)];

%% Ve du lieu
av=a';
bv=b';
cv=c';
plot(a(:,1),a(:,2),'k.');hold on
plot(b(:,1),b(:,2),'k.')
plot(c(:,1),c(:,2),'k.')

%% Khoi tao cac tam
array=[av,bv,cv];
% a1=[2.5,1.5];
% a2=[0,4.5];
% a3=[-2.5,0];
k1=[];
k2=[];
k3=[];
a1=[-3+(4+3)*rand(1,1),-1.5+(5+1.5)*rand(1,1)];
a2=[-3+(4+3)*rand(1,1),-1.5+(5+1.5)*rand(1,1)];
a3=[-3+(4+3)*rand(1,1),-1.5+(5+1.5)*rand(1,1)];
plot(a1(:,1),a1(:,2),'rp');
plot(a2(:,1),a2(:,2),'bp');
plot(a3(:,1),a3(:,2),'gp');

flag=0;

while(flag==0)
i=1;
while(i<=l)
    d1=sqrt((array(:,i)-a1(1))^2+(array(i+1)-a1(2))^2);
    d2=sqrt((array(i)-a2(1))*(array(i)-a2(1))+(array(i+1)-a2(2))*(array(i+1)-a2(2)));
    d3=sqrt((array(i)-a3(1))*(array(i)-a3(1))+(array(i+1)-a3(2))*(array(i+1)-a3(2)));
    kx=[array(i),array(i+1)];
    ky=kx';
    
    [~, id] = min([d1,d2,d3]);
%     if id == 
        
    if(d1<=d2&&d1<=d3)
        if(isempty(k1))
            k1=ky;
        else
            k1=[k1,ky];
        end
    end
    if(d2<d1&&d2<d3)
       if(k2==(0+1.0i))
            k2=ky;
        else
            k2=[k2,ky];
       end
    end
    if(d3<d1&&d3<d2)
        if(k3==(0+1.0i))
            k3=ky;
        else
            k3=[k3,ky];
        end
    end
    i=i+2;
end

k11=k1';
k22=k2';
k33=k3';
figure()
plot(a1(:,1),a1(:,2),'ro');hold on
plot(a2(:,1),a2(:,2),'bo');
plot(a3(:,1),a3(:,2),'go');
plot(k11(:,1),k11(:,2),'r.');
plot(k22(:,1),k22(:,2),'b.');
plot(k33(:,1),k33(:,2),'g.');

% Chinh lai m
t1=[sum(k11(:,1))/length(k1) sum(k11(:,2))/m] 
t2=[sum(k22(:,1))/m sum(k22(:,2))/m]
t3=[sum(k33(:,1))/m sum(k33(:,2))/m]

% Tinh khoang cach voi tam truoc do va dung theo DK: <0.01
if (t1==a1&t2==a2&t3==a3)
    flag=1;
else
    a1=t1;
    a2=t2;
    a3=t3;
    flag=0;
end
k1=[];
k2=[];
k3=[];
end

plot(a1(:,1),a1(:,2),'rx');hold on
plot(a2(:,1),a2(:,2),'bx');
plot(a3(:,1),a3(:,2),'gx');

    