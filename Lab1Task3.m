clear
clc
close all

t = -1:0.005:2;
r1 = 2*sin(2*pi*2*(t-0.25));
r2 = 0.5*cos(2*pi*5*t);
r = r1 + r2;

figure
plot(t,r1)
hold on
plot(t,r2)
grid on
xlabel("Time(s)")
ylabel("Amplitude")
title("Comparison of r1(t) with r2(t)")
legend("r1(t) = 2 sin(2*pi*2*(t - 0.25))","r2(t) = 0.5 cos(2*pi*5*t)")
hold off

figure
plot(t,r)
grid on
xlabel("Time(s)")
ylabel("Amplitude")
title("r(t) = r1(t) + r2(t)")

length(t)
r(1)
r(end)