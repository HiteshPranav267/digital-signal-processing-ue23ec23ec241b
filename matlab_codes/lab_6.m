%circular convolution
clc;
clear all;
close all;
x=input('enter 1st sequence');
h=input('enter 2nd sequence');
N=input('enter N');
l1=length(x);
l2=length(h);
x=[x zeros(1,(N-l1))];
h=[h zeros(1,(N-l2))];
for n=1:1:N;
    y(n)=0;
    for k=1:1:N;
        y(n)=y(n)+x(k)*h(mod((n-k),N)+1);
    end
end
disp('the circular convolution of 2 given sequences');
n=0:N-1;
figure;
subplot(3,1,1);
stem(n,x);
xlabel('time');
ylabel('amplitude');
title('1st sequence');
subplot(3,1,2);
stem(n,h);
xlabel('time');
ylabel('amplitude');
title('2nd sequence');
subplot(3,1,3);
stem(n,y);
xlabel('time');
ylabel('amplitude');
title('circular convolution');
disp(y);
disp(n);