
function [stParameters_total] = Q_learning_total(P_rx,stParameters_total,Preceived)
%eval(SplitStruct('stParameters'))
S_Next = Q_State(stParameters_total.Action,Preceived) ; % Identifying the next state
Reward = P_rx; % Reward function

stParameters_total.Q_TABLE(stParameters_total.S_Current,stParameters_total.Action) = stParameters_total.Q_TABLE(stParameters_total.S_Current,stParameters_total.Action) + stParameters_total.Learning*(Reward + stParameters_total.lamda*max(stParameters_total.Q_TABLE(S_Next,:))-stParameters_total.Q_TABLE(stParameters_total.S_Current,stParameters_total.Action)); % Updating Q-table


Tem = 0.5; % Temperature constant
prob = exp((stParameters_total.Q_TABLE(stParameters_total.S_Current,:))/Tem)/(sum(exp((stParameters_total.Q_TABLE(S_Next,:))/Tem)));
Selection = Boltzmann(prob);
stParameters_total.Action = Selection;


stParameters_total.S_Current = S_Next; % New state update

% % Updating Q-Table
% stParameters.Action = Action; 
% stParameters.Q_TABLE = Q_Table;
% stParameters.S_Current = S_Current;