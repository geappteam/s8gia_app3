clc
close all
clear all
%% LOAD DATA
data_P300_path = 'Donnees8/ref_P300';
data_NP300_path = 'Donnees8/ref_NP300';
load(data_P300_path);
load(data_NP300_path);
%% DATA ANALYSIS
%% Histograms - P300
figure(1)
nbins = 30;
histogram(ref_P300(:,1),nbins)
hold on
histogram(ref_P300(:,2),nbins)
hold on
histogram(ref_P300(:,3),nbins)
hold on
histogram(ref_P300(:,4),nbins)
legend('E1','E2','E3','E4')
title('P300 Histogram')
hold off

%% Plotting electrode signals - P300
figure(2)
t = 0:length(ref_P300)-1;
plot(t,ref_P300(:,1),t,ref_P300(:,2),t,ref_P300(:,3),t,ref_P300(:,4));
legend('E1','E2','E3','E4')
title('P300 Signals')

%% Histograms - NP300
figure(3)
nbins = 30;
histogram(ref_NP300(:,1),nbins)
hold on
histogram(ref_NP300(:,2),nbins)
hold on
histogram(ref_NP300(:,3),nbins)
hold on
histogram(ref_NP300(:,4),nbins)
legend('E1','E2','E3','E4')
title('NP300 Histogram')
hold off

%% Plotting electrode signals - NP300
figure(4)
t = 0:length(ref_NP300)-1;
plot(t,ref_NP300(:,1),t,ref_NP300(:,2),t,ref_NP300(:,3),t,ref_NP300(:,4));
legend('E1','E2','E3','E4')
title('NP300 Signals')

%% Correlation - P300
corr_E1_E2_P300 = corr(ref_P300(:,1),ref_P300(:,2));
corr_E1_E3_P300 = corr(ref_P300(:,1),ref_P300(:,3));
corr_E1_E4_P300 = corr(ref_P300(:,1),ref_P300(:,4));
corr_E2_E3_P300 = corr(ref_P300(:,2),ref_P300(:,3));
corr_E2_E4_P300 = corr(ref_P300(:,2),ref_P300(:,4));
corr_E3_E4_P300 = corr(ref_P300(:,3),ref_P300(:,4));
%% Correlation - NP300
corr_E1_E2_NP300 = corr(ref_NP300(:,1),ref_NP300(:,2));
corr_E1_E3_NP300 = corr(ref_NP300(:,1),ref_NP300(:,3));
corr_E1_E4_NP300 = corr(ref_NP300(:,1),ref_NP300(:,4));
corr_E2_E3_NP300 = corr(ref_NP300(:,2),ref_NP300(:,3));
corr_E2_E4_NP300 = corr(ref_NP300(:,2),ref_NP300(:,4));
corr_E3_E4_NP300 = corr(ref_NP300(:,3),ref_NP300(:,4));

%% Autocorrelation - P300
autocorrP300 = [xcorr(ref_P300(:,1),ref_P300(:,1)) xcorr(ref_P300(:,2),ref_P300(:,2)) xcorr(ref_P300(:,3),ref_P300(:,3)) xcorr(ref_P300(:,4),ref_P300(:,4))];
t = 0:1:length(autocorrP300)-1;

figure(5)
plot(t,autocorrP300);
legend('E1','E2','E3','E4')
title('P300 All Signals Autocorrelated')

figure(6)
plot(t,autocorrP300(:,1));
legend('E1')
title('P300 E1 Signal Autocorrelated')

figure(7)
plot(t,autocorrP300(:,2));
legend('E2')
title('P300 E2 Signal Autocorrelated')

figure(8)
plot(t,autocorrP300(:,3));
legend('E3')
title('P300 E3 Signal Autocorrelated')

figure(9)
plot(t,autocorrP300(:,4));
legend('E4')
title('P300 E4 Signal Autocorrelated')

%% Autocorrelation - NP300
autocorrNP300 = [xcorr(ref_NP300(:,1),ref_NP300(:,1)) xcorr(ref_NP300(:,2),ref_NP300(:,2)) xcorr(ref_NP300(:,3),ref_NP300(:,3)) xcorr(ref_NP300(:,4),ref_NP300(:,4))];
t = 0:1:length(autocorrNP300)-1;

figure(10)
plot(t,autocorrNP300);
legend('E1','E2','E3','E4')
title('NP300 All Signals Autocorrelated')

figure(11)
plot(t,autocorrNP300(:,1));
legend('E1')
title('NP300 E1 Signal Autocorrelated')

figure(12)
plot(t,autocorrNP300(:,2));
legend('E2')
title('NP300 E2 Signal Autocorrelated')

figure(13)
plot(t,autocorrNP300(:,3));
legend('E3')
title('NP300 E3 Signal Autocorrelated')

figure(14)
plot(t,autocorrNP300(:,4));
legend('E4')
title('NP300 E4 Signal Autocorrelated')

%% Plot Distribution 4D - P300
figure(15)
scatter3(ref_P300(:,1),ref_P300(:,2),ref_P300(:,3),30,ref_P300(:,4),'filled')
xlabel('E1')
ylabel('E2')
zlabel('E3')
cb = colorbar;                  
cb.Label.String = 'E4';
title('P300 Distribution')

%% Plot Distribution 4D - NP300
figure(16)
scatter3(ref_NP300(:,1),ref_NP300(:,2),ref_NP300(:,3),30,ref_NP300(:,4),'filled')
xlabel('E1')
ylabel('E2')
zlabel('E3')
cb = colorbar;                  
cb.Label.String = 'E4';
title('NP300 Distribution')

%% Plot Distribution 4D - P300 And NP300
% E4 Colored 
figure(17)
hold on
hP300 = scatter3(ref_P300(:,1),ref_P300(:,2),ref_P300(:,3),30,ref_P300(:,4),'filled','o','MarkerEdgeColor',[1 0 0],'LineWidth',2);
hNP300 = scatter3(ref_NP300(:,1),ref_NP300(:,2),ref_NP300(:,3),50,ref_NP300(:,4),'filled','s','MarkerEdgeColor',[0 0 0]);
xlabel('E1')
ylabel('E2')
zlabel('E3')
cb = colorbar;                  
cb.Label.String = 'E4';
title('P300 And NP300 Distribution')
legend('P300','NP300')
grid('on')
hold off

% E3 Colored 
figure(18)
hold on
hP300 = scatter3(ref_P300(:,4),ref_P300(:,1),ref_P300(:,2),30,ref_P300(:,3),'filled','o','MarkerEdgeColor',[1 0 0],'LineWidth',2);
hNP300 = scatter3(ref_NP300(:,4),ref_NP300(:,1),ref_NP300(:,2),50,ref_NP300(:,3),'filled','s','MarkerEdgeColor',[0 0 0]);
xlabel('E4')
ylabel('E1')
zlabel('E2')
cb = colorbar;                  
cb.Label.String = 'E3';
title('P300 And NP300 Distribution')
legend('P300','NP300')
grid('on')
hold off

% E2 Colored 
figure(19)
hold on
hP300 = scatter3(ref_P300(:,3),ref_P300(:,4),ref_P300(:,1),30,ref_P300(:,2),'filled','o','MarkerEdgeColor',[1 0 0],'LineWidth',2);
hNP300 = scatter3(ref_NP300(:,3),ref_NP300(:,4),ref_NP300(:,1),50,ref_NP300(:,2),'filled','s','MarkerEdgeColor',[0 0 0]);
xlabel('E3')
ylabel('E4')
zlabel('E1')
cb = colorbar;                  
cb.Label.String = 'E2';
title('P300 And NP300 Distribution')
legend('P300','NP300')
grid('on')
hold off

% E1 Colored 
figure(20)
hold on
hP300 = scatter3(ref_P300(:,2),ref_P300(:,3),ref_P300(:,4),30,ref_P300(:,1),'filled','o','MarkerEdgeColor',[1 0 0],'LineWidth',2);
hNP300 = scatter3(ref_NP300(:,2),ref_NP300(:,3),ref_NP300(:,4),50,ref_NP300(:,1),'filled','s','MarkerEdgeColor',[0 0 0]);
xlabel('E2')
ylabel('E3')
zlabel('E4')
cb = colorbar;                  
cb.Label.String = 'E1';
title('P300 And NP300 Distribution')
legend('P300','NP300')
grid('on')
hold off

%% Histograms - P300 And NP300
% E1
figure(21)
nbins = 30;
histogram(ref_P300(:,1),nbins)
hold on
histogram(ref_NP300(:,1),nbins)
legend('P300','NP300')
title('E1 Parameter Histogram')
hold off

% E2
figure(22)
nbins = 30;
histogram(ref_P300(:,2),nbins)
hold on
histogram(ref_NP300(:,2),nbins)
legend('P300','NP300')
title('E2 Parameter Histogram')
hold off

% E3
figure(23)
nbins = 30;
histogram(ref_P300(:,3),nbins)
hold on
histogram(ref_NP300(:,3),nbins)
legend('P300','NP300')
title('E3 Parameter Histogram')
hold off

% E4
figure(21)
nbins = 30;
histogram(ref_P300(:,4),nbins)
hold on
histogram(ref_NP300(:,4),nbins)
legend('P300','NP300')
title('E4 Parameter Histogram')
hold off

%% Mean - P300
mean_E1_P300 = sum(ref_P300(:,1))/length(ref_P300(:,1));
mean_E2_P300 = sum(ref_P300(:,2))/length(ref_P300(:,2));
mean_E3_P300 = sum(ref_P300(:,3))/length(ref_P300(:,3));
mean_E4_P300 = sum(ref_P300(:,4))/length(ref_P300(:,4));

mP300 = [mean_E1_P300; mean_E2_P300; mean_E3_P300; mean_E4_P300];

%% Mean - NP300
mean_E1_NP300 = sum(ref_NP300(:,1))/length(ref_NP300(:,1));
mean_E2_NP300 = sum(ref_NP300(:,2))/length(ref_NP300(:,2));
mean_E3_NP300 = sum(ref_NP300(:,3))/length(ref_NP300(:,3));
mean_E4_NP300 = sum(ref_NP300(:,4))/length(ref_NP300(:,4));

