% Datos
datos1 = [-1, 51.2;
         -0.698970004, 52.2;
         -0.522878745, 52.5;
         -0.397940009, 53.8;
         -0.301029996, 57.1;
         -0.22184875, 54.5;
         -0.15490196, 57.8;
         -0.096910013, 55.9;
         -0.045757491, 59.4;
         0, 60.1;
         0.041392685, 58.2;
         0.079181246, 56.7;
         0.113943352, 60.7;
         0.146128036, 60.0;
         0.176091259, 60.3;
         0.204119983, 59.3;
         0.230448921, 58.3;
         0.255272505, 66.6;
         0.278753601, 65.0;
         0.301029996, 65.0;
         0.311753861, 59.6;
         0.322219295, 61.3;
         0.342422681, 61.7;
         0.361727836, 61.8;
         0.380211242, 66.3;
         0.397940009, 74.5;
         0.414973348, 60.4;
         0.431363764, 65.4;
         0.447158031, 62.1;
         0.462397998, 62.3;
         0.477121255, 65.8;
         0.544068044, 67.7;
         0.602059991, 68.3;
         0.698970004, 68.8;
         0.77815125, 73.4;
         0.84509804, 70.1;
         0.903089987, 71.0;
         0.929418926, 76.6;
         0.954242509, 73.6;
         1, 81.9;
         1.041392685, 77.2;
         1.079181246, 77.3;
         1.113943352, 76.5;
         1.146128036, 79.0;
         1.176091259, 72.9;
         1.204119983, 78.9;
         1.230448921, 78.5;
         1.255272505, 79.5;
         1.278753601, 82.5;
         1.301029996, 80.1];


datos2 = [0, 40.6;
          0.041392685, 49.3;
          0.079181246, 62.4;
          0.113943352, 50.2;
          0.146128036, 50.0;
          0.176091259, 53.4;
          0.204119983, 55.2;
          0.230448921, 61.1;
          0.255272505, 64.9;
          0.278753601, 57.0;
          0.301029996, 61.0;
          0.322219295, 60.1;
          0.342422681, 58.4;
          0.361727836, 60.0;
          0.380211242, 65.5;
          0.397940009, 62.6;
          0.414973348, 59.0;
          0.431363764, 63.4;
          0.447158031, 65.8;
          0.462397998, 60.5;
          0.477121255, 60.9;
          0.491361694, 61.2;
          0.505149978, 65.6;
          0.51851394, 66.3;
          0.531478917, 63.6;
          0.544068044, 69.4;
          0.556302501, 71.3;
          0.568201724, 66.5;
          0.579783597, 66.8;
          0.591064607, 66.6;
          0.602059991, 76.1;
          0.653212514, 76.3;
          0.698970004, 77.9;
          0.77815125, 72.3;
          0.84509804, 82.7;
          0.903089987, 75.3;
          0.954242509, 73.7;
          1, 73.8;
          1.021189299, 73.9;
          1.041392685, 78.2;
          1.079181246, 79.3;
          1.113943352, 81.6;
          1.146128036, 85.9;
          1.176091259, 85.3;
          1.204119983, 87.5;
          1.230448921, 88.7;
          1.255272505, 85.8;
          1.278753601, 85.2;
          1.290034611, 84.7;
          1.301029996, 86.3];


% Separar los datos en x y y para cada conjunto
x1 = datos1(:, 1);
y1 = datos1(:, 2);
x2 = datos2(:, 1);
y2 = datos2(:, 2);

% Realizar ajuste lineal
p1 = polyfit(x1, y1, 1);
p2 = polyfit(x2, y2, 1);

% Calcula la pendiente (coeficiente lineal) de cada ajuste
pendiente1 = p1(1);
pendiente2 = p2(1);

% Crear línea de ajuste
x1_fit = linspace(min(x1), max(x1), 100);
y1_fit = polyval(p1, x1_fit);
x2_fit = linspace(min(x2), max(x2), 100);
y2_fit = polyval(p2, x2_fit);

