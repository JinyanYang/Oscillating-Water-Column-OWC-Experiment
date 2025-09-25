%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Name: Jinyan Yang                    %
%Student Number: D00264564            %
%Date: 25/10/2024                     %
%this script find the wave length for %
%a 10 sec wave. it checks to see if   %
%the wave is a deep or shallow water  %
%wave and tells the user. it then     %
%finds the variation in water particle% 
%horizontal and vertical velocities   %
%with depth and plots the results     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%do the housekeeping

clear                 %clear the workspace
clc                   %clear the command window
clear all             %clear any open figures

%define waht we know
T = 10;               % wave period in minutes
g = 9.81;             % acceration due to gravity in m/s^2

%pick a water depth to sart with
d = 110; %my first guess in m
H = 0.25; % half meter wave height until we settle on a depth

%find the wavelength for this wave

L=((g*T^2)/(2*pi))*sqrt(tanh((4*pi^2*d)/(T^2*g)));

% now check if the wave is deep or shallow

if d/L < 1/20
    disp('This is a shallow water wave')
elseif d/L > 1/2
    disp('This is a deep water wave')
elseif d/L >= 1/20 && d/L <= 1/2
    disp('This is a transitional water wave')
else 
    disp('Something went wrong')
end

% define z

z= -d:d/100:0;


%now use a for loop to find the max horizontal and vertical velocities at
%each deoth. To do this we let cos theta and sin theta be equal to one
%respectivey

for cnt = 1:length(z)
    u(cnt) = (H/2)*(g*T/L)*((cosh(2*pi*(z(cnt)+d)/L))/(cosh(2*pi*d/L)));
    w(cnt) = (H/2)*(g*T/L)*((sinh(2*pi*(z(cnt)+d)/L))/(cosh(2*pi*d/L)));
end

figure()
plot(u,z,'r','LineWidth',3)
hold on
plot(w,z,'c','LineWidth',1.5)
xlabel('magnitude of velocity m/s')
ylabel('immersion depth')
legend('horiz','vert')
grid on
ylim([-d 0])