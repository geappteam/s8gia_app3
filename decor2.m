clc
clear all


%% Reduction de 3 a deux composantes
decor

t_set = [t_P300; t_NP300];

%% Averages
avg_P300 = sum(t_P300) ./ size(t_P300, 1);
avg_NP300 = sum(t_NP300) ./ size(t_NP300, 1);
avg_set = sum(t_set) ./ size(t_set, 1);

%% Covariance
cov_set = cov(t_set)

%% Eigenvalues and vectors
[eig_vectors, eig_values] = eig(cov_set)

%% Dimension reduction

% Choosing the dimensions with the highest variance
dimension_count = 2;
[~, max_values_index] = maxk(eig_values * ones(3,1), dimension_count);

tt = unit_vectors * eig_vectors(max_values_index, :)'
unit_vectors = eig_vectors(max_values_index, :)';

%% Transforming data

t_P300 = (t_P300) * unit_vectors;
t_NP300 = (t_NP300) * unit_vectors;

figure()
hold on
grid('on')
title('Decorrelation 3 composantes')
scatter(t_P300(:,1), t_P300(:,2))
scatter(t_NP300(:,1), t_NP300(:,2), 'x')
legend('P300', 'NP300')
hold off


%% Histograms - P300 And NP300
% T2D1
figure()
nbins = 30;
h = histfit(t_P300(:,1),nbins);
h(1).FaceAlpha = 0.5;
hold on
h = histfit(t_NP300(:,1),nbins);
h(1).FaceAlpha = 0.5;
legend('P300','' ,'NP300', '')
title('T2D1 Parameter Histogram')
hold off

% T2D2
figure()
nbins = 30;
h = histfit(t_P300(:,2),nbins);
h(1).FaceAlpha = 0.5;
hold on
h = histfit(t_NP300(:,2),nbins);
h(1).FaceAlpha = 0.5;
legend('P300','' ,'NP300', '')
title('T2D2 Parameter Histogram')
hold off
