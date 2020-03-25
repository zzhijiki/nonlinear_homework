
function f = fun1(x,n)
f=[];
format rat
I=eye(n);
P=diag(ones(1,n))+diag(ones(1,n-1),1)+diag(ones(1,n-1),-1);
B=P/6;

X=[];
syms x
for k=1:n
eval(sprintf('syms x%d',k));
x(k)=sprintf('x%d',k);
X=[X,x(k)];
end  %定义未知数X向量

C=B*X';
D=cos(C);
E=exp(D);
A=I*X'+E;	%既我的非线性方程组
f= A'; %既我的非线性方程组，按行输出，便于等会计算







