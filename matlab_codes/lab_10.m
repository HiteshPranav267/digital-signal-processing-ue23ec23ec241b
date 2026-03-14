%cross-correlation
clc;
close all;
x = input('Enter the 1st sequence: ');
nx = input('Enter the index for sequnece: ');
y = input('Enter the 2nd sequence: ');
ny = input('Enter the index for sequnece: ');
[rxy,nrxy]=findconv(x,nx,flip(y),-flip(ny));
[ryx,nryx]=findconv(y,ny,flip(x),-flip(nx));
disp('rxy = ');
figure;
subplot(3,1,1);
disp(rxy);
disp(nrxy);
disp('ryx = ');
disp(ryx);
disp(nryx);

if (rxy == flip(ryx))
    disp('Rxy(lag) = Ryx(-lag) satisfied');
else
    disp('Rxy(lag) = Ryx(-lag) not satisfied');
end
stem(nx,x);
xlabel('n');
ylabel('x[n]');
subplot(3,1,2);
stem(ny,y);
xlabel('n');
ylabel('y[n]');

subplot(3,1,3);
stem(ny,y);
disp(y);
disp(ny);
xlabel('Time');
ylabel('Amplitude');
title('cross correlation');

function [y,ny] = findconv(x,nx,h,nh)
nyb = nx(1)+nh(1);
nye = nx(length(nx))+nh(length(nh));
ny = nyb:nye;
y=conv(x,h);
end

%[2 1 0 0]
%[0 1 2 3]
%[1 0 0 3]
%[0 1 2 3]