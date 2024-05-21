%Clear
clear
clc
close all

%% Define G1, G2, G3, H1, H2, and H3
G1_num = [1];
G2_num = [1];
G3_num = [1];

G1_den = [1 0 0];
G2_den = [1 1];
G3_den = [1 0];

H1_num = [1];
H2_num = [1];
H3_num = [1];

H1_den = [1 0];
H2_den = [1 -1];
H3_den = [1 -2];

%% Reduce Block Diagrams
% For G3 and H3
G3H3_num = conv(G3_num,H3_num);
G3H3_den = conv(G3_den,H3_den);

G3H3_sum = [1 -2 1];

TFG3H3_num = conv(G3_num,G3H3_den);
TFG3H3_den = conv(G3_den,G3H3_sum);

% For 1/G2 only
G2_sum = [1 2];

TFG2_num = conv(G2_sum,G2_den);
TFG2_den = conv(G2_den,G2_num);

TFG2G3H3_num = conv(TFG2_num,TFG3H3_num); % TF numerator of G2 and G3 with H3
TFG2G3H3_den = conv(TFG2_den,TFG3H3_den); % TF denominator of G2 and G3 with H3

% For G2 and H2
G2H2_num = conv(G2_num,H2_num);
G2H2_den = conv(G2_den,H2_den);

G2H2_sum = [1 0 0];

TFG2H2_num = conv(G2_num,G2H2_den);
TFG2H2_den = conv(G2_den,G2H2_sum);

% For G1 and G2H2
G1G2H2_num = conv(G1_num,TFG2H2_num);
G1G2H2_den = conv(G1_den,TFG2H2_den);

% For G1-G2H2 and H1
G1G2H1H2_num = conv(G1G2H2_num,H1_num);
G1G2H1H2_den = conv(G1G2H2_den,H1_den);

G1G2H1H2_sum = [1 1 0 0 1 0 -1];

TFG1G2H1H2_num = conv(G1G2H2_num,G1G2H1H2_den);  % TF numerator of G1, G2, H1, H2 total
TFG1G2H1H2_den = conv(G1G2H2_den,G1G2H1H2_sum);  % TF Total denominator of of G1, G2, H1, H2 total

TF_num = conv(TFG2G3H3_num,TFG1G2H1H2_num) % TF Total
TF_den = conv(TFG2G3H3_den,TFG1G2H1H2_den) % TF Total

