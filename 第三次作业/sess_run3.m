clc;clear;
dim=100; %维度

A=eye(dim);
P=diag(ones(1,dim))+diag(ones(1,dim-1),1)+diag(ones(1,dim-1),-1);
B=P/(dim+1);%三对角矩阵

f=@(x)A*x-exp(cos(B*x));%定义函数
df=@(x)A+exp(cos(B*x)).*sin(B*x).*B;%定义Jacobi矩阵

x0=20*ones(dim,1);
err=1e-6;
format shorte
cost=[];
iterin=2;
tic

%w=1;
%for w=0.1:0.1:2.0
w=1
[x,iter]=newtonsor(f,df,x0,err,w,iterin);
%[x,iter]=sornewton(f,df,x0,err,w,iterin);
%toc
x=x';
cost=[cost,iter]
%end





