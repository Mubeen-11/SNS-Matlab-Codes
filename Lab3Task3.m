clear
clc
close all

np = -4:6;
u_p1 = double(np >= -1);
u_p2 = double(np >= 4);
p = u_p1 - u_p2;
np_flip = -fliplr(np);
p_flip = fliplr(p);
np_left = np - 2;
nh = -1:2;
h = [1 2 2 1];
y = conv(p, h);
ny = (np(1) + nh(1)):(np(end) + nh(end));
z = conv(h, p);
nz = (nh(1) + np(1)):(nh(end) + np(end));

figure
stem(np, p)
grid on
xlabel('n')
ylabel('p[n]')
title('Signal p[n]')

figure
stem(np_flip, p_flip)
grid on
xlabel('n')
ylabel('p[-n]')
title('Time-Reversed Signal p[-n]')

figure
stem(np_left, p)
grid on
xlabel('n')
ylabel('p[n+2]')
title('Signal p[n] Shifted Left by 2')

figure
stem(nh, h)
grid on
xlabel('n')
ylabel('h[n]')
title('Signal h[n]')

figure
stem(ny, y)
grid on
xlabel('n')
ylabel('y[n]')
title('Convolution y[n] = p[n] * h[n]')

figure
stem(nz, z)
grid on
xlabel('n')
ylabel('z[n]')
title('Convolution z[n] = h[n] * p[n]')

disp('Is y[n] equal to z[n]?')
disp(isequal(y, z))