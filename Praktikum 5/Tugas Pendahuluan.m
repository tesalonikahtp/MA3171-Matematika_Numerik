% Define anonymous function
f = @(mu, t, x1, x2) (-mu * sin(x2) - x1);

miu = 0:0.1:1;
a = 0;
max_iter = 100; 

x1 = zeros(1, max_iter + 1);
x2 = zeros(1, max_iter + 1);
h = 0.1; % Misalkan pada kasus ini kita gunakan nilai h segini

figure;
xlabel("x");
ylabel("x'");

% Loop untuk miu
for i = 1 : length(miu)
    x1(1) = 1; % Asumsi nilai awal
    x2(1) = 0; % Asumsi nilai awal
    for j = 1 : max_iter
        t = a + (j - 1) * h;
        t2 = a + j * h;

        p1 = x1(j) + h * x2(j);
        p2 = x2(j) + h * f(miu(i), t, x1(j), x2(j));

        x1(j + 1) = x1(j) + (h / 2) * (x2(j) + p2);
        x2(j + 1) = x2(j) + (h / 2) * (f(miu(i), t, x1(j), x2(j)) + f(miu(i), t2, p1, p2));
    end

    plot(x1, x2,'-o', Color = "r");
    drawnow;
    title (['Plot untuk \mu = ', num2str(miu(i))]);
    pause(0.5);
    if i < length(miu)
        clf;
    end
end