
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
end  %����δ֪��X����

C=B*X';
D=cos(C);
E=exp(D);
A=I*X'+E;	%���ҵķ����Է�����
f= A'; %���ҵķ����Է����飬������������ڵȻ����







