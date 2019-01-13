clear all;clc;

hiz_5 = [4143 3425 2491 2328 1896 1837];
hiz_10 = [1564 1044 840 663 693 814];
hiz_15 = [684 517 414 519 520 698];

timing = [0.5 1 1.5 2 2.5 3];

hold on;
grid on;
figure(1)
% plot(timing,hiz_2,'-bs','LineWidth',2,'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor','b')
plot(timing,hiz_5,'-.gs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','g','MarkerFaceColor','g')
plot(timing,hiz_10,'--rs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','r','MarkerFaceColor','r')
plot(timing,hiz_15,'-bs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','b','MarkerFaceColor','b')

set(gca, 'XTick', timing);
xlabel('Sampling Duration (sec.)');
ylabel('Convergence (Iteration)');
legend('Speed 5 km/h', 'Speed 10 km/h', 'Speed 15 km/h');
    

    