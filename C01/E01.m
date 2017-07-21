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

