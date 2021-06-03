clear;
close all;
clc;

global hf; % make h a global variable so it can be used outside the main

%% Create Matlab Figure Container
f=1; %megnification factor of the figure contenier
fpos    = get(0,'DefaultFigurePosition'); % figure default position
fpos(1) = fpos(1);
fpos(2) = 475;
fpos(3) = f*475; % figure window size;Width
fpos(4) = f*2*325; % Height
 
f1 = figure('Position', fpos,...
           'Menu','None',...
           'Name','APT GUI');
       
%% Create ActiveX Controller
hf = actxcontrol('MGMOTOR.MGMotorCtrl.1',[f*10 f*330 f*450 f*300 ], f1);
pause(5)
hf.StartCtrl;
SN =85860874;
set(hf,'HWSerialNum', SN);
pause(2)
hf.SC_Enable(0)  %chanal id 1 is 0
hf.SC_Disable(0)

hf.SC_SetCycleParams(0, 500, 500, 4) %in ms unit for auto ans single mood
hf.SC_SetOperatingMode(0,1) %mannual mood
hf.SC_SetOperatingMode(0,2)  %single mood then --3 4




