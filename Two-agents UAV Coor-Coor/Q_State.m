% *************************************************************************%
% MODULE:         QL_State.m
%
% ABBREVIATION:   None.
%
% COMPILER:       Matlab R2011b
%
% LANGUAGE:       Matlab Interpreter.
%
% Changed by:     Nadisanka Rupasinghe, 
%
% ABSTRACT:       Identify UAV State
%
% TIME-STAMP:     10-15-2014
%**************************************************************************
function S_Next = Q_State(Action,Preceived)

S_Next = 0; % Vector state
%%%% State based on Location %%%%

% if ((Loc(1)>0 && Loc(2)>0) && (abs(Loc(1))>= abs(Loc(2))))
%        S_Next(1) = 1;
% elseif((Loc(1)>0 && Loc(2)>0) && (abs(Loc(1))< abs(Loc(2))))
%        S_Next(1) = 2;
% elseif((Loc(1)<0 && Loc(2)>0) && (abs(Loc(1))< abs(Loc(2))))
%        S_Next(1) = 3;
% elseif((Loc(1)<0 && Loc(2)>0) && (abs(Loc(1))>= abs(Loc(2))))
%        S_Next(1) = 4;
% elseif ((Loc(1)<0 && Loc(2)<0) && (abs(Loc(1))>= abs(Loc(2))))
%        S_Next(1) = 5;
% elseif ((Loc(1)<0 && Loc(2)<0) && (abs(Loc(1))< abs(Loc(2))))
%        S_Next(1) = 6;
% elseif ((Loc(1)>0 && Loc(2)<0) && (abs(Loc(1))< abs(Loc(2))))
%        S_Next(1) = 7;
% elseif ((Loc(1)>0 && Loc(2)<0) && (abs(Loc(1))>= abs(Loc(2))))
%        S_Next(1) = 8;
% end

%%%% State based on Power %%%%
if Preceived>=-50
    S_Next=1;
elseif (Preceived<-50)&&(Preceived>=-72)
    S_Next=2;
elseif (Preceived<-72)&&(Preceived>=-82)
    S_Next=3;
elseif (Preceived<-82)&&(Preceived>=-92)
    S_Next=4;
elseif (Preceived<-92)&&(Preceived>=-102)
    S_Next=5;
elseif (Preceived<-102)&&(Preceived>=-110)
    S_Next=6;
elseif (Preceived<-110)&&(Preceived>=-115)
    S_Next=7;
elseif (Preceived<-115)&&(Preceived>=-118)
    S_Next=8;
elseif (Preceived<-118)&&(Preceived>=-120)
    S_Next=9;
elseif Preceived<-120
    S_Next=10;
end
% for i = 1:3
%     if(i==1)
%         S_Next = 1; % 134 different states
%     end
% end
% if (P_rx < -90)
%     S_Next(2) = 1;
% elseif(-90 <= P_rx < -80)
%     S_Next(2) = 2;
% elseif (-80 <= P_rx < -70)
%     S_Next(2) = 3;
% elseif(-70 <= P_rx < -60)
%     S_Next(2) = 4;
% elseif(-60 <= P_rx < -50)
%     S_Next(2) = 5;
% elseif(-50 <= P_rx < -40)
%     S_Next(2) = 6;
% elseif(-40 <= P_rx < -30)
%     S_Next(2) = 7;
% elseif(-30 <= P_rx < -20)
%     S_Next(2) = 8;
% elseif(-20 <= P_rx < -10)
%     S_Next(2) = 9;
% elseif(-10 <= P_rx < 0)
%     S_Next(2) = 10;
% elseif(0 <= P_rx < 10)
%     S_Next(2) = 11;
% elseif(10 <= P_rx)
%     S_Next(2) = 12;
% end
   