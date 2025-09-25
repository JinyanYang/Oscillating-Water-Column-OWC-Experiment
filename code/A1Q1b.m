%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Name: Jinyan Yang                    %
%Student Number: D00264564            %
%Date: 18/10/2024                     %
%this script find the wave length for %
%waves of a period of 10 seconds and  %
%water depths varying from 10 to 100  %
%meters and periods 3 seconds to 10 s %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%do the housekeeping

clear                 %clear the workspace
clc                   %clear the command window
clear all             %clear any open figures

%now declare everything that we know
T = 3:1:10;               % wave period in minutes
g = 9.81;             % acceration due to gravity in m/s^2
inc = 1;              %this is the depth increment in m
start = 1;            %start depth
finish = 200;         %finish depth
d = start:inc:finish; %these are the depth in m

for cnt2 = 1:length(T)
    for cnt = 1:length(d)
        L(cnt,cnt2)=((g*T(cnt2)^2)/(2*pi))*sqrt(tanh((4*pi^2*d(cnt))/(T(cnt2)^2*g)));
        C(cnt,cnt2)= L(cnt,cnt2)/T(cnt2);
    end
end

%now plot the results
figure()
plot(d,L(:,1),'b','LineWidth', 2)
hold on
plot(d,L(:,2),'c','LineWidth', 2)
plot(d,L(:,3),'y','LineWidth', 2)
plot(d,L(:,4),'k','LineWidth', 2)
grid on
xlabel('Water depth in meters')
ylabel('Wavelength in meters')
legend ('T=3s','T=4s','T=5s','T=6s')
title('Variation in L with d for different wave period')

figure()
plot(d,L(:,5),'b','LineWidth', 2)
hold on
plot(d,L(:,6),'c','LineWidth', 2)
plot(d,L(:,7),'y','LineWidth', 2)
plot(d,L(:,8),'k','LineWidth', 2)
grid on
xlabel('Water depth in meters')
ylabel('Wavelength in meters')
legend ('T=7s','T=8s','T=9s','T=10s')
title('Variation in L with d for different wave period')

figure()
plot(d,C(:,1),'b','LineWidth', 2)
hold on
plot(d,C(:,2),'c','LineWidth', 2)
plot(d,C(:,3),'y','LineWidth', 2)
plot(d,C(:,4),'k','LineWidth', 2)
grid on
xlabel('Water depth in meters')
ylabel('Celerity in meters')
legend ('T=3s','T=4s','T=5s','T=6s')
title('Variation in C with d for different wave period')

figure()
plot(d,C(:,5),'b','LineWidth', 2)
hold on
plot(d,C(:,6),'c','LineWidth', 2)
plot(d,C(:,7),'y','LineWidth', 2)
plot(d,C(:,8),'k','LineWidth', 2)
grid on
xlabel('Water depth in meters')
ylabel('Celerity in meters')
legend ('T=7s','T=8s','T=9s','T=10s')
title('Variation in C with d for different wave period')
% figure()
% plot(d,L,'r','LineWidth', 2)
% xlabel('depth in meters')
% ylabel('Wavelength in meters')
% grid on
% legend ('period T=10')
% 
% figure()
% plot(d,C,'g','LineWidth', 2)
% xlabel('depth in meters')
% ylabel('Celerity in meters')
% grid on
% legend ('period T=10')
% 
% figure()
% plot(d,L,'r','LineWidth', 2)
% hold on
% plot(d,C,'g','LineWidth', 2)
% xlabel('depth in meters')
% ylabel('Wavelength or Celerity')
% grid on
% legend ('Wavelength','Celerity')
