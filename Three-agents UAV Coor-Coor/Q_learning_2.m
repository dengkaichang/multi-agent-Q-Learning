
function [stParameters_2] = Q_learning_2(P_rx,stParameters_2,Preceived)
%eval(SplitStruct('stParameters'))
S_Next = Q_State(stParameters_2.Action,Preceived) ; % Identifying the next state
Reward = P_rx; % Reward function

stParameters_2.Q_TABLE(stParameters_2.S_Current,stParameters_2.Action) = stParameters_2.Q_TABLE(stParameters_2.S_Current,stParameters_2.Action) + stParameters_2.Learning*(Reward + stParameters_2.lamda*max(stParameters_2.Q_TABLE(S_Next,:))-stParameters_2.Q_TABLE(stParameters_2.S_Current,stParameters_2.Action)); % Updating Q-table


Tem = 0.5; % Temperature constant
prob = exp((stParameters_2.Q_TABLE(stParameters_2.S_Current,:))/Tem)/(sum(exp((stParameters_2.Q_TABLE(S_Next,:))/Tem)));
Selection = Boltzmann(prob);
stParameters_2.Action = Selection;


stParameters_2.S_Current = S_Next; % New state update

% % Updating Q-Table
% stParameters.Action = Action; 
% stParameters.Q_TABLE = Q_Table;
% stParameters.S_Current = S_Current;