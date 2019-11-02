close all
clear all
%% LOAD DATA
data_P300_path = 'Donnees8/ref_P300'
data_NP300_path = 'Donnees8/ref_NP300'
load(data_P300_path)
load(data_NP300_path)
%% DATA ANALYSIS
figure(1)
nbins = 30
histogram(ref_P300(:,1),nbins)
hold on
histogram(ref_P300(:,2),nbins)
hold on
histogram(ref_P300(:,3),nbins)
hold on
histogram(ref_P300(:,4),nbins)
legend('E1','E2','E3','E4')
title('P300')
hold off

figure(2)
t = 0:length(ref_P300)-1;
plot(t,ref_P300(:,1),t,ref_P300(:,2),t,ref_P300(:,3),t,ref_P300(:,4));
legend('E1','E2','E3','E4')
title('P300')

figure(3)
nbins = 30
histogram(ref_NP300(:,1),nbins)
hold on
histogram(ref_NP300(:,2),nbins)
hold on
histogram(ref_NP300(:,3),nbins)
hold on
histogram(ref_NP300(:,4),nbins)
legend('E1','E2','E3','E4')
title('NP300')
hold off

figure(4)
t = 0:length(ref_NP300)-1;
plot(t,ref_NP300(:,1),t,ref_NP300(:,2),t,ref_NP300(:,3),t,ref_NP300(:,4));
legend('E1','E2','E3','E4')
title('NP300')

%Correlation - P300
corr_E1_E2_P300 = corr(ref_P300(:,1),ref_P300(:,2));
corr_E1_E3_P300 = corr(ref_P300(:,1),ref_P300(:,3));
corr_E1_E4_P300 = corr(ref_P300(:,1),ref_P300(:,4));
corr_E2_E3_P300 = corr(ref_P300(:,2),ref_P300(:,3));
corr_E2_E4_P300 = corr(ref_P300(:,2),ref_P300(:,4));
corr_E3_E4_P300 = corr(ref_P300(:,3),ref_P300(:,4));
%Correlation - NP300
corr_E1_E2_NP300 = corr(ref_NP300(:,1),ref_NP300(:,2));
corr_E1_E3_NP300 = corr(ref_NP300(:,1),ref_NP300(:,3));
corr_E1_E4_NP300 = corr(ref_NP300(:,1),ref_NP300(:,4));
corr_E2_E3_NP300 = corr(ref_NP300(:,2),ref_NP300(:,3));
corr_E2_E4_NP300 = corr(ref_NP300(:,2),ref_NP300(:,4));
corr_E3_E4_NP300 = corr(ref_NP300(:,3),ref_NP300(:,4));

%Mean - P300
mean_E1_P300 = sum(ref_P300(:,1))/length(ref_P300(:,1));
mean_E2_P300 = sum(ref_P300(:,2))/length(ref_P300(:,2));
mean_E3_P300 = sum(ref_P300(:,3))/length(ref_P300(:,3));
mean_E4_P300 = sum(ref_P300(:,4))/length(ref_P300(:,4));

mP300 = [mean_E1_P300; mean_E2_P300; mean_E3_P300; mean_E4_P300];

%Mean - NP300
mean_E1_NP300 = sum(ref_NP300(:,1))/length(ref_NP300(:,1));
mean_E2_NP300 = sum(ref_NP300(:,2))/length(ref_NP300(:,2));
mean_E3_NP300 = sum(ref_NP300(:,3))/length(ref_NP300(:,3));
mean_E4_NP300 = sum(ref_NP300(:,4))/length(ref_NP300(:,4));

mNP300 = [mean_E1_NP300; mean_E2_NP300; mean_E3_NP300; mean_E4_NP300];

%Covariance - P300
ctmpE11 = [ref_P300(:,1) - mP300(1) ref_P300(:,1) - mP300(1)];
ctmpE12 = [ref_P300(:,1) - mP300(1) ref_P300(:,2) - mP300(2)];
ctmpE13 = [ref_P300(:,1) - mP300(1) ref_P300(:,3) - mP300(3)];
ctmpE14 = [ref_P300(:,1) - mP300(1) ref_P300(:,4) - mP300(4)];
ctmpE22 = [ref_P300(:,2) - mP300(2) ref_P300(:,2) - mP300(2)];
ctmpE23 = [ref_P300(:,2) - mP300(2) ref_P300(:,3) - mP300(3)];
ctmpE24 = [ref_P300(:,2) - mP300(2) ref_P300(:,4) - mP300(4)];
ctmpE33 = [ref_P300(:,3) - mP300(3) ref_P300(:,3) - mP300(3)];
ctmpE34 = [ref_P300(:,3) - mP300(3) ref_P300(:,4) - mP300(4)];
ctmpE44 = [ref_P300(:,4) - mP300(4) ref_P300(:,4) - mP300(4)];

CoE11 = (ctmpE11(:,1)' * ctmpE11(:,2)) / length(ctmpE11);
CoE12 = (ctmpE12(:,1)' * ctmpE12(:,2)) / length(ctmpE12);
CoE13 = (ctmpE13(:,1)' * ctmpE13(:,2)) / length(ctmpE13);
CoE14 = (ctmpE14(:,1)' * ctmpE14(:,2)) / length(ctmpE14);
CoE22 = (ctmpE22(:,1)' * ctmpE22(:,2)) / length(ctmpE22);
CoE23 = (ctmpE23(:,1)' * ctmpE23(:,2)) / length(ctmpE23);
CoE24 = (ctmpE24(:,1)' * ctmpE24(:,2)) / length(ctmpE24);
CoE33 = (ctmpE33(:,1)' * ctmpE33(:,2)) / length(ctmpE33);
CoE34 = (ctmpE34(:,1)' * ctmpE34(:,2)) / length(ctmpE34);
CoE44 = (ctmpE44(:,1)' * ctmpE44(:,2)) / length(ctmpE44);


