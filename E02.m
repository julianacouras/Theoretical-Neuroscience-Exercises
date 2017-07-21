close all
clear all

T = 10; %s

dt = 0.001; %s
N = T/dt;

tau = 0.005; %s

t= zeros(1,N);
r= zeros(1,N);
r(1) = 100; %Hz

for i = 1:N
    if dt*r(i)>rand;
        t(i) = 1;
        r(i+1) = 0;
    else
        t(i) = 0;
        r(i+1) = r(i)+dt*((r(1)-r(i))/tau);
    end
end

%Fano factor
n = mean(t);
sigma = std(t);
fano = sigma^2/n

%Coefficient of variation
times = find(t);
isi=zeros(1,length(times));
isi(1) = times(1);
for i= 2:length(times)
    isi(i) = times(i) - times(i-1);
end
mean_isi=mean(isi);
sigma_isi = std(isi);
Cv = mean_isi/sigma_isi

%ISI Histogram
hist(isi)