% Cálculo del shadowing
shadowing1 = y1 - polyval(p1, x1);
shadowing2 = y2 - polyval(p2, x2);
shadowing_combined = [shadowing1; shadowing2];

% Calcular media y desviación estándar del shadowing
media_shadowing1 = mean(shadowing1);
desviacion_shadowing1 = std(shadowing1);
media_shadowing2 = mean(shadowing2);
desviacion_shadowing2 = std(shadowing2);

% Calcular media y desviación estándar del shadowing combinado
media_shadowing_combinado = mean(shadowing_combined);
desviacion_shadowing_combinado = std(shadowing_combined);

% Cálculo de CDF para shadowing
[f1, x1_cdf] = ecdf(shadowing1);
[f2, x2_cdf] = ecdf(shadowing2);
[f_combined, x_combined_cdf] = ecdf(shadowing_combined);

% Graficar datos, ajustes y CDFs de shadowing
figure;

% Gráficos de los datos y ajustes
%subplot(2,1,1);
hold on;
plot(x1, y1, 'ro', 'DisplayName', 'Lab 3');
plot(x2, y2, 'bo', 'DisplayName', 'Lab 4');
plot(x1_fit, y1_fit, 'r-', 'DisplayName', sprintf('Ajuste Lab 3: y = %.2fx + %.2f', p1));
plot(x2_fit, y2_fit, 'b-', 'DisplayName', sprintf('Ajuste Lab 4: y = %.2fx + %.2f', p2));
hold off;
xlabel('Distancia (logarítmica)');
ylabel('Pathloss (dB)');
title('Comparación de Pathloss en Laboratorios 3 y 4');
legend('show');
grid on;

% Gráfico de CDFs de shadowing
%subplot(2,1,2);
plot(x1_cdf, f1, 'r-', 'DisplayName', 'CDF Shadowing Lab 3');
hold on;
plot(x2_cdf, f2, 'b-', 'DisplayName', 'CDF Shadowing Lab 4');
plot(x_combined_cdf, f_combined, 'k-', 'DisplayName', 'CDF Shadowing Combinado');
hold off;
xlabel('Shadowing (dB)');
ylabel('CDF');
title('Distribución acumulativa del Shadowing');
legend('show');
grid on;

% Mostrar ecuaciones de ajuste en consola
fprintf('Ecuación de ajuste Lab 3: y = %.2fx + %.2f\n', p1);
fprintf('Ecuación de ajuste Lab 4: y = %.2fx + %.2f\n', p2);
% Mostrar path loss y shadowing correspondiente en consola para datos1
fprintf('Path Loss y Shadowing para datos1:\n');
for i = 1:length(shadowing1)
    fprintf('Path Loss: %.2f dB, Shadowing: %.4f dB\n', y1(i), shadowing1(i));
end

% Mostrar path loss y shadowing correspondiente en consola para datos2
fprintf('\nPath Loss y Shadowing para datos2:\n');
for i = 1:length(shadowing2)
    fprintf('Path Loss: %.2f dB, Shadowing: %.4f dB\n', y2(i), shadowing2(i));
end

% Mostrar en consola los resultados
fprintf('Resultados para Lab 3:\n');
fprintf('Pendiente de la curva de mejor ajuste: %.2f\n', pendiente1);
fprintf('Media del Shadowing: %.2f dB\n', media_shadowing1);
fprintf('Desviación estándar del Shadowing: %.2f dB\n', desviacion_shadowing1);

fprintf('\nResultados para Lab 4:\n');
fprintf('Pendiente de la curva de mejor ajuste: %.2f\n', pendiente2);
fprintf('Media del Shadowing: %.2f dB\n', media_shadowing2);
fprintf('Desviación estándar del Shadowing: %.2f dB\n', desviacion_shadowing2);
% Mostrar en consola los resultados combinados
fprintf('\nResultados Combinados (Lab 3 + Lab 4):\n');
fprintf('Media del Shadowing: %.2f dB\n', media_shadowing_combinado);
fprintf('Desviación estándar del Shadowing: %.2f dB\n', desviacion_shadowing_combinado);
