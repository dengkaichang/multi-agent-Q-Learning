function map = MapObstacle()
    map = zeros(1000,1000);
    hold on;
    x = 100;
    for k=1:4
        for i=x:x+100
            for j=100:200
                map(i,j) = 1;
                plot(i,j,'bo');
            end
            for j=300:400
                map(i,j) = 1;
                plot(i,j,'bo');
            end
            for j=500:600
                map(i,j) = 1;
                plot(i,j,'bo');
            end
            for j=700:800
                map(i,j) = 1;
                plot(i,j,'bo');
            end
        end
        x = x + 200;
    end

    for i=1:1000
        for j=1:20
            map(i,j)=1; plot(i,j,'bo');
            map(j,i)=1; plot(j,i,'bo');
        end
     end
    for i=980:1000
        for j=1:1000
            map(i,j)=1; plot(i,j,'bo');
            map(j,i)=1; plot(j,i,'bo');
        end
    end
end
