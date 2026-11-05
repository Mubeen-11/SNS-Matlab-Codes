clear 
clc
close all

v = [3,-1,2,-2,4,1,-3];
nv = -4:2;

w = [2,-1,3,1,-2,2];
nw = 2:7;

figure;
subplot(2,1,1);
stem(nv, v, 'filled');
grid on;
xlabel('n'); 
ylabel('v[n]');
title('Signal v[n]');

subplot(2,1,2);
stem(nw, w, 'filled');
grid on;
xlabel('n'); 
ylabel('w[n]');
title('Signal w[n]');

Lv = length(v);
Lw = length(w);
Ly_ae = Lv + Lw - 1;

ny_ae_start = nv(1) + nw(1);
ny_ae_end = nv(end) + nw(end);
ny_ae = ny_ae_start:ny_ae_end;

y_vw_manual = zeros(1, Ly_ae);
for i = 1:Lv
    for j = 1:Lw
        position = i + j - 1;
        y_vw_manual(position) = y_vw_manual(position) + v(i) * w(j);
    end
end

disp('Manual v[n] * w[n]:');
disp(y_vw_manual);

y_vw_builtin = conv(v, w);
disp('conv(v, w):');
disp(y_vw_builtin);
disp('Match Check:');
disp(isequal(y_vw_manual, y_vw_builtin));

y_wv_manual = zeros(1, Ly_ae);
for i = 1:Lw
    for j = 1:Lv
        position = i + j - 1;
        y_wv_manual(position) = y_wv_manual(position) + w(i) * v(j);
    end
end

disp('Commutative Property Check (v*w == w*v):');
disp(isequal(y_vw_manual, y_wv_manual));

figure;
subplot(2,1,1);
stem(ny_ae, y_vw_manual, 'filled');
grid on;
xlabel('n'); 
ylabel('y[n]');
title('Manual Convolution v[n] * w[n]');

subplot(2,1,2);
stem(ny_ae, y_vw_builtin, 'filled');
grid on;
xlabel('n'); 
ylabel('y[n]');
title('Matlab Convolution v[n] * w[n]');