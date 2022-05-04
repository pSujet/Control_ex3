%% Control 2022
% Computer exercise 3
% Sujet Phodapol 
% Matthew Lock

%% 4.1 Suppression of disturbances
%% Design Controller
s = tf('s');
G = 1e4*(s+2)/((s+3)*(s+100)^2);
Hinf(G);
% For WS
% s = -0.1 + sqrt((100*pi)^2-0.1^2), -0.1 - sqrt((100*pi)^2-0.1^2)
% Gain = 1

%% Choose S
epsilon = 0.1;
w = 2*pi*50;
sqrt(w^2-epsilon^2)

%% Simulation
Gsim = 1e4*(s+2)/((s+3)*(s+100)^2);     % Plant
Fsim = F;                               % Controller
macro;

%% Compute Gain
S = 1/(1+F*G);
% S_100 = abs(evalfr(S,100*pi*i));
S_100 = bode(S,100*pi);
G_100 = bode(G,100*pi);
K = 1/(S_100*G_100)                     % P-gain 

%% 4.2 Robustness
G0 = 1e4*(s+2)/((s+3)*(s+100)^2)*(s-1)/(s+2);
Gsim = G0;                              % Plant
Fsim = F;                               % Controller
macro;

%% model error
G_delta = -3/(s+2);
G_delta_100 = bode(G_delta,100*pi);
T_norm = 1/G_delta_100

%% Design Controller
Hinf(G);
% For WS
% s = -0.1 + sqrt((100*pi)^2-0.1^2), -0.1 - sqrt((100*pi)^2-0.1^2)
% Gain = 1
% For WT
% s = -2
% Gain = 0.001

%% Simulation
Gsim = G0;                              % Plant
Fsim = F;                               % Controller
macro;

%% small gain theorem
T = G*F/(1+G*F);
figure;
bode(T)
hold on
bode(1/G_delta)
legend('T','\DeltaG^{-1}')
set(findall(gcf,'type','line'),'linewidth',2);
grid on


%% 4.3 The use of control signal
%% Design Controller
Hinf(G);
% For WS
% s = -0.1 + sqrt((100*pi)^2-0.1^2), -0.1 - sqrt((100*pi)^2-0.1^2)
% Gain = 1
% For WT
% s = -2
% Gain = 0.0001
% For WU
% s = -2
% Gain = 0.001

%% Simulation
Gsim = G0;                              % Plant
Fsim = F;                               % Controller
macro;
















