%solving difference equation
clc;
close all;

b=input('Enter the coefficients of x:'); %[1 0.5]
a=input('Enter the coefficients of y:'); %[1 -0.25 -0.125]

M=length(b)-1;
N=length(a)-1;
IC=input('Enter the initial conditions for y: '); %[2 1]
n=-N:20;
x=(n>=0)-(n>=2);
subplot(211);
stem(n,x);
title('input sequence x[n]');
xlabel('n');
ylabel('x[n]');
y=[IC zeros(1,length(n)-N)];
for n = N+1:20
    sumx=0; sumy=0;
    for k = 0:M
        sumx = sumx+(b(k+1)*x(n-k));
    end
    for k = 1:N
        sumy = sumy+(a(k+1)*y(n-k));
    end
    y(n)=sumx - sumy;
end
n = -N:20;
subplot(212);
stem(n,y);
title('output sequence y[n]');
xlabel('n');
ylabel('y[n]');
disp('y[n]=');
disp(y)