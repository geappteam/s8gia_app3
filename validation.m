clc
close all
clear all

decor3
clc
close all

data_P300_path = 'Donnees8/test_P300';
data_NP300_path = 'Donnees8/test_NP300';
load(data_P300_path);
load(data_NP300_path);

t_P300 = (test_P300 * -tt) + 1.3026;
res_t_P300 = mean(t_P300 < front)
e_t_P300 = 1- res_t_P300
t_NP300 = (test_NP300 * -tt) + 1.3026;
res_t_NP300 = mean(t_NP300 >= front)
e_t_NP300 = 1 - res_t_NP300