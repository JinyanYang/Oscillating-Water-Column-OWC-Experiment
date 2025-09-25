%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Name: Jinyan Yang                    %
%Student Number: D00264564            %
%Date: 25/10/2024                     %
%this script find the wave length for %
%a 10 sec wave. It then plot the      %
%variation in horizontal particle     %
%velocity as it varies with thime for %
%some chosen depth and plts the rsults%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%do the housekeeping

clear                 %clear the workspace
clc                   %clear the command window
close all             %clear any open figures

%define water know
Amp =2.5;  %Amplitude of the wave in m
H = 2*Amp; % waveheight is twice the amplitude
g = 9.81;  % acceration due to gravity in m/s^2
rho = 1025; %density of water kg/m3
T = 10;    % wave period in minutes
d = 100; %wave depth in m
z= -d:0.1:0; %immersion vector
patmos = 101325;%atmosperic pressure

%Now find wave length, L

L=((g*T^2)/(2*pi))*sqrt(tanh((4*pi^2*d)/(T^2*g)));


for cnt = 1:length(z)
    pdym(cnt)= rho*g*H*cosh(2*pi*(z(cnt)+d)/L)/(2*cosh(2*pi*d/L));
    pstat(cnt)= -rho*g*z(cnt);
    pgauge(cnt)= pdym(cnt)+ pstat(cnt);
    pabs(cnt)= pgauge(cnt)+patmos;
end

figure()
plot(pdym,z,'r','linewidth',2)
hold on
plot(pstat,z,'g','linewidth',2)
plot(pgauge,z,'r','linewidth',2)
plot(pabs,z,'b','linewidth',2)
xlabel('Pressure Pa')
ylabel('Depth m')
legend('pdym','pstat','pgauge','pabs')

figure()
plot(pdym,z,'r','linewidth',2)
xlabel('Pressure Pa')
ylabel('Depth m')
legend('pdym','pstat','pgauge','pabs')

Pow = (rho*g^2*H^2*T)/(32*pi); % power in kW/m
disp('This energy flux in this wave per metre wave crest is')
Pow