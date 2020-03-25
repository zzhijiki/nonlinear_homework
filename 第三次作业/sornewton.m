function [x,iter]=sornewton(f,df,x0,err,w,iterin)
cost=[];
x=x0;
itermax=100; %µü´ú´ÎÊý
dim=length(x0);
for iter=1:itermax
    for i=1:dim
        dfx=df(x);
        xp=x;
        for it=1:iterin
            fx=f(xp);
            xp(i)=xp(i)-fx(i)/dfx(i,i);
        end
        x(i)=x(i)+w*(xp(i)-x(i));
    
    end
    k=(norm(f(x),2));
    cost=[cost,k];
    if k<=err
        break
    end
end
cost;
