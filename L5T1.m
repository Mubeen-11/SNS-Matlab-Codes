clear 
clc
close all

a = [2, 1, -2, 3, 1];
na = -2:2;

b = [1, -1, 2, 1];
nb = 1:4;

figure;
subplot(2,1,1);
stem(na, a, 'filled');
grid on;
xlabel('n'); 
ylabel('a[n]');
title('Signal a[n]');

subplot(2,1,2);
stem(nb, b, 'filled');
grid on;
xlabel('n'); 
ylabel('b[n]');
title('Signal b[n]');

La = length(a);
Lb = length(b);
Ly_ae = La + Lb - 1;

ny_ae_start = na(1) + nb(1);
ny_ae_end = na(end) + nb(end);
ny_ae = ny_ae_start:ny_ae_end;

y_ab_manual = zeros(1, Ly_ae);
for i = 1:La
    for j = 1:Lb
        position = i + j - 1;
        y_ab_manual(position) = y_ab_manual(position) + a(i) * b(j);
    end
end

disp('Manual a[n] * b[n]:');
disp(y_ab_manual);

y_ab_builtin = conv(a, b);
disp('conv(a, b):');
disp(y_ab_builtin);
disp('Match Check:');
disp(isequal(y_ab_manual, y_ab_builtin));

y_ba_manual = zeros(1, Ly_ae);
for i = 1:Lb
    for j = 1:La
        position = i + j - 1;
        y_ba_manual(position) = y_ba_manual(position) + b(i) * a(j);
    end
end

disp('Commutative Property Check (a*b == b*a):');
disp(isequal(y_ab_manual, y_ba_manual));

figure;
subplot(2,1,1);
stem(ny_ae, y_ab_manual, 'filled');
grid on;
xlabel('n'); 
ylabel('y[n]');
title('Manual Convolution a[n] * b[n]');

subplot(2,1,2);
stem(ny_ae, y_ab_builtin, 'filled');
grid on;
xlabel('n'); 
ylabel('y[n]');
title('Matlab Convolution a[n] * b[n]');