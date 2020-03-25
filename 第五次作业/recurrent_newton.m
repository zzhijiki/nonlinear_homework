function [x,iter] = recurrent_newton(f,df,x0,N,M,err1,err2)
%循环中点求积牛顿法
cost1=[];
cost2=[];
for iter=1:M
    f0=f(x0);
    x=x0-df(x0)\f0/N;
    for j=1:N-1
        x_half=x+(x-x0)/2;
        x0=x;
        x=x-df(x_half)\f0/N;
    end
    z0=0.1;
    z1=df(x)\f(x);
    while norm(z1)<norm(z0)
        z0=z1;
        x=x-z1;
        
        cost1=[cost1,norm(f(x))]
        cost2=[cost2,norm(z1)]
        if norm(z1)<=err1
            return
        end
        if norm(f(x))<=err2
            return
        end
        z1=df(x)\f(x);
    end
end
