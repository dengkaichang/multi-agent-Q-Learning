clear all;clc;

% timing = [0.05 0.1 0.3 0.5 1 2 3 5 7 10];
% 
% boltzman1 = [3432 2083 1524 1057 758 637 597 743 827 670];
% greedy1 = [3725 2375 878 857 420 396 389 521 704 1084];
% 
% boltzman2 = [];
% greedy2 = [];
% 
% 
% hold on;
% figure(1)
% plot(timing,boltzman1,'-bs','LineWidth',2,'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor','b')
% plot(timing,greedy1,'-rs','LineWidth',2,'MarkerSize',3,'MarkerEdgeColor','r','MarkerFaceColor','r')
% % plot(timing,boltzmann2,'-bs','LineWidth',2,'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor','b')
% % plot(timing,greedy2,'-rs','LineWidth',2,'MarkerSize',3,'MarkerEdgeColor','r','MarkerFaceColor','r')
% 
% set(gca, 'XTick', timing);
% xlabel('Timing');
% ylabel('Coverage Time');
% legend('Boltzmann', 'Greedy');

map = zeros(1000,1000);
    hold on;
%     x = 200;
%     for k=1:2
%         for i=x:x+200
%             for j=200:400
%                 map(i,j) = 1;
%                 plot(i,j,'bo');
%             end
%         end
%         x = x + 400;
%     end
%     x = 200;
%     for k=1:2
%         for i=x:x+200
%             for j=600:800
%                 map(i,j) = 1;
%                 plot(i,j,'bo');
%             end
%         end
%         x = x + 400;
%     end
    for k=1:1000
        map(1,k) = 1;
        plot(1,k,'bo');
        map(k,1) = 1;
        plot(k,1,'bo');
        map(1000,k) = 1;
        plot(1000,k,'bo');
        map(k,1000) = 1;
        plot(k,1000,'bo');
    end





