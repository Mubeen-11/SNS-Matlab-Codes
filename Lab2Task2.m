clear
clc
close all

t=-4:.25:4;
x=zeros(1,length(t));
for k=1:length(t)
    if t(k)<-2
        x(k)=0;
    elseif t(k)<0
        x(k)=t(k)+2;
    elseif t(k)<=2
        x(k)=2-t(k);
    else
        x(k)=0;
    end
end

figure
plot(t,x,'o-')
grid on
xlabel('Time(s)')
ylabel('Amplitude')
title('Complete graph of x(t)')

figure
plot(t,x,'o')
grid on
xlabel('Time(s)')
ylabel('Amplitude')
title('Calculated Samples of x(t)')

length(t)
disp(x(t==-2))
disp(x(t==0))
disp(x(t==2))