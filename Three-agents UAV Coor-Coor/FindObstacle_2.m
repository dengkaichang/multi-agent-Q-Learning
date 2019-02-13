
function ObjValObs_2 = FindObstacle_2(map,old,new)
    Penalty = 100;
    TempObjValObs = 0;
    x1 = floor(old(1)); y1 = floor(old(2));
    x2 = floor(new(1)); y2 = floor(new(2));
%     x1 = old(1); y1 = old(2);
%     x2 = new(1); y2 = new(2);
    x_ekseni = 0; y_ekseni = 0; xy=0;

    if (x1>0 && x2>0 && y1>0 && y2>0)    
        % Ayn? noktalar tekrarlanmýþsa
        if(x1==x2 && y1==y2)
            xy=1;
        end;
        % Noktalar engel mi?
        if(map(x1,y1)==1 || map(x2,y2)==1)
            TempObjValObs=Penalty;
        end;
        % Y ekseni üzerindeki noktalar aras? engeller aranýyor
        if(x1==x2 && y1~=y2) 
            y_ekseni = 1;
            if(y1<y2)
                ilk=y1;son=y2;
            else
                ilk=y2;son=y1;
            end;
            for k=ilk:son
                    if(map(x1,k)==1)
                        TempObjValObs=Penalty;
                    end;
            end;
        end;
        % X ekseni üzerindeki noktalar aras? engeller aranýyor
        if(y1==y2 && x1~=x2) 
             x_ekseni = 1;
            if(x1<x2)
                ilk=x1;son=x2;
            else
                ilk=x2;son=x1;
            end;
            for k=ilk:son
                    if(map(k,y1)==1)
                        TempObjValObs=Penalty;
                    end;
            end;
        end;
        % Çapraz yollar hesaplanýyor.
        if(x_ekseni == 0 &&  y_ekseni == 0 && xy==0)
            cap1 = []; cap2 = []; cap3 = [];
            dx = abs(x1-x2);
            dy = abs(y1-y2);
            if(y1>y2)
                temp = x1; x1 = x2; x2 = temp;
                temp = y1; y1 = y2; y2 = temp;
            end;
            egim = dy/dx;
            if(x1<x2)
                dongu = 1;
            end;
            if(x1>x2)
                dongu = 2;
            end;
            if(dongu==1)
                if (dx>=dy)
                    for n=1:dx-1
                         cap1(n,1)=x1+n;
                         cap1(n,2) = y1 + floor(0.5 + egim*(n-0.5));
                         cap2(n,1)=x1+n;
                         cap2(n,2) = y1 + floor(0.5 + egim*n);
                         cap3(n,1)=x1+n;
                         cap3(n,2) = y1 + floor(0.5 + egim*(n+0.5));
                    end;
                else
                    for n=1:dy-1
                        cap1(n,2)=y1+n;
                        cap1(n,1) = x1 + floor(0.5 + (1/egim)*(n-0.5));
                        cap2(n,2)=y1+n;
                        cap2(n,1) = x1 + floor(0.5 + (1/egim)*n);
                        cap3(n,2)=y1+n;
                        cap3(n,1) = x1 + floor(0.5 + (1/egim)*(n+0.5));
                    end;
                end;
            end;
            if(dongu==2)
                if (dx>=dy)
                    for n=1:dx-1
                         cap1(n,1)=x1-n;
                         cap1(n,2) = y1+floor(0.5+egim*(n-0.5));
                         cap2(n,1)=x1-n;
                         cap2(n,2) = y1+floor(0.5+egim*n);
                         cap3(n,1)=x1-n;
                         cap3(n,2) = y1+floor(0.5+egim*(n+0.5));
                    end;
                else
                    for n=1:dy-1
                        cap1(n,2)=y1+n;
                        cap1(n,1) = x1-floor(0.5+(1/egim)*(n-0.5));
                        cap2(n,2)=y1+n;
                        cap2(n,1) = x1-floor(0.5+(1/egim)*n);
                        cap3(n,2)=y1+n;
                        cap3(n,1) = x1-floor(0.5+(1/egim)*(n+0.5));
                    end;
                end;
            end;
            [c_sat c_sut] = size(cap1);
            for k=1:c_sat
                    if(map(cap1(k,1),cap1(k,2))==1)
                            TempObjValObs=Penalty;
                    end;
                    if(map(cap2(k,1),cap2(k,2))==1)
                            TempObjValObs=Penalty;
                    end;
                    if(map(cap3(k,1),cap3(k,2))==1)
                            TempObjValObs=Penalty;
                    end;
            end;
        end;
    end;
    ObjValObs_2 = TempObjValObs;
end
    %%%% Bresenham Line
%     d = [1023 1023 512 341 256 205 171 146 128 114 102 93 85 79 73 68];
%             x1 = old(1); y1 = old(2);
%             x2 = new(1); y2 = new(2);
%             dx=abs(x2-x1);
%             dy=abs(y2-y1);
%             if (dx>dy)
%                 m=dx;
%             else
%                 m=dy;
%             end;
%             m1 = d(m+1);
%             ix= (x2-x1)*m1;
%             iy= (y2-y1)*m1;
%             fx = 1024*x1;
%             fy = 1024*y1;
%             while (m>0) 
%                 px = floor((fx+512)/1024);
%                 py = floor((fy+512)/1024);
%                 fx = fx+ix;
%                 fy = fy+iy;
%                 m = m-1;
%                 if(map(px,py)==1)
%                     ObjValObs = Penalty;
%                 end;
%             end;