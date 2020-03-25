function [x,iter]=twopoint(f,x0,err)
cost=[];
xk=x0;
dim=length(x0);%维度
alpha=0.5;%随便选的差分距离
h=alpha*ones(1,dim);  %构造对角线
x=x0;
itermax=100; %迭代次数
for iter=1:itermax  
    H=diag(h);  %更新H
    xh=zeros(dim);%初始化x+h
    xk=x;   %存储x（k-1）
    J=[];  %初始化J矩阵 
    fx=f(xk);  %计算出F（x0）
    %size(fx)
    e=zeros(dim,1);%初始我的ei=[0,0,0,0……，0]'
    for i = 1:dim 
        e(i)=1;%构造出ei
        xh(:,i)=xk+(H*e);   %更新x+h    
        e(i)=0;%变回初始情况
    end
    %size(xh)
    fxh=f(xh);%计算出F（xh）
    %size(fxh)
    J=(fxh-fx)/H;%割线法求出J
    %size(J)
    x=xk-J\fx  ; %更新x
    x1=x;
    x2=xk;
    h=(x1-x2)';  %更新h    
    k=(norm(f(x),2));
    cost=[cost,k];%误差列表
    if k<=err
        break
    end
end
cost