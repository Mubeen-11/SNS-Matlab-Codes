clear
clc
close all

n=-2:2;
n_right = n+3;
n_left = n-2;
x=n;
n_flip = -fliplr(n);
x_flip = fliplr(x);
n_flip_shift = n_flip + 2;
nf=-3:8;
u1 = double(nf >= 0);
u2 = double(nf >= 5);
f = u1 - u2;
a = [1 1 1];
b = [1 2 1];
na = 0:2;
nb = 0:2;
c = conv(a, b);
nc = (na(1) + nb(1)):(na(end) + nb(end));

figure
stem(n,x)
grid on
xlabel('n')
ylabel('x[n]')
title('Original Signal x[n]')

figure
stem(n_right, x)
grid on
xlabel('n')
ylabel('x[n-3]')
title('Signal Shifted Right by 3')

figure
stem(n_left, x)
grid on
xlabel('n')
ylabel('x[n+2]')
title('Signal Shifted Left by 2')

figure
stem(n_flip, x_flip)
grid on
xlabel('n')
ylabel('x[-n]')
title('Time-Reversed Signal x[-n]')

figure
stem(n_flip_shift, x_flip)
grid on
xlabel('n')
ylabel('x[-n+2]')
title('Flipped and Shifted Right by 2')

figure
stem(nf, f)
grid on
xlabel('n')
ylabel('f[n]')
title('f[n] = u[n] - u[n-5]')

figure
stem(nc, c)
grid on
xlabel('n')
ylabel('c[n]')
title('Convolution c[n] = a[n] * b[n]')