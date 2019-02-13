clear all;
clc;
% close all;
addpath(genpath('.'))
dbstop if error
tic;
% mapimage=imread('MAP.jpg');
ObjObstacle='FindObstacle';
map = MapObstacleNew();
path = [];
obstacles = [];
% figure(1);
% imshow(mapimage);
% hold on;
for iteration=1:20
[stParameters]=initialization;
direction = [];
time=0;             % Initial Time


samplingDuration=1; % Seconds


samplingRate=2*10^3; % Sampling Rate
numberofSamples=round(samplingRate*samplingDuration);
uavSpeed = 1.38889*2; % meters / second 5 icin carpan 1, 10 icin 2
CarrierFrequency=900*10^6; % 900 MHz - Not BW!
speedofLight=3*10^8; % in m/s
maxDopplerShift = uavSpeed*CarrierFrequency/speedofLight; % Maximum Doppler Shift
c = rayleighchan(1/samplingRate,maxDopplerShift); % Generate Channel
sig = 1i*ones(numberofSamples,1);  % Generate signal

% movetime=8;       % Movement time
movetime=uavSpeed*samplingDuration;       % Movement time
% movetime = 10;
Signaling=0;        % While loop until distance<10m
PT=13;              % Transmit Power
Prec2=[-140 -140 -140];
while (Signaling<1)
    
    dist        = stParameters.LocUE-stParameters.LocUAV;
    distance    = sqrt(dist(1)^2+dist(2)^2); %Distance between UE and UAV
    if distance < 10.1  %uavSpeed*1.5 %Break condition
        Signaling = 1;
        break;
    end
    stParameters.Learning = (11-stParameters.S_Current)/10;

    PL   = 128.1 + 37.6 * log10(distance/1000);
    RC   = mean(20*log10(abs(filter(c,sig))));
 
    Prec(1) = PT - PL + RC;

    location=stParameters.LocUAV;
    stParameters=Q_learning(Prec(1)-sum(Prec2)/3,stParameters,Prec(1));
    oldLoc=stParameters.LocUAV;
    stParameters.LocUAV = Q_action(stParameters.LocUAV,stParameters.Action,movetime);
    newLoc=stParameters.LocUAV;
    ObjValObs = feval(ObjObstacle,map,oldLoc,newLoc);
    
    err = 0;
    if (ObjValObs == 100)
        obstacles = [obstacles;newLoc];
        err = 1;
    end
    
    while (err>0)
        action = ceil(8*rand(1));
        stParameters.LocUAV = Q_action(oldLoc,action,movetime);
        newLoc=stParameters.LocUAV;
        ObjValObs = feval(ObjObstacle,map,oldLoc,newLoc);
        if (ObjValObs == 100)
            obstacles = [obstacles;newLoc];
            err = 1;
        else
            err = 0;
        end
    end
    path = [path;newLoc];
    Prec2(1) = Prec2(2);
    Prec2(2) = Prec2(3);
    Prec2(3) = Prec(1);
%     Prec(2)=Prec(1);
    clc;
    time=time+1;
    stParameters.Q_TABLE;
    stParameters.LocUAV;
    stParameters.Action;
%     figure(1);
%     hold on;
%     plot([oldLoc(1) newLoc(1)],[oldLoc(2) newLoc(2)],'b','LineWidth',1);
%     hold on;
%     stParameters.LocUAV
%     stParameters.Q_TABLE
end
Sure = toc;
timer(iteration)=time*samplingDuration;
end
timer
ort = sum(timer)/iteration