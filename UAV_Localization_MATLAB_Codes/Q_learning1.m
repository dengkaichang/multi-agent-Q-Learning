function [stParameters1] = Q_learning1(P_rx,stParameters1,Preceived)

S_Next = Q_State1(stParameters1.Action,Preceived) ; % Identifying the next state
Reward = P_rx; % Reward function

stParameters1.Q_TABLE1(stParameters1.S_Current,stParameters1.Action) = stParameters1.Q_TABLE1(stParameters1.S_Current,stParameters1.Action) + stParameters1.Learning*(Reward + stParameters1.lamda*max(stParameters1.Q_TABLE1(S_Next,:))-stParameters1.Q_TABLE1(stParameters1.S_Current,stParameters1.Action)); % Updating Q-table

Tem = 0.5; % Temperature constant
prob = exp((stParameters1.Q_TABLE1(stParameters1.S_Current,:))/Tem)/(sum(exp((stParameters1.Q_TABLE1(S_Next,:))/Tem)));
Selection1 = Boltzmann1(prob);
stParameters1.Action = Selection1;


stParameters1.S_Current = S_Next; % New state update

% % Updating Q-Table
% stParameters.Action = Action; 
% stParameters.Q_TABLE = Q_Table;
% stParameters.S_Current = S_Current;