dim=100;%ά��

A=ones(dim);
d=[-1,0,1];
B=full(spdiags(A,d,dim,dim));
C=eye(dim)*3-B;%�������ԽǾ���

f=@(x)C*x+exp(x)-1;%������������f
df=@(x)C+diag(exp(x));%����jacobi����
%x0=ones(dim,1);%��ʼֵ
x0=20*rand(dim,1)-10;%�����ʼֵ
err=1e-10;%�������
[x,iter]=newton(f,df,x0,err,2)


