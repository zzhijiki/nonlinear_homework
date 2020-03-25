function df=dfun1(x,n)
f=fun1(x,n);
df=[];
for h=1:n
   dfh=diff(f,sprintf('x%d',h));
   df=[df;dfh];
   y=0;
end
df;    %我的jacobi 矩阵（不带点的）
end
