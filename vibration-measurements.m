% found the frequency for each run
load('P1R1.mat');

freq1 =(S1(:,1));

freqPeak1 = max(S1(:,1));
acc1 =(X1(:,2));

accPeak1 = max(X1(:,2));


load('P1R2.mat');
acc2 =(X1(:,2));

accPeak2 = max(X1(:,2));

freq2 =(S1(:,1));

freqPeak2 = max(S1(:,1));

load('P1R3.mat');

acc3 =(X1(:,2));

accPeak3 = max(X1(:,2));
freq3 =(S1(:,1));

freqPeak3 = max(S1(:,1));

load('P1R4.mat');

acc4 =(X1(:,2));

accPeak4 = max(X1(:,2));
freq4 =(S1(:,1));

freqPeak4 = max(S1(:,1));

load('P1R5.mat');

acc5 =(X1(:,2));

accPeak5 = max(X1(:,2));
freq5 =(S1(:,1));

freqPeak5 = max(S1(:,1));

% made matrices for both frequency and calculated displacement
Peak = [freqPeak1, freqPeak2, freqPeak3, freqPeak4, freqPeak5];

Disp = [.002, .001, .001, .0007, .0006];

figure

plot(Peak,Disp,'bo','markersize',6) 

title('Frequency vs Displacement');
xlabel('Frequency (Hz)');
ylabel('Displacement (m)');

axis([0 40 0 0.003])
    
grid on
    
    
 %% end of part 1
    
%loaded in the data 
load('P2BNR1.mat')

% found force transducer in V

ForTran1 = max(X2(:,2));
%Found the Acceleration Peaks
P2acc1 = max(X1(:,2));

% converted the acceleration to force by multiplying by the mass
Force1 = P2acc1 .* .074;
load('P2BNR2.mat')

ForTran2 = max(X2(:,2));

P2acc2 = max(X1(:,2));

Force2 = P2acc2 .* .074;

load('P2BNR3.mat')

ForTran3 = max(X2(:,2));

P2acc3 = max(X1(:,2));

Force3 = P2acc3 .* .074;

load('P2BSR1.mat')

ForTran4 = max(X2(:,2));

P2acc4 = max(X1(:,2));

Force4 = P2acc4 .*.393;

load('P2BSR2.mat')

ForTran5 = max(X2(:,2));

P2acc5 = max(X1(:,2));

Force5 = P2acc5 .* .393;


load('P2BSR3.mat')

ForTran6 = max(X2(:,2));

P2acc6 = max(X1(:,2));

Force6 = P2acc6 .* .393;

% set the matrices for force and force transducer
y = [Force1; Force2; Force3; Force4; Force5; Force6];

x = [ForTran1; ForTran2; ForTran3; ForTran4; ForTran5; ForTran6];
% R^2 Calculation
b1 = x\y;
yCalc1 = b1*x;
scatter(x,y,'o','MarkerFaceColor',[0,1,0]);
hold on;
plot(x,yCalc1);
xlabel('Peak Force Transducer Signal (V)')
ylabel('Force (N)');
title('Force Transducer Calibration Constant. Force vs Peak Force Transducer Signal.');
grid on
X = [ones(length(x),1) x];
b = X\y;
yCalc2 = X*b;
plot(x,yCalc2,'b--')
legend('Data','Slope','Slope & Intercept','Location','southeast');
Rsq1 = 1 - sum((y - yCalc1).^2)/sum((y - mean(y)).^2);
Rsq2 = 1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2);

str1A = ['Slope Equation'];
str1B = ['y = ',num2str(b1,3),'x'];
str1C = ['R^{2}',' = ',num2str(Rsq1)];
str1 = {str1A,str1B,str1C};
text(600,3,str1,'Color','red','FontSize',12)

str2A = ['Slope Intercept Equation'];
str2B = ['y = ',num2str(b(2),3),'x - ',num2str(-b(1),3)];
str2C = ['R^{2}',' = ',num2str(Rsq2)];
str2 = {str2A,str2B,str2C};
text(600,12,str2,'Color','b','FontSize',12)

