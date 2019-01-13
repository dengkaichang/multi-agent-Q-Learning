function [ out ] = Q_action1( loc, action, time )
x=loc(1);
y=loc(2);
if action==1;
    y=y-1*time;
end
if action==2;
    x=x+1*time;
end
if action==3;
    y=y+1*time;
end
if action==4;
    x=x-1*time;
end
if action==5;
    x=x-1*time;
    y=y-1*time;
end
if action==6;
    x=x+1*time;
    y=y+1*time;
end
if action==7;
    x=x-1*time;
    y=y+1*time;
end
if action==8;
    x=x+1*time;
    y=y-1*time;
end
out=[x y];
end