function [stParameters_total] = initialization_total

stParameters_total.Learning   = 1;              % Learning Rate
stParameters_total.lamda      = 0 ;              % Discount Rate
stParameters_total.Action     = randi(8);              % Initial Action
stParameters_total.S_Current  = 10;             % Initial state
stParameters_total.Q_TABLE  = 0*ones(10,8);
end