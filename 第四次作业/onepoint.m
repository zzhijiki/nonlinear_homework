function [x,iter]=onepoint(f,x0,err)
cost=[];
x=x0;
dim=length(x0);%维度
h=0.5;%随便选的差分距离
v=h*ones(1,dim);  %构造对角线
H=diag(v);  %构造一个只有对角线v的H,维度（n，n）
itermax=10; %迭代次数


for iter=1:itermax  
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
    J=(fxh-fx)/(h*norm(fx,2));%割线法求出J
    %size(fx)
    %size(J)
    x=x-J\fx  ; %更新x
    
    
    k=(norm(f(x),2));
    cost=[cost,k];%误差
    if k<=err
        break
    end
end
cost