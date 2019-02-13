clear all;
clc;
% close all;
addpath(genpath('.'))
dbstop if error
tic;
mapimage=imread('EC.jpg');
ObjObstacle='FindObstacle';
ObjObstacle_1='FindObstacle_1';
ObjObstacle_2='FindObstacle_2';
map = MapObstacleNew();
path = [];
path_1 = [];
path_2 = [];
obstacles = [];
obstacles_1 = [];
obstacles_2 = [];
%figure(1);
%imshow(mapimage);
%hold on;
for iteration=1:10
[stParameters]=initialization;
[stParameters_1]=initialization_1;
[stParameters_2]=initialization_2;
[stParameters_total]=initialization_total;
direction = [];
time=0;             % Initial Time

samplingDuration=2; % Seconds

samplingRate=5*10^3; % Sampling Rate
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
Prec3=[-140 -140 -140];
Prec4=[-140 -140 -140];
alldistence=0;
alldistence_1=0;
alldistence_2=0;
while (Signaling<1)
    
    dist        = stParameters.LocUE-stParameters.LocUAV;
    dist_1        = stParameters_1.LocUE-stParameters_1.LocUAV;
    dist_2        = stParameters_2.LocUE-stParameters_2.LocUAV;
    distance    = sqrt(dist(1)^2+dist(2)^2); %Distance between UE and UAV
    distance_1    = sqrt(dist_1(1)^2+dist_1(2)^2);
    distance_2    = sqrt(dist_2(1)^2+dist_2(2)^2);
    if (distance < 10.1 || distance_1 < 10.1 || distance_2 < 10.1)  %uavSpeed*1.5 %Break condition
        Signaling = 1;
        break;
    end
    stParameters.Learning = (11-stParameters.S_Current)/10;
    stParameters_1.Learning = (11-stParameters_1.S_Current)/10;
    stParameters_2.Learning = (11-stParameters_2.S_Current)/10;
