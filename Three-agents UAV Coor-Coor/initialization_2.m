function [stParameters_2] = initialization_2
stParameters_2.LocUAV     = [80 150];  % Initial Loc. of UAV
stParameters_2.LocUE      = [157 375];          % Initial Loc. of UE
stParameters_2.Learning   = 1;              % Learning Rate
stParameters_2.lamda      = 0 ;              % Discount Rate
stParameters_2.Action     = randi(8);              % Initial Action
stParameters_2.S_Current  = 10;             % Initial state
stParameters_2.Q_TABLE  = 0*ones(10,8);
end