mNP300 = [mean_E1_NP300; mean_E2_NP300; mean_E3_NP300; mean_E4_NP300];

%% Covariance - P300
ctmpE11 = [(ref_P300(:,1)-mP300(1)) (ref_P300(:,1)-mP300(1))];
ctmpE12 = [(ref_P300(:,1)-mP300(1)) (ref_P300(:,2)-mP300(2))];
ctmpE13 = [(ref_P300(:,1)-mP300(1)) (ref_P300(:,3)-mP300(3))];
ctmpE14 = [(ref_P300(:,1)-mP300(1)) (ref_P300(:,4)-mP300(4))];
ctmpE21 = [(ref_P300(:,2)-mP300(2)) (ref_P300(:,1)-mP300(1))];
ctmpE22 = [(ref_P300(:,2)-mP300(2)) (ref_P300(:,2)-mP300(2))];
ctmpE23 = [(ref_P300(:,2)-mP300(2)) (ref_P300(:,3)-mP300(3))];
ctmpE24 = [(ref_P300(:,2)-mP300(2)) (ref_P300(:,4)-mP300(4))];
ctmpE31 = [(ref_P300(:,3)-mP300(3)) (ref_P300(:,1)-mP300(1))];
ctmpE32 = [(ref_P300(:,3)-mP300(3)) (ref_P300(:,2)-mP300(2))];
ctmpE33 = [(ref_P300(:,3)-mP300(3)) (ref_P300(:,3)-mP300(3))];
ctmpE34 = [(ref_P300(:,3)-mP300(3)) (ref_P300(:,4)-mP300(4))];
ctmpE41 = [(ref_P300(:,4)-mP300(4)) (ref_P300(:,1)-mP300(1))];
ctmpE42 = [(ref_P300(:,4)-mP300(4)) (ref_P300(:,2)-mP300(2))];
ctmpE43 = [(ref_P300(:,4)-mP300(4)) (ref_P300(:,3)-mP300(3))];
ctmpE44 = [(ref_P300(:,4)-mP300(4)) (ref_P300(:,4)-mP300(4))];

CoE11 = (ctmpE11(:,1)' * ctmpE11(:,2)) / (length(ctmpE11)-1);
CoE12 = (ctmpE12(:,1)' * ctmpE12(:,2)) / (length(ctmpE12)-1);
CoE13 = (ctmpE13(:,1)' * ctmpE13(:,2)) / (length(ctmpE13)-1);
CoE14 = (ctmpE14(:,1)' * ctmpE14(:,2)) / (length(ctmpE14)-1);
CoE21 = (ctmpE21(:,1)' * ctmpE21(:,2)) / (length(ctmpE21)-1);
CoE22 = (ctmpE22(:,1)' * ctmpE22(:,2)) / (length(ctmpE22)-1);
CoE23 = (ctmpE23(:,1)' * ctmpE23(:,2)) / (length(ctmpE23)-1);
CoE24 = (ctmpE24(:,1)' * ctmpE24(:,2)) / (length(ctmpE24)-1);
CoE31 = (ctmpE31(:,1)' * ctmpE31(:,2)) / (length(ctmpE31)-1);
CoE32 = (ctmpE32(:,1)' * ctmpE32(:,2)) / (length(ctmpE32)-1);
CoE33 = (ctmpE33(:,1)' * ctmpE33(:,2)) / (length(ctmpE33)-1);
CoE34 = (ctmpE34(:,1)' * ctmpE34(:,2)) / (length(ctmpE34)-1);
CoE41 = (ctmpE41(:,1)' * ctmpE41(:,2)) / (length(ctmpE41)-1);
CoE42 = (ctmpE42(:,1)' * ctmpE42(:,2)) / (length(ctmpE42)-1);
CoE43 = (ctmpE43(:,1)' * ctmpE43(:,2)) / (length(ctmpE43)-1);
CoE44 = (ctmpE44(:,1)' * ctmpE44(:,2)) / (length(ctmpE44)-1);

Co = [CoE11 CoE12 CoE13 CoE14 ; CoE21 CoE22 CoE23 CoE24; CoE31 CoE32 CoE33 CoE34; CoE41 CoE42 CoE43 CoE44];

% PCA
coeffPCA_ref_P300 = pca(ref_P300,'Algorithm','eig','Rows','all')
coeffPCA_ref_NP300 = pca(ref_NP300,'Algorithm','eig','Rows','all')

% Eigenvalues
syms lenda
eqn1 = det(Co - lenda * eye(size(Co))) == 0;
eigen_values = vpasolve(eqn1,lenda);

% % Eigenvectors (*tried without eig() Matlab's function : Failure)
% eigen_vectors = zeros(size(Co));
% for i = 1:length(eigen_values)
%     syms a b c d
%     u = [a b c d]';
%     eqns = (Co - eigen_values(i) * eye(size(Co))) * u == 0;
%     S = solve(eqns, [a;b;c;d],'Real',true);
%     eigen_vectors(:,i) = [S.a; S.b; S.c; S.d]'
% end
[eigen_vectors,Diag_eigen_values] = eig(Co);


