function a = koordinat_solver(L,U,y)
% Ketik jawaban Anda di bawah
    n = length(y);
    x = zeros(n, 1);

    for i = 1:n
        x(i) = y(i);
        for j = 1:i-1
            x(i) = x(i) - L(i,j) * x(j);
        end
        x(i) = x(i) / L(i,i);
    end
    
    n = length(x);
    a = zeros(n, 1);

    for i = n:-1:1
        a(i) = x(i);
        for j = i+1:n
            a(i) = a(i) - U(i,j) * a(j);
        end
        a(i) = a(i) / U(i,i);
    end
end