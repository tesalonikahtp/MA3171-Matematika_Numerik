s = [5,10,20,100];
for i = 1: length(s)
    x = linspace(0,1,s(i) + 1);
    luas = 0;
    for j = 1: (length(x) - 1)
        %Pakai luas trapesium biasa luas = (jumlah sisi sejajar)/2  *
        %tinggi
        luas = luas + (((zeta_func(x(j),15) - 3) + (zeta_func(x(j+1), 15) - 3))/2) *(x(j+1) - x(j));
    end
    fprintf("Luas untuk banyak partisi = " + string(s(i)) + " adalah " + string(luas) + "\n")
end

% plot gamma dengan teknik trapezoid
z = linspace(0, 4, 100);

% Inisialisasi array untuk menyimpan hasil gamma(z)
gamma_values = (length(z));

% Hitung gamma(z) untuk setiap nilai z
for i = 1:length(z)
    gamma_values(i) = + gamma_trapezoid(z(i));
end

% Gambar plot
plot(z, gamma_values);
xlabel('z');
ylabel('gamma(z)');
title('Plot Fungsi Gamma menggunakan Trapezoid Rule');
grid on;






