clear
clc
close all

t=-4:0.1:6;
r=zeros(1,length(t));
for k=1:length(t)
    if t(k)<-2
        r(k)=0;
    elseif t(k)<0 && t(k)>=-2
        r(k)=t(k)+2;
    elseif t(k)<2 && t(k)>=0
        r(k)=2;
    elseif t(k)<=4 && t(k)>=2
        r(k)=4-t(k);
    else
        r(k)=0;
    end
end

figure
plot(t,r,'o-')
grid on
xlabel('Time(s)')
ylabel('Amplitude')
title('Complete graph of r(t)')

figure
plot(t,r,'o')
grid on
xlabel('Time(s)')
ylabel('Amplitude')
title('Calculated Samples of r(t)')

q=zeros(1,length(t));
for k=1:length(t)
    if r(k)>=1
        q(k)=r(k);
    else
        q(k)=0;
    end
end

figure
plot(t,q,'o-')
hold on
plot(t,r,'o-')
grid on
xlabel('Time(s)')
ylabel('Amplitude')
title('Comparison of r(t) and q(t)')
legend('q(t)','r(t)')
hold off

length(t)
disp(r(t == -2))
disp(r(t == 0))
disp(r(t == 2))
disp(r(t == 4))