function [x,iter]=onepoint(f,x0,err)
cost=[];
x=x0;
dim=length(x0);%ά��
h=0.5;%���ѡ�Ĳ�־���
v=h*ones(1,dim);  %����Խ���
H=diag(v);  %����һ��ֻ�жԽ���v��H,ά�ȣ�n��n��
itermax=10; %��������


for iter=1:itermax  
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
    J=(fxh-fx)/(h*norm(fx,2));%���߷����J
    %size(fx)
    %size(J)
    x=x-J\fx  ; %����x
    
    
    k=(norm(f(x),2));
    cost=[cost,k];%���
    if k<=err
        break
    end
end
cost