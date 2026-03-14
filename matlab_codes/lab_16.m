%FIR using frequency sampling method
clear all;
clc;

wc = pi / 2;
M = 17;
w = 0:(pi/256):pi;
Hd_w = ([w <= pi/2]).* exp(-1i*w*(M-1)/2);
figure;
subplot(3,1,1);
plot(w, abs(Hd_w));
title('Magnitude response of desired filter');
xlabel('w');
ylabel('|Hd(w)|');
kc = floor(wc *(M/(2*pi)));
k = 0:(M-1)/2;
Hk = ([k <= kc]).*exp(-1i*(2*pi*k/M)* ((M-1)/2));
subplot(3,1,2);
stem(k, abs(Hk));
title('Sampled magnitude response Hd_w');
xlabel('k');
ylabel('|H(k)|');

for n = 0:(M-1)
    sumHk = 0;
    for k = 1:(M-1)/2
        sumHk = sumHk + real(Hk(k+1)*exp(1i*2*pi*k*n/M));
    end
    hn(n+1) = (1/M)*(Hk(1)+2*sumHk);
end

n = 0:(M-1);
subplot(3,1,3);
stem(n, hn);
title('Impulse response h(n) of filter');
xlabel('n');
ylabel('h(n)');

[H, f] = freqz(hn, 1, 1000);
H_mag = 20 * log10(abs(H));

figure;
plot(f, H_mag);
xlabel('Normalized Frequency');
ylabel('Magnitude');

disp('FIR filter coefficients hn:');
disp(hn);