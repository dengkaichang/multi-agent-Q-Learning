function [stParameters] = initialization
stParameters.LocUAV     = [80 100];  % Initial Loc. of UAV
stParameters.LocUE      = [157 375];          % Initial Loc. of UE
stParameters.Learning   = 1;              % Learning Rate
stParameters.lamda      = 0 ;              % Discount Rate
stParameters.Action     = randi(8);              % Initial Action
stParameters.S_Current  = 10;             % Initial state
stParameters.Q_TABLE  = 0*ones(10,8);
end
%%%%% Action Mapping %%%%%
% 1 : South
% 2 : East
% 3 : North
% 4 : West
% 5 : South-West
% 6 : North-East
% 7 : North-West
% 8 : South-East