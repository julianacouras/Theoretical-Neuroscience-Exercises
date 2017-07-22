close all
clear all

T = 10; %s
r = 100; %Hz

dt = 0.001; %s
N = T/dt;


t= zeros(1,N);
%Spike sequence generator

for i = 1:N
    if dt*r>rand;
        t(i) = 1;
    else
        t(i) = 0;
    end
end

plot(t);

%Autocorrelation histogram
[acor,lag]=xcorr(t);
lag1 = lag/10^7;
plot(lag1,acor)
