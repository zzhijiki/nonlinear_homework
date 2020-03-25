function sess_run5
x0=[20;20;20];
format shorte
N=500;
err=1e-6;
M=10;
tic
[x,iter]=continuation_newton(@f,@df,x0,N,err)

%[x,iter]=recurrent_newton(@f,@df,x0,N,M,err,err)
toc

function y=f(x)
f1=3*x(1)-cos(x(2)*x(3))-0.5;
f2=x(1)^2-81*(x(2)+0.1)^2+sin(x(3))+1.06;
f3=exp(-x(1)*x(2))+20*x(3)+10*pi/3-1;
y=[f1;f2;f3];

function y=df(x)
y=[3 x(3)*sin(x(2)*x(3)) x(2)*sin(x(2)*x(3));
   2*x(1) -162*(x(2)+0.1) cos(x(3));
   -x(2)*exp(-x(1)*x(2)) -x(1)*exp(-x(1)*x(2)) 20];







