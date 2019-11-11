clc
% close all
% clear all
%% LOAD TEST DATA
data_P300_path = 'Donnees8/test_P300';
data_NP300_path = 'Donnees8/test_NP300';
load(data_P300_path);
load(data_NP300_path);
%% Bayes parameters
% Cost
false_neg_cost = 3;
false_pos_cost = 1;
L = [ 0 false_neg_cost ; false_pos_cost 0 ];
% Dimension
dimensions = 4;
M = dimensions;
% Data
X = cat(1,ref_P300,ref_NP300);
%% BAYES FORMULA NOTES
% P(Ci|X)= P(X|Ci) * P(Ci) / P(X)
% where P(X) = sum[i = L, L]( P(X|Ci) * P(Ci) )
% where also P(A|B) = P(A ^ B) / P(B)
%% Bayes - A : Classification Algorithm (wih hypothesis of Gauss laws only)
% Calculate P(Ci)
P_C_P300 = length(ref_P300) / (length(ref_P300) + length(ref_NP300));
P_C_NP300 = length(ref_NP300) / (length(ref_P300) + length(ref_NP300));

% Calculate P(X)
P_X_P300 = 1/length(ref_P300); 
P_X_NP300 = 1/length(ref_NP300); 

%P300
for i = 1:length(test_P300)
% Calculate P(X|Ci)
%P_X_C_P300 = 1 /( ((2*pi)^(M/2)) * (det(CoP300)^(1/2)) ) * exp(-1/2 * (test_P300(i,:)'-mP300)' * inv(CoP300) * (test_P300(i,:)'-mP300));
% Calculate P(Ci|X)
P_C_P300_X(i) = ( 1 /( ((2*pi)^(M/2)) * (det(CoP300)^(1/2)) ) * exp(-1/2 * (test_P300(i,:)'-mP300)' * inv(CoP300) * (test_P300(i,:)'-mP300)) ) * P_C_P300 / P_X_P300;
end



%% Bayes - B : Classification Algorithm (without Gauss laws hypothesis, without mathematical expression of frontiers, with Bayes Risk)


%% Bayes - C : Classification Algorithm (with mathematical expression of frontiers, with hypothesis of Gauss Density Probability)