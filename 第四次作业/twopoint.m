function [x,iter]=twopoint(f,x0,err)
cost=[];
xk=x0;
dim=length(x0);%ά��
alpha=0.5;%���ѡ�Ĳ�־���
h=alpha*ones(1,dim);  %����Խ���
x=x0;
itermax=100; %��������
for iter=1:itermax  
    H=diag(h);  %����H
    xh=zeros(dim);%��ʼ��x+h
    xk=x;   %�洢x��k-1��
    J=[];  %��ʼ��J���� 
    fx=f(xk);  %�����F��x0��
    %size(fx)
    e=zeros(dim,1);%��ʼ�ҵ�ei=[0,0,0,0������0]'
    for i = 1:dim 
        e(i)=1;%�����ei
        xh(:,i)=xk+(H*e);   %����x+h    
        e(i)=0;%��س�ʼ���
    end
    %size(xh)
    fxh=f(xh);%�����F��xh��
    %size(fxh)
    J=(fxh-fx)/H;%���߷����J
    %size(J)
    x=xk-J\fx  ; %����x
    x1=x;
    x2=xk;
    h=(x1-x2)';  %����h    
    k=(norm(f(x),2));
    cost=[cost,k];%����б�
    if k<=err
        break
    end
end
cost