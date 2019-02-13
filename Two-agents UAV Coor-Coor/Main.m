opengl('software');
opengl('hardware');
clear
clc;
close all;
addpath(genpath('.'))
dbstop if error
for iteration=1:1
[stParameters]=initialization;

time=0;             % Initial Time
samplingtime=2*10^-5; % Seconds
movetime=8;       % Movement time
Signaling=0;        % While loop until distance<10m
PT=13;              % Transmit Power
Prec(2)=-140;
while (Signaling<1)

    dist        = stParameters.LocUE-stParameters.LocUAV;
    distance    = sqrt(dist(1)^2+dist(2)^2); %Distance between UE and UAV
    if distance < 10.1 %Break condition
        Signaling = 1;
        break;
    end
   % stParameters.Learning = (11-stParameters.S_Current)/10;
    PL   = 128.1 + 37.6 * log10( distance/1000);
  
    RC   = -20*log10(Shadowing(samplingtime));
    Prec(1) = PT - PL %- 1*RC
      pause();
    location=stParameters.LocUAV;
    stParameters=Q_learning(Prec(1)-Prec(2),stParameters,Prec(1));
    oldLoc=stParameters.LocUAV;
    stParameters.LocUAV = Q_action(stParameters.LocUAV,stParameters.Action,movetime);
    newLoc=stParameters.LocUAV;
    Prec(2)=Prec(1);
    clc;
    time=time+1
    stParameters.Q_TABLE
    stParameters.LocUAV
    stParameters.Action
    plot([oldLoc(1) newLoc(1)],[oldLoc(2) newLoc(2)]);
    hold on;
    
end
timer(iteration)=time;
end