function [x,iter]=hundpoint(f,x0,err)
cost=[];
x=x0;
dim=length(x0);%维度
h0=0.5;%随便选的差分距离
v=h0*ones(1,dim);  %构造对角线
H=diag(v);  %构造一个只有对角线v的H,维度（n，n）
itermax=10; %迭代次数
xh=zeros(dim);
J=[];  %初始化J矩阵 
fx=f(x);  %计算出F（x0）
%size(fx)
e=zeros(dim,1);%初始我的ei=[0,0,0,0……，0]'
for i = 1:dim 
    e(i)=1;%构造出ei
    xh(:,i)=x+((norm(fx,2))*H*e);   %更新x+h    
    e(i)=0;%变回初始情况
end
fxh=f(xh);%计算出F（xh）
J=(fxh-fx)/(h0*norm(fx,2));%割线法求出J
%size(fx)
%size(J)
for iter=1:itermax
    x=x-J\f(x);
    costtemp=(norm(f(x),2));
    cost=[cost,costtemp];%误差
    if costtemp<err
        break
    end
    k=mod(iter,dim);
    if k==0
        k=dim;
    end
    h0=h0*norm(f(x),2);
    x1=x;
    x1(k)=x1(k)+h0;
    J(:,k)=(f(x1)-f(x))/h0;
end
cost