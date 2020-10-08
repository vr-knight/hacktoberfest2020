clf; close all; clear all;

% Total Length Of the Beam
X=[1];

% Point load
P=[0.2 10e3
   
   ];

% UDL
U=[0.2 0.8 100e3
    0.8 1 -25e3
   ];

%Supports
S=[0 0.5];

% Moment
T=[0.4 100e2
    1 -50e2
    ];
% Properties
E=200e9; b=0.01; h=0.02;
I=(b*(h^3))/12;

% Setup Data Cell
DataIn = cell(7,1);
DataIn{1}=P;
DataIn{2}=U;
DataIn{3}=T;
DataIn{5}=X;
DataIn{6}=S;
DataIn{4}=SFBM_rxn(DataIn);  % Evalutes the Reaction Forces
DataIn{7}=E*I;

% Calculate Results
DataOut=SFBM_eval(DataIn);


% Draw the Results
SFBM_draw(DataIn,DataOut);
