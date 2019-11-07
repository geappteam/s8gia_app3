clc
close all
clear all
%% LOAD DATA
data_P300_path = 'Donnees8/ref_P300';
data_NP300_path = 'Donnees8/ref_NP300';
load(data_P300_path);
load(data_NP300_path);

ref_set = [ref_P300; ref_NP300];

%% Averages
avg_P300 = sum(ref_P300) ./ size(ref_P300, 1);
avg_NP300 = sum(ref_NP300) ./ size(ref_NP300, 1);
avg_set = sum(ref_set) ./ size(ref_set, 1);

%% Covariance
cov_set = cov(ref_set);

%% Eigenvalues and vectors
[eig_vectors, eig_values] = eig(cov_set)

%% Dimension reduction

% Choosing the dimensions with the highest variance