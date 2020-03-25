function [x1,iter]=continuation_newton(f,df,x0,N,err)
%—”Õÿ≈£∂Ÿ∑®   
x=x0;
itermax=100;
f0=f(x0);
cost=[];
for i=0:N-1
    x=x-df(x)\(f(x)+(i/N-1)*f0);
end
for iter=1:itermax
    x1=x-df(x)\f(x);
    cost=[cost,norm(x1-x)];
    if norm(x1-x)<err
        break
    end
    x=x1;
end
cost

    
        