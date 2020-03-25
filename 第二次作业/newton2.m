clear;clc
format short e;
n=100;    %迭代次数
costs=[]; %记录每次迭代后的误差
xlast=[ ];

for i=1:n
Karray={};
B(i) ={sprintf('x%d',i)};
Karray=[Karray, B];
end    %函数所要的参数1


for i=1:n
    xlast=[xlast 20];   % 迭代初始值
end
eps = 0.000001;% 定位精度要求

disp('1次迭代大概半分钟（100维）：');
for i = 1:100
    C=[];
    for l=1:n
        P=xlast(l);
        C=[C,P];
    end %函数所要的参数2
    
    f = double(subs(fun1(xlast,n),Karray,{C}));
    df = double(subs(dfun1(xlast,n),Karray,{C}));  % 得到雅克比矩阵
    format short e;
    delk=f/df;   %delta k
    x=xlast- delk; % 牛顿法
    
    cost=(norm(-delk, 2));
    fprintf('第%d次误差\n',i);
    cost
    normf=norm(f,2)    
    costs = [costs,normf];
    xlast = x; % 更新迭代结果
    if normf < eps %迭代停止条件
        break;   
    end
    
end
disp('方程：');
f=fun1(x,n)'

disp('定位坐标：');
x
disp('迭代次数：');
i
disp('误差总览表：');
format short e
costs