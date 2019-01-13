function S_Next = Q_State1(Action,Preceived)

S_Next = 0; % Vector state

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