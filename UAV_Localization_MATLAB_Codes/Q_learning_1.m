
function [stParameters] = Q_learning_1(P_rx,stParameters,Preceived)
%eval(SplitStruct('stParameters'))
S_Next = Q_State(stParameters.Action,Preceived) ; % Identifying the next state
Reward = P_rx; % Reward function

stParameters.Q_TABLE_1(stParameters.S_Current,stParameters.Action) = stParameters.Q_TABLE_1(stParameters.S_Current,stParameters.Action) + stParameters.Learning*(Reward + stParameters.lamda*max(stParameters.Q_TABLE_1(S_Next,:))-stParameters.Q_TABLE_1(stParameters.S_Current,stParameters.Action)); % Updating Q-table


Tem = 0.5; % Temperature constant
prob = exp((stParameters.Q_TABLE_1(stParameters.S_Current,:))/Tem)/(sum(exp((stParameters.Q_TABLE_1(S_Next,:))/Tem)));
Selection = Boltzmann(prob);
stParameters.Action = Selection;


stParameters.S_Current = S_Next; % New state update

% % Updating Q-Table
% stParameters.Action = Action; 
% stParameters.Q_TABLE = Q_Table;
% stParameters.S_Current = S_Current;