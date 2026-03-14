%computation of n-point dft
clc;
close all;
xn = input('enter the input sequence: ');
N = input('Enter the number of points: ');
Xk = calcdft(xn,N);
disp('DFT  X(K)= ');
disp(Xk);
magXk = abs(Xk);
phaseXk = angle(Xk);
k = 0:N-1;
subplot(2,1,1);
stem(k,magXk);
title('Magnitude plot of DFT Sequence');
xlabel('Frequency');
ylabel('Magnitude');
subplot(2,1,2);
stem(k,phaseXk);
title('phase of DFT Sequence');
xlabel('Frequency');
ylabel('Phase');
function [Xk]=calcdft(xn,N)
    L = length(xn);
if(N<L)
    error('N must be >= L');
end
x1 = [xn zeros(1,N-L)];
for k = 0:1:N-1
for n = 0:1:N-1
    p = exp(-1i*2*pi*n*k/N);
    T(k+1,n+1)=p;
end
end
disp('Transformation Matrix for DFT');
disp(T);
Xk=T*x1.';
end