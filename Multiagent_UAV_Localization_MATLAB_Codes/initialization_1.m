function [stParameters_1] = initialization_1
stParameters_1.LocUAV     = [235 150];  % Initial Loc. of UAV
stParameters_1.LocUE      = [157 375];          % Initial Loc. of UE
stParameters_1.Learning   = 0.6;              % Learning Rate
stParameters_1.lamda      = 0 ;              % Discount Rate
stParameters_1.Action     = randi(8);              % Initial Action
stParameters_1.S_Current  = 10;             % Initial state
stParameters_1.Q_TABLE  = 0*ones(10,8);
end