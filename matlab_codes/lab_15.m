%FIR using hamming window method
clear all;
clc;

fs = 8000;
fp = 1500;
fst = 2000;
wp = (2 * pi * fp) / fs;
ws = (2 * pi * fst) / fs;
twn = (ws - wp) / pi;
wc = wp + twn * pi / 2;
N = ceil(8 / twn);
if (mod(N, 2) == 0)
    N = N + 1;
end
alpha = (N - 1) / 2;
er = 0.001;
for n = 0:1:N-1
    hd(:,n + 1) = (sin(wc * (n - alpha + er)))./(pi*(n - alpha + er));
end
disp(hd);
figure;
whm = hamming(N);
disp('Hamming window coefficients:');
disp(whm);
stem(whm);
title('Hamming Window');
hn = hd.*whm;
[H, f] = freqz(hn, 1, 1000, fs);
H_mag = 20 * log10(abs(H));
figure;
plot(f, H_mag);
xlabel('Normalized Frequency');
ylabel('Magnitude');
disp('FIR filter coefficients hn:');
disp(hn);
