function [x,iter]=newton(f,df,x0,err,k)%函数,导数,初值,误差,收敛准则
x=x0;
iter=0;
% while(norm(f(x),2)>err)%收敛条件1
% while(norm(inv(df(x))*f(x),2)>err*norm(x,2))%收敛条件2
while(1==1)
    A=inv(df(x));%jacobi矩阵的逆
%     A=pinv(df(x));%jacobi矩阵的广义逆
    B=A*f(x);%步长
    x=x-B;%牛顿法
    iter=iter+1;%迭代步数
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

