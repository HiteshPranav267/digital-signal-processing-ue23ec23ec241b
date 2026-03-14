%autocorrelation
clear all;
clc;
x = input('Enter the sequence: ');
nx = input('Enter the index for sequnece: ');
[rxx,nrxx]=findconv(x,nx,flip(x),-flip(nx));
%using inbuilt function
%[rxx,nrxx]= xcorr(x);
E=sum(x.^2);
disp('Energy');
disp(E);
disp(rxx);
disp(nrxx);
if(rxx(ceil(length(rxx)/2))==max(rxx))
    disp('Rxx(0) is the max value; proved');
else
    disp('Rxx(0) is the max value; not proved');
end
if (rxx(ceil(length(rxx)/2))==E)
    disp('Rxx(0) gives energy; proved');
else
    disp('Rxx(0) gives energy; not proved');
end
if (rxx==flip(rxx))
    disp('symmetric property satisfied');
else
    disp('symmetric property not satisfied');
end
subplot(2,1,1);
stem(nx,x);
xlabel('n');
ylabel('x[n]');
subplot(2,1,2);
stem(nrxx,rxx);
xlabel('l');
ylabel('r[l]');
title('auto correlation');

function [y,ny] = findconv(x,nx,h,nh)
nyb = nx(1)+nh(1);
nye = nx(length(nx))+nh(length(nh));
ny = nyb:nye;
y=conv(x,h);
end
    
%[1 1 1 1 1 1 1 1 1 1]
%[1:10]