%         stParameters.Learning = (0.75);

    PL   = 128.1 + 37.6 * log10(distance/1000);
    PL_1   = 128.1 + 37.6 * log10(distance_1/1000);
    PL_2   = 128.1 + 37.6 * log10(distance_2/1000);
    RC   = mean(20*log10(abs(filter(c,sig))));
 
    Prec(1) = PT - PL + RC;
    Prec_1(1) = PT - PL_1 + RC;
    Prec_2(1) = PT - PL_2 + RC;

    location=stParameters.LocUAV;
    location_1=stParameters_1.LocUAV;
    location_2=stParameters_2.LocUAV;
    stParameters=Q_learning(Prec(1)-sum(Prec2)/3,stParameters,Prec(1));
    stParameters_1=Q_learning_1(Prec_1(1)-sum(Prec3)/3,stParameters_1,Prec_1(1));
    stParameters_2=Q_learning_2(Prec_2(1)-sum(Prec4)/3,stParameters_2,Prec_2(1));
    % mutli-agent coor-coor
    stParameters.Q_TABLE = stParameters.Q_TABLE - stParameters_total.Q_TABLE;
    stParameters_1.Q_TABLE = stParameters_1.Q_TABLE - stParameters_total.Q_TABLE;
    stParameters_2.Q_TABLE = stParameters_2.Q_TABLE - stParameters_total.Q_TABLE;
    stParameters_total.Q_TABLE = stParameters_total.Q_TABLE + stParameters_2.Q_TABLE + stParameters.Q_TABLE + stParameters_1.Q_TABLE;
    stParameters.Q_TABLE = stParameters_total.Q_TABLE;
    stParameters_1.Q_TABLE = stParameters_total.Q_TABLE;
    stParameters_2.Q_TABLE = stParameters_total.Q_TABLE;
    
    
    oldLoc=stParameters.LocUAV;
    oldLoc_1=stParameters_1.LocUAV;
    oldLoc_2=stParameters_2.LocUAV;
    stParameters.LocUAV = Q_action(stParameters.LocUAV,stParameters.Action,movetime);
    stParameters_1.LocUAV = Q_action(stParameters_1.LocUAV,stParameters_1.Action,movetime);
    stParameters_2.LocUAV = Q_action(stParameters_2.LocUAV,stParameters_2.Action,movetime);
    newLoc=stParameters.LocUAV;
    newLoc_1=stParameters_1.LocUAV;
    newLoc_2=stParameters_2.LocUAV;
    %distence
    pathdistence=sqrt((newLoc(1)-oldLoc(1))^2+(newLoc(2)-oldLoc(2))^2);
    alldistence=alldistence + pathdistence;
    pathdistence_1=sqrt((newLoc_1(1)-oldLoc_1(1))^2+(newLoc_1(2)-oldLoc_1(2))^2);
    alldistence_1=alldistence_1 + pathdistence_1;
    pathdistence_2=sqrt((newLoc_2(1)-oldLoc_2(1))^2+(newLoc_2(2)-oldLoc_2(2))^2);
    alldistence_2=alldistence_2 + pathdistence_2;
    
    ObjValObs = feval(ObjObstacle,map,oldLoc,newLoc);
    ObjValObs_1 = feval(ObjObstacle_1,map,oldLoc_1,newLoc_1);
    ObjValObs_2 = feval(ObjObstacle_2,map,oldLoc_2,newLoc_2);
    
    err = 0;
    err_1 = 0;
    err_2 = 0;
    if (ObjValObs == 100)
        obstacles = [obstacles;newLoc];
        err = 1;
    end
    if (ObjValObs_1 == 100)
        obstacles_1 = [obstacles_1;newLoc_1];
        err_1 = 1;
    end
    if (ObjValObs_2 == 100)
        obstacles_2 = [obstacles_2;newLoc_2];
        err_2 = 1;
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
    while (err_1>0)
        action = ceil(8*rand(1));
        stParameters_1.LocUAV = Q_action(oldLoc_1,action,movetime);
        newLoc_1=stParameters_1.LocUAV;
        ObjValObs_1 = feval(ObjObstacle_1,map,oldLoc_1,newLoc_1);
        if (ObjValObs_1 == 100)
            obstacles_1 = [obstacles_1;newLoc_1];
            err_1 = 1;
        else
            err_1 = 0;
        end
    end
    while (err_2>0)
        action = ceil(8*rand(1));
        stParameters_2.LocUAV = Q_action(oldLoc_2,action,movetime);
        newLoc_2=stParameters_2.LocUAV;
        ObjValObs_2 = feval(ObjObstacle_2,map,oldLoc_2,newLoc_2);
        if (ObjValObs_2 == 100)
            obstacles_2 = [obstacles_2;newLoc_2];
            err_2 = 1;
        else
            err_2 = 0;
        end
    end
    
    path = [path;newLoc];
    Prec2(1) = Prec2(2);
    Prec2(2) = Prec2(3);
    Prec2(3) = Prec(1);
    path_1 = [path_1;newLoc_1];
    Prec3(1) = Prec3(2);
    Prec3(2) = Prec3(3);
    Prec3(3) = Prec_1(1);
    path_2 = [path_2;newLoc_2];
    Prec4(1) = Prec4(2);
    Prec4(2) = Prec4(3);
    Prec4(3) = Prec_2(1);
%     Prec(2)=Prec(1);
    clc;
    time=time+1;
    stParameters.Q_TABLE;
    stParameters_1.Q_TABLE;
    stParameters_2.Q_TABLE;
    stParameters.LocUAV;
    stParameters_1.LocUAV;
    stParameters_2.LocUAV;
    stParameters.Action;
    stParameters_1.Action;
    stParameters_2.Action;
    figure(1);
    hold on;
    plot(10*[oldLoc(1) newLoc(1)],10*[oldLoc(2) newLoc(2)],'b','LineWidth',1);
    hold on;
    plot(10*[oldLoc_1(1) newLoc_1(1)],10*[oldLoc_1(2) newLoc_1(2)],'r','LineWidth',1);
    hold on;
    plot(10*[oldLoc_2(1) newLoc_2(1)],10*[oldLoc_2(2) newLoc_2(2)],'g','LineWidth',1);
    hold on;
    stParameters.LocUAV
    stParameters_1.LocUAV
    stParameters_2.LocUAV
    stParameters.Q_TABLE
    stParameters_1.Q_TABLE
    stParameters_2.Q_TABLE
    stParameters_total.Q_TABLE
end
Sure = toc;
timer(iteration)=time*samplingDuration;
eachdistence(iteration)=alldistence;
eachdistence_1(iteration)=alldistence_1;
eachdistence_2(iteration)=alldistence_2;
end
timer
avgt = sum(timer)/iteration
%eachdistence
%avgalldistence = sprintf('%2f',sum(eachdistence)/iteration)
%eachdistence_1
%avgalldistence_1 = sprintf('%.2f',sum(eachdistence_1)/iteration)
%eachdistence_2
%avgalldistence_2 = sprintf('%.2f',sum(eachdistence_2)/iteration)