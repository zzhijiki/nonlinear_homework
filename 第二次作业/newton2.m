clear;clc
format short e;
n=100;    %��������
costs=[]; %��¼ÿ�ε���������
xlast=[ ];

for i=1:n
Karray={};
B(i) ={sprintf('x%d',i)};
Karray=[Karray, B];
end    %������Ҫ�Ĳ���1


for i=1:n
    xlast=[xlast 20];   % ������ʼֵ
end
eps = 0.000001;% ��λ����Ҫ��

disp('1�ε�����Ű���ӣ�100ά����');
for i = 1:100
    C=[];
    for l=1:n
        P=xlast(l);
        C=[C,P];
    end %������Ҫ�Ĳ���2
    
    f = double(subs(fun1(xlast,n),Karray,{C}));
    df = double(subs(dfun1(xlast,n),Karray,{C}));  % �õ��ſ˱Ⱦ���
    format short e;
    delk=f/df;   %delta k
    x=xlast- delk; % ţ�ٷ�
    
    cost=(norm(-delk, 2));
    fprintf('��%d�����\n',i);
    cost
    normf=norm(f,2)    
    costs = [costs,normf];
    xlast = x; % ���µ������
    if normf < eps %����ֹͣ����
        break;   
    end
    
end
disp('���̣�');
f=fun1(x,n)'

disp('��λ���꣺');
x
disp('����������');
i
disp('���������');
format short e
costs