% clear
clear
clc
close all

%% Define G1, G2, G3, G4, H1, H2, and  H3

G1_num = [1];
G1_den = [1 0 0];

G2_num = [1];
G2_den = [1 1];

G3_num = [1];
G3_den = [1 0];

G4_num = [1];
G4_den = [2 0];

H1_num = [1];
H1_den = [1 0];

H2_num = [1];
H2_den = [1 -1];

H3_num = [1];
H3_den = [1 -2];

%% Reduce Block Diagrams

H3G4_num = conv(H3_num, G4_num)
H3G4_den = conv(H3_den, G4_den)

H3G4G3_num = conv(H3G4_num, G3_num)
H3G4G3_den = conv(H3G4_den, G3_den)

H3G4G3_den_sum = [2 -4 0 1]

TF1_num = conv(H3G4G3_den, G3_num)
TF1_den = conv(H3G4G3_den_sum, G3_den)



G2TF1_num = conv(G2_num, TF1_num)
G2TF1_den = conv(G2_den, TF1_den)

G2TF1_num_G2TF1_den = conv(G2TF1_num, G2TF1_den)

G2TF1_den_H2_den = conv(G2TF1_den, H2_den)
G2TF1_num_H2_num = conv(G2TF1_num, H2_num)
G2TF1_den_H2_den_G2TF1_num_H2_num_sum = [2 -4 -2 7 -4 -1 0]

TF2_num = conv(G2TF1_num_G2TF1_den, H2_den)
TF2_den = conv(G2TF1_den_H2_den_G2TF1_num_H2_num_sum, G2TF1_den)



G1G4_num = conv(G1_num, G4_num)
G1G4_den = conv(G1_den, G4_den)

G1G4TF2_num = conv(G1G4_num, TF2_num)
G1G4TF2_den = conv(G1G4_den, TF2_den)

G1G4TF2_num_G1G4TF2_den = conv(G1G4TF2_num, G1G4TF2_den)

G1G4TF2_den_H1_den = conv(G1G4TF2_den, H1_den)
G1G4TF2_num_H1_num = conv(G1G4TF2_num, H1_num)
G1G4TF2_den_H1_den_G1G4TF2_num_H1_num_sum = [8 -24 -8 72 -32 -56 50 -2 2 16 -20 -2 4 0 0 0]

TF3_num = conv(G1G4TF2_num_G1G4TF2_den, H1_den)
TF3_den = conv(G1G4TF2_den_H1_den_G1G4TF2_num_H1_num_sum, G1G4TF2_den)







