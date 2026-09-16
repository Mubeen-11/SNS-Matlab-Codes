clear
clc
close all
t=-3:0.5:3;
x=zeros(1,length(t));
for k=1:length(t)
    if t(k)<-1
        x(k)=0;
    elseif t(k)<=1
        x(k)=2;
    else
        x(k)=0;
    end
end

disp(t)
disp(x)

figure
plot(t,x,'o-')
grid on
xlabel('Time')
ylabel('Amplitude')
title('Final Task 1 Exercise')

figure
plot(t,x,'o')
grid on
xlabel('Time')
ylabel('Amplitude')
title('Individual Signal Samples')

length(t)
disp(x(t==-2))
disp(x(t==-1))
disp(x(t==0))
disp(x(t==1))
disp(x(t==2))