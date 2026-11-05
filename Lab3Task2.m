clear
clc
close all

n=-4:8;
u_left = double(n >= -1);
u_right = double(n >= 5);
r = u_left - u_right;
n_shift = n + 2;
n_flip = -fliplr(n);
r_flip = fliplr(r);
h=[1 2 1];
nh = 0:2;
y=conv(r,h);
ny = (n(1) + nh(1)):(n(end) + nh(end));

figure
stem(n,r)
grid on
xlabel('n')
ylabel('r[n]')
title('Signal r[n] = u[n+1] - u[n-5]')

figure
stem(n_shift,r)
grid on
xlabel('n')
ylabel('r[n-2]')
title('Signal r[n] Shifted Right by 2')

figure 
stem(n_flip,r_flip)
grid on
xlabel('n')
ylabel('r[-n]')
title('Time-Reversed Signal r[-n]')

figure
stem(ny, y)
grid on
xlabel('n')
ylabel('y[n]')
title('Convolution y[n] = r[n] * h[n]')