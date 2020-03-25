function [x,iter]=newtonsor(f,df,x0,err,w,in_iter)%����,jacobi,��ֵ,���,�ɳ�����,�ڵ�������
x=x0;
max_iter=100;
for iter=1:max_iter
    A=df(x);
    b=df(x)*x-f(x);
    D=diag(diag(A));
    L=D-tril(A);
    U=D-triu(A);
    B=1/w*(D-w*L);
    C=1/w*((1-w)*D+w*U);
    H=B\C;
    for i=1:in_iter
        x=H*x+B\b;
    end
    if(norm(f(x),2)<=err)
        break
    end
end
    