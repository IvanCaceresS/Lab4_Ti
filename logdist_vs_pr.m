% Datos de la primera lista
distancia1 = [-1, -0.698970004, -0.522878745, -0.397940009, -0.301029996, ...
             -0.22184875, -0.15490196, -0.096910013, -0.045757491, 0, ...
             0.041392685, 0.079181246, 0.113943352, 0.146128036, ...
             0.176091259, 0.204119983, 0.230448921, 0.255272505, ...
             0.278753601, 0.301029996, 0.311753861, 0.322219295, ...
             0.342422681, 0.361727836, 0.380211242, 0.397940009, ...
             0.414973348, 0.431363764, 0.447158031, 0.462397998, ...
             0.477121255, 0.544068044, 0.602059991, 0.698970004, ...
             0.77815125, 0.84509804, 0.903089987, 0.929418926, ...
             0.954242509, 1, 1.041392685, 1.079181246, 1.113943352, ...
             1.146128036, 1.176091259, 1.204119983, 1.230448921, ...
             1.255272505, 1.278753601, 1.301029996];

potencia1 = [-42.2, -43.2, -43.5, -44.8, -48.1, -45.5, -48.8, -46.9, ...
            -50.4, -51.1, -49.2, -47.7, -51.7, -51, -51.3, -50.3, ...
            -49.3, -57.6, -56, -56, -50.6, -52.3, -52.7, -52.8, ...
            -57.3, -65.5, -51.4, -56.4, -53.1, -53.3, -56.8, -58.7, ...
            -59.3, -59.8, -64.4, -61.1, -62, -67.6, -64.6, -72.9, ...
            -68.2, -68.3, -67.5, -70, -63.9, -69.9, -69.5, -70.5, -73.5, ...
            -71.1];

% Datos de la segunda lista
distancia2 = [0, 0.041392685, 0.079181246, 0.113943352, 0.146128036, ...
             0.176091259, 0.204119983, 0.230448921, 0.255272505, ...
             0.278753601, 0.301029996, 0.322219295, 0.342422681, ...
             0.361727836, 0.380211242, 0.397940009, 0.414973348, ...
             0.431363764, 0.447158031, 0.462397998, 0.477121255, ...
             0.491361694, 0.505149978, 0.51851394, 0.531478917, ...
             0.544068044, 0.556302501, 0.568201724, 0.579783597, ...
             0.591064607, 0.602059991, 0.653212514, 0.698970004, ...
             0.77815125, 0.84509804, 0.903089987, 0.954242509, 1, ...
             1.021189299, 1.041392685, 1.079181246, 1.113943352, ...
             1.146128036, 1.176091259, 1.204119983, 1.230448921, ...
             1.255272505, 1.278753601, 1.290034611, 1.301029996];

potencia2 = [-31.6, -40.3, -53.4, -41.2, -41, -44.4, -46.2, -52.1, ...
            -55.9, -48, -52, -51.1, -49.4, -51, -56.5, -53.6, ...
            -50, -54.4, -56.8, -51.5, -51.9, -52.2, -56.6, -57.3, ...
            -54.6, -60.4, -62.3, -57.5, -57.8, -57.6, -67.1, -67.3, ...
            -68.9, -63.3, -73.7, -66.3, -64.7, -64.8, -64.9, -69.2, ...
            -70.3, -72.6, -76.9, -76.3, -78.5, -79.7, -76.8, -76.2, ...
            -75.7, -77.3];

% Ajuste lineal para la primera lista de datos
coeffs1 = polyfit(distancia1, potencia1, 1);
slope1 = coeffs1(1); % Pendiente
intercept1 = coeffs1(2); % Término independiente

% Ajuste lineal para la segunda lista de datos
coeffs2 = polyfit(distancia2, potencia2, 1);
slope2 = coeffs2(1); % Pendiente
intercept2 = coeffs2(2); % Término independiente

% Graficar los datos y las líneas de ajuste
figure;
scatter(distancia1, potencia1, 'r', 'filled'); % Datos en rojo
hold on;
scatter(distancia2, potencia2, 'b', 'filled'); % Datos en azul

% Líneas de ajuste
x1_fit = linspace(min(distancia1), max(distancia1), 100);
y1_fit = polyval(coeffs1, x1_fit);
plot(x1_fit, y1_fit, 'r', 'LineWidth', 2); % Línea en rojo

x2_fit = linspace(min(distancia2), max(distancia2), 100);
y2_fit = polyval(coeffs2, x2_fit);
plot(x2_fit, y2_fit, 'b', 'LineWidth', 2); % Línea en azul

% Configurar el gráfico
xlabel('Log Distancia');
ylabel('Potencia recibida (dBm)');
title('Gráfico de Distancia vs. Potencia recibida con Ajuste Lineal.');

% Crear etiquetas para la leyenda
leyenda1 = ['Lab3: y = ', num2str(slope1), 'x + ', num2str(intercept1)];
leyenda2 = ['Lab4: y = ', num2str(slope2), 'x + ', num2str(intercept2)];

% Añadir leyenda
legend('Lab3', 'Lab4', leyenda1, leyenda2);

% Más configuraciones del gráfico
grid on;
grid minor;
ylim([-80, -30]);

% Mostrar el gráfico
hold off;
