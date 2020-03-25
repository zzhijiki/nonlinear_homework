function [x,iter]= newtonsor(f,df,x0,err,w,iterin)

x=x0;
itermax=100; %µü´ú´ÎÊý
cost=[];
for iter=1:itermax
    A=df(x);
    b=df(x)*x-f(x);
    D=diag(diag(A));
    L=D-tril(A);
    U=D-triu(A);
    B=(D-w*L)/w;
    C=((1-w)*D+w*U)/w;
    H=B\C;
    for i=1:iterin
        x=H*x+B\b;
    end
    k=norm(f(x),2);
    cost=[cost,k];
    if(norm(f(x),2)<=err)
        break
    end
end
cost;


