clc
clear all
%% LOAD DATA
data_P300_path = 'Donnees8/ref_P300';
data_NP300_path = 'Donnees8/ref_NP300';
load(data_P300_path);
load(data_NP300_path);


%% DATA ANALYSIS
%% Histograms - P300 And NP300
% E1
figure()
nbins = 30;
histogram(ref_P300(:,1),nbins)
hold on
histogram(ref_NP300(:,1),nbins)
legend('P300','NP300')
title('E1 Parameter Histogram')
hold off

% E2
figure()
nbins = 30;
histogram(ref_P300(:,2),nbins)
hold on
histogram(ref_NP300(:,2),nbins)
legend('P300','NP300')
title('E2 Parameter Histogram')
hold off

% E3
figure()
nbins = 30;
histogram(ref_P300(:,3),nbins)
hold on
histogram(ref_NP300(:,3),nbins)
legend('P300','NP300')
title('E3 Parameter Histogram')
hold off

% E4
figure()
nbins = 30;
histogram(ref_P300(:,4),nbins)
hold on
histogram(ref_NP300(:,4),nbins)
legend('P300','NP300')
title('E4 Parameter Histogram')
hold off