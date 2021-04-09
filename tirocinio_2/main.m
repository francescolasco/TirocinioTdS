clear
clc
close all

B = [0; 1];

%% due autovalori reali e distinti, entrambi negativi.

gamma_1 = -3;
gamma_2 = -1;

A = [0 1; gamma_1 gamma_2];

G = myGram(A,B)

%% due autovalori reali e distinti, uno negativo e uno positivo.

gamma_1 = 3;
gamma_2 = -1;

A = [0 1; gamma_1 gamma_2];

G = myGram(A,B)

%% due autovalori complessi coniugati.

gamma_1 = -3;
gamma_2 = -1;

A = [0 1; gamma_1 gamma_2];

G = myGram(A,B)