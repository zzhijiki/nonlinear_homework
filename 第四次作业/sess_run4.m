clc;clear;
dim=100; %ά��

A=eye(dim);
P=diag(ones(1,dim))+diag(ones(1,dim-1),1)+diag(ones(1,dim-1),-1);
B=P/(dim+1);%���ԽǾ���

f=@(x)A*x-exp(cos(B*x));%���庯��


x0=1*ones(dim,1);%intialize 
err=1e-6;
format shorte
iterlist=[];
%tic

%w=1;
%for w=0.1:0.1:2.0

[x,iter]=onepoint(f,x0,err);
iter
[x,iter]=twopoint(f,x0,err);
iter
[x,iter]=hundpoint(f,x0,err);
iter
%toc

x=x';
format shorte
iterlist=[iterlist,iter];
%end