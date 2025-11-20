% 金属材料杨氏模量——逐差法与线性拟合法计算与作图
% 数据来源：金属材料杨氏模量的测定3.tex 中“原始数据”两表
% 地区重力加速度（杭州）：
clear; clc;

g = 9.7936;              % m/s^2

% 装置几何参数（多次测量，单位：mm）
D_mm = [1568.0, 1567.0, 1567.1, 1568.0, 1567.5, 1567.7];
b_mm = [  73.50,   73.58,   74.48,   73.62,   74.20,   73.80];
L_mm = [1157.0, 1156.8, 1157.3, 1157.2, 1157.1, 1156.3];
d_mm = [  0.588,   0.587,   0.590,   0.587,   0.595,   0.600];

D = mean(D_mm)/1000;     % m
b = mean(b_mm)/1000;     % m
L = mean(L_mm)/1000;     % m
d = mean(d_mm)/1000;     % m
S = pi*d.^2/4;           % m^2

% 砝码与读数（两次读数，单位：mm）
m = (1:8)';
s1 = [-10.0; -2.0; 2.5; 10.0; 17.1; 22.8; 30.2; 38.0];
s2 = [-10.0; -4.0; 2.7; 10.0; 17.1; 25.1; 31.4; 38.9];
s  = (s1 + s2)/2;        % 平均读数（mm）

%% 逐差法（每 1 kg 的平均读数增量）
% Δs_i = (s_{i+4} - s_i)/4,  i = 1..4
Delta_s = (s(1+4:end) - s(1:end-4))/4;           % mm/kg
Delta_s_bar = mean(Delta_s);                     % mm/kg
k_ds = Delta_s_bar / 1000;                       % m/kg
E_ds = (2*D*g*L) / (b*S*k_ds);                   % Pa

%% 线性拟合法 s = k*m + c
p = polyfit(m, s, 1);              % 单位：mm/kg, mm
k_fit_mm = p(1); c_fit = p(2);
k_fit = k_fit_mm / 1000;           % m/kg

s_pred = polyval(p, m);
SS_res = sum((s - s_pred).^2);
SS_tot = sum((s - mean(s)).^2);
R2 = 1 - SS_res/SS_tot;

E_fit = (2*D*g*L) / (b*S*k_fit);    % Pa

%% 输出结果
fprintf('几何量平均: D=%.2f mm, b=%.2f mm, L=%.2f mm, d=%.3f mm\n', mean(D_mm), mean(b_mm), mean(L_mm), mean(d_mm));
fprintf('S=%.3e m^2, g=%.4f m/s^2\n', S, g);
fprintf('逐差法:  \tΔs_bar = %.5f mm/kg,  E = %.3e Pa (%.1f GPa)\n', Delta_s_bar, E_ds, E_ds/1e9);
fprintf('线性拟合: k = %.5f mm/kg, R^2 = %.5f, E = %.3e Pa (%.1f GPa)\n', k_fit_mm, R2, E_fit, E_fit/1e9);

%% 作图
f = figure('Color','w'); hold on; grid on; box on;
scatter(m, s, 60, 'b', 'filled', 'DisplayName','测量平均值');
plot(m, s_pred, 'r-', 'LineWidth', 1.8, 'DisplayName', '线性拟合');
xlabel('砝码质量 m / kg');
ylabel('标尺读数 s / mm');
legend('Location','northwest');

% 注记拟合式与R^2
text(0.6, min(s)+5, sprintf('k = %.4f mm/kg\nR^2 = %.4f', k_fit_mm, R2), 'FontSize', 10, 'BackgroundColor', 'w');

% 保存到 figures
outdir = fullfile(fileparts(mfilename('fullpath')), 'figures');
if ~exist(outdir, 'dir'), mkdir(outdir); end
saveas(f, fullfile(outdir, 'Y_fit.png'));
saveas(f, fullfile(outdir, 'Y_fit.pdf'));

close(f);
