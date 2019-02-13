% *************************************************************************%
% MODULE:         Q_learning.m
% COMPILER:       Matlab R2011b
% LANGUAGE:       Matlab Interpreter.
% Author:         Nadisanka Rupasinghe, 
% ABSTRACT:       UE Localizing with Q-Learning
% I/P:            Received power, Location (x,y)
% TIME-STAMP:     10-15-2014
% Q-Table size : 134 x 8 ; No. of Actions : 8 ; No. of states : 134
%**************************************************************************
function [stParameters] = Q_learning(P_rx,stParameters,Preceived)
%eval(SplitStruct('stParameters'))
S_Next = Q_State(stParameters.Action,Preceived) ; % Identifying the next state
Reward = P_rx; % Reward function
% Bekir
% stParameters.Q_TABLE(stParameters.S_Current,stParameters.Action) = (1-stParameters.Learning)*stParameters.Q_TABLE(stParameters.S_Current,stParameters.Action) + stParameters.Learning*(Reward + stParameters.lamda*max(stParameters.Q_TABLE(S_Next,:))); % Updating Q-table
% Adem
stParameters.Q_TABLE(stParameters.S_Current,stParameters.Action) = stParameters.Q_TABLE(stParameters.S_Current,stParameters.Action) + stParameters.Learning*(Reward + stParameters.lamda*max(stParameters.Q_TABLE(S_Next,:))-stParameters.Q_TABLE(stParameters.S_Current,stParameters.Action)); % Updating Q-table

% %Boltzmann Based
Tem = 0.5; % Temperature constant
prob = exp((stParameters.Q_TABLE(stParameters.S_Current,:))/Tem)/(sum(exp((stParameters.Q_TABLE(S_Next,:))/Tem)));
Selection = Boltzmann(prob);
stParameters.Action = Selection;
%%%%%%%%
% pause();
% epsilon=0.1;
% % epsilon greedy policy based Q_learning
% if(rand(1)<epsilon)
%     act=ceil(8*rand(1));
%     stParameters.Action = act; % Random action selection
%     stParameters.Action;
% else
%     [~,stParameters.Action] = max(stParameters.Q_TABLE(S_Next,:)); % New Action
%         stParameters.Action;
% end

stParameters.S_Current = S_Next; % New state update

% % Updating Q-Table
% stParameters.Action = Action; 
% stParameters.Q_TABLE = Q_Table;
% stParameters.S_Current = S_Current;