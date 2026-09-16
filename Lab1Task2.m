clear
clc
close all

t = 0:0.005:2;
x = 3*sin(2*pi*2*t);
y = 2*cos(2*pi*2*t + pi/4);
z = x + y;

figure
plot(t,x)
hold on
plot(t,y)
grid on
xlabel("Time(s)")
ylabel("Amplitude")
title("Comparison of x(t) with y(t)")
legend("x(t) = 3 sin(2*pi*2*t)","y(t) = 2 cos(2*pi*2*t + pi/4)")
hold off

figure
plot(t,z)
grid on
xlabel("Time(s)")
ylabel("Amplitude")
title("z(t) = x(t) + y(t)")