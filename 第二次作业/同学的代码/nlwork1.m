dim=100;%维数

A=ones(dim);
d=[-1,0,1];
B=full(spdiags(A,d,dim,dim));
C=eye(dim)*3-B;%构造三对角矩阵

f=@(x)C*x+exp(x)-1;%定义向量函数f
df=@(x)C+diag(exp(x));%定义jacobi矩阵
%x0=ones(dim,1);%初始值
x0=20*rand(dim,1)-10;%随机初始值
err=1e-10;%收敛误差
[x,iter]=newton(f,df,x0,err,2)


