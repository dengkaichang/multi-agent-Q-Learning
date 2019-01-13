function [stParameters1] = initialization1
stParameters1.LocUAV     = [80 100];  % Initial Loc. of UAV
stParameters1.LocUAV1    = [80 375];  % Initial Loc. of UAV1
stParameters1.LocUE      = [235 375];          % Initial Loc. of UE
stParameters1.Learning   = 1;              % Learning Rate
stParameters1.lamda      = 0 ;              % Discount Rate
stParameters1.Action     = randi(8);              % Initial Action
stParameters1.S_Current  = 10;             % Initial state
stParameters1.Q_TABLE  = 0*ones(10,8);
stParameters1.Q_TABLE1 = 0*ones(10,8);
end