%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Magic Formula Tire Model
% clear; clc;
%% Coefficients
%For Fx
ax1 = -21.3;    ax2 = 1144;  ax3 = 49.6;    ax4 = 226;      ax5 = 0.069;    ax6 = -0.006;   ax7 = 0.056;    ax8 = 0.486;
%For Fy
ay1 = -22.1;    ay2 = 1011;  ay3 = 1078;    ay4 = 1.82;     ay5 = 0.208;    ay6 = 0;        ay7 = -0.354;   ay8 = 0.707;

%% Tire Model Code
Cx = 1.65; %Shape factor for Fx
Cy = 1.3;  %Shape factor for Fy

j = 0;
for Fz = 2:2:8 % Force at z axis [kN]
    i = 0;
    k = 0;
    j = j+1;
    for alpha = -20:0.01:20 %Slip angle [deg]
        i = i+1;
        % Calculation of emprical coefficients
        Dy = ay1*Fz^2 + ay2*Fz;
        BCDy = ay3*sind(ay4*atand(ay5*Fz));
        Ey = ay6*Fz^2 + ay7*Fz + ay8;
        By = BCDy/(Cy*Dy);
        % Calculation of Fy
        Fy(i,j) = Dy*sind(Cy*atand(By*alpha-Ey*(By*alpha-atan(By*alpha))));
    end
    for ratio = -100:0.01:100 %Slip ratio
        k = k + 1;
        % Calculation of emprical coefficients
        Dx = (ax1*(Fz^2)) + (ax2*Fz);
        BCDx = ((ax3*(Fz^2)) + (ax4*Fz))/(exp(ax5*Fz));
        Ex = ax6*Fz^2 + ax7*Fz + ax8;
        Bx = BCDx/(Cx*Dx);
        % Calculation of Fx
        Fx(k,j) = Dx*sind(Cx*atand(Bx*ratio-Ex*(Bx*ratio-atan(Bx*ratio))));
    end
end

Fz = [2000,4000,6000,8000];
%% Plot Code
ratio_p = -100:0.01:100; %Range for plot

angle_p = -20:0.01:20; %Range for plot

MagicTire_alpha = angle_p;
MagicTire_slip_ratio = ratio_p;

MagicTire_Fx = Fx;
MagicTire_Fy = Fy;                     
MagicTire_Fz = 2000:2000:8000;         %[N]