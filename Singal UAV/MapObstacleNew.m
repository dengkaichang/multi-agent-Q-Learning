 function map = MapObstacleNew()
    map = ones(315,475);
	map(75:240,95:380)=0;
	
	% 1.engel
% 85,105
% 150,160

map(85:150,105:160)=1;

% 2.engel
% 160,105
% 230,160

map(160:230,105:160)=1;

% 3.engel
% 85,170
% 150,230

map(85:150,170:230)=1;

% 4. engel
% 160,170
% 230,230

map(160:230,170:230)=1;

% 5. engel
% 85,240
% 150,300

map(85:150,240:300)=1;

% 6. engel
% 160,240
% 230,300

map(160:230,240:300)=1;

% 7. engel
% 85,310
% 150,370

map(85:150,310:370)=1;

% 8. engel
% 160,310
% 230,370

map(160:230,310:370)=1;

	
    % hold on;
    % x = 100;
    % for k=1:4
        % for i=x:x+100
            % for j=100:200
                % map(i,j) = 1;
                % plot(i,j,'bo');
            % end
            % for j=300:400
                % map(i,j) = 1;
                % plot(i,j,'bo');
            % end
            % f	or j=500:600
                % map(i,j) = 1;
                % plot(i,j,'bo');
            % end
            % for j=700:800
                % map(i,j) = 1;
                % plot(i,j,'bo');
            % end
        % end
        % x = x + 200;
    % end

    % for i=1:1000
        % for j=1:20
            % map(i,j)=1; plot(i,j,'bo');
            % map(j,i)=1; plot(j,i,'bo');
        % end
     % end
    % for i=980:1000
        % for j=1:1000
            % map(i,j)=1; plot(i,j,'bo');
            % map(j,i)=1; plot(j,i,'bo');
        % end
    % end
 end
