function U = Heat_Eqs2D(k, f, x1, x2, y1, y2, L, W, T, Nx, Ny)
    % Inisialisasi parameter
    delta_x = L / (Nx - 1);
    delta_y = W / (Ny - 1);
    delta_t = T / (Nx * Ny - 1);  % Adjusted to ensure stability


    % Grid
    x_values = linspace(0, L, Nx); 
    y_values = linspace(0, W, Ny);  
    x1_values = x1(0, x_values);
    x2_values = x2(0, x_values);
    y1_values = y1(0, y_values); 
    y2_values = y2(0, y_values);

    % Initial condition
    [X, Y] = meshgrid(x_values, y_values);
    u = f(X, Y);

    % BTCS method
    r1 = k * delta_t/delta_x^2;
    r2 = k * delta_t/delta_y^2;

    % Number of time steps
    Nt = round(T / delta_t);

    % Time-stepping loop
    for t = Nt:-1:1
        % Apply boundary conditions
        u(1, :) = x1_values;
        u(end, :) = x2_values;
        u(:, 1) = y1_values;
        u(:, end) = y2_values;

        % Update the interior points using BTCS
        for i = 2:Nx-1
            for j = 2:Ny-1
                u(i, j) = u(i, j) - r1 * (u(i+1, j) - 2*u(i, j) + u(i-1, j)) - r2 * (u(i, j+1) - 2*u(i, j) + u(i, j-1));
            end
        end
    end
end
