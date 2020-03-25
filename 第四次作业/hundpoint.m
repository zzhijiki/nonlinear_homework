function [x,iter]=hundpoint(f,x0,err)
cost=[];
x=x0;
dim=length(x0);%ά��
h0=0.5;%���ѡ�Ĳ�־���
v=h0*ones(1,dim);  %����Խ���
H=diag(v);  %����һ��ֻ�жԽ���v��H,ά�ȣ�n��n��
itermax=10; %��������
xh=zeros(dim);
J=[];  %��ʼ��J���� 
fx=f(x);  %�����F��x0��
%size(fx)
e=zeros(dim,1);%��ʼ�ҵ�ei=[0,0,0,0������0]'
for i = 1:dim 
    e(i)=1;%�����ei
    xh(:,i)=x+((norm(fx,2))*H*e);   %����x+h    
    e(i)=0;%��س�ʼ���
end
fxh=f(xh);%�����F��xh��
J=(fxh-fx)/(h0*norm(fx,2));%���߷����J
%size(fx)
%size(J)
for iter=1:itermax
    x=x-J\f(x);
    costtemp=(norm(f(x),2));
    cost=[cost,costtemp];%���
    if costtemp<err
        break
    end
    k=mod(iter,dim);
    if k==0
        k=dim;
    end
    h0=h0*norm(f(x),2);
    x1=x;
    x1(k)=x1(k)+h0;
    J(:,k)=(f(x1)-f(x))/h0;
end
cost