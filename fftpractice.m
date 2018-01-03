clear;
close;
ts = 1; % time step
t = 0:ts:23; 
fs = 1/ts; % frequency step
f= (-length(t)/2:length(t)/2-1)/(length(t)*ts); % frequency formula

%data
P=[10.7083
    9.7003
    8.9780
    8.4531
    8.1653
    8.2633
    8.8795
    9.9850
   11.3289
   12.5172
   13.2012
   13.2720
   12.9435
   12.6647
   12.8940
   13.8516
   15.3819
   17.0033
   18.1227
   18.3039
   17.4531
   15.8322
   13.9056
   12.1154];

plot(t,P,'LineWidth',1.5);grid
xlabel('time (hours)');ylabel('Power (MW)')
title('Power Profile for 2nd Feb, 1998')

% fourier transform analysis
P1 = fft(P)/length(t);
P2=fftshift(P1);
amp=abs(P2); % amplitude
phi = angle(P2); % phase angle

figure
subplot(211),stem(f,amp,'LineWidth',1.5),grid
xlabel('frequency (Hz)');ylabel('amplitude (MW)')
subplot(212),stem(f,phi,'LineWidth',1.5),grid
xlabel('frequency (Hz)');ylabel('phase angle (rad)')


% NOW, I WILL CONSTRUCT THE MODEL FROM THE FIGURE
% THE STRUCTURE IS:
% Pmodel=Ai*COS(i*w*t+phii)
% where,  w=2*pi/24  and  i is the harmonic order
% Here, up to the third harmonic is enough
% and using Parseval's Theorem, the model is:

% PP=12.6635+2*(1.9806*cos(w*tt+1.807)+0.86388*cos(2*w*tt+2.0769)+0.39683*cos(3*w*tt-    1.8132));

w=2*pi/24;

Pmodel=12.6635+2*(1.9806*cos(w*t+1.807)+0.86388*cos(2*w*t+2.0769)+0.39686*cos(3*w*t-1.8132));

figure
plot(t,P,'LineWidth',1.5);grid on
hold on;
plot(t,Pmodel,'r','LineWidth',1.5)
legend('original','model');xlabel('time (hours )');ylabel('Power (MW)')