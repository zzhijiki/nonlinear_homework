function [x,iter]=newton(f,df,x0,err,k)%����,����,��ֵ,���,����׼��
x=x0;
iter=0;
% while(norm(f(x),2)>err)%��������1
% while(norm(inv(df(x))*f(x),2)>err*norm(x,2))%��������2
while(1==1)
    A=inv(df(x));%jacobi�������
%     A=pinv(df(x));%jacobi����Ĺ�����
    B=A*f(x);%����
    x=x-B;%ţ�ٷ�
    iter=iter+1;%��������
    switch(k)
        case 1
            if(norm(f(x),2)<=err)
                break
            end
        case 2
            if(norm(B,2)<=err*norm(x,2))
                break
            end
    end
end

