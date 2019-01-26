
function [stParameters_1] = Q_learning_1(P_rx,stParameters_1,Preceived)
%eval(SplitStruct('stParameters'))
S_Next = Q_State(stParameters_1.Action,Preceived) ; % Identifying the next state
Reward = P_rx; % Reward function

stParameters_1.Q_TABLE(stParameters_1.S_Current,stParameters_1.Action) = stParameters_1.Q_TABLE(stParameters_1.S_Current,stParameters_1.Action) + stParameters_1.Learning*(Reward + stParameters_1.lamda*max(stParameters_1.Q_TABLE(S_Next,:))-stParameters_1.Q_TABLE(stParameters_1.S_Current,stParameters_1.Action)); % Updating Q-table


Tem = 0.5; % Temperature constant
prob = exp((stParameters_1.Q_TABLE(stParameters_1.S_Current,:))/Tem)/(sum(exp((stParameters_1.Q_TABLE(S_Next,:))/Tem)));
Selection = Boltzmann(prob);
stParameters_1.Action = Selection;


stParameters_1.S_Current = S_Next; % New state update

% % Updating Q-Table
% stParameters.Action = Action; 
% stParameters.Q_TABLE = Q_Table;
% stParameters.S_Current = S_Current;