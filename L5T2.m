clear
clc
close all

p = [2,-3,1,4,-2,3];
np = -3:2;

q = [-1,2,3,-2,1];
nq = 2:6;

figure;
subplot(2,1,1);
stem(np, p, 'filled');
grid on;
xlabel('n'); 
ylabel('p[n]');
title('Signal p[n]');

subplot(2,1,2);
stem(nq, q, 'filled');
grid on;
xlabel('n'); 
ylabel('q[n]');
title('Signal q[n]');

lp = length(p);
lq = length(q);
Ly_pq = lp + lq - 1;

ny_pq_start = np(1) + nq(1);
ny_pq_end = np(end) + nq(end);
ny_pq = ny_pq_start:ny_pq_end;

y_pq_manual = zeros(1, Ly_pq);
for i = 1:lp
    for j = 1:lq
        position = i + j - 1;
        product = p(i)*q(j);
        y_pq_manual(position) = y_pq_manual(position) + product;
    end
end

disp('Manual p[n] * q[n]:');
disp(y_pq_manual);

y_pq_builtin = conv(p, q);
disp('conv(p, q):');
disp(y_pq_builtin);
disp('Match Check:');
disp(isequal(y_pq_manual, y_pq_builtin));

figure;
subplot(2,1,1);
stem(ny_pq, y_pq_manual, 'filled');
grid on;
xlabel('n'); 
ylabel('y[n]');
title('Manual Convolution p[n] * q[n]');

subplot(2,1,2);
stem(ny_pq, y_pq_builtin, 'filled');
grid on;
xlabel('n'); 
ylabel('y[n]');
title('Matlab Convolution p[n] * q[n]');