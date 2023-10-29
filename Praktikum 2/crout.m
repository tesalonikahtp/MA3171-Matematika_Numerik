function [A,L,U,y] = crout(koordinat)
% Ketik jawaban Anda di bawah
    X = zeros(length(koordinat));
    for i = 1 : length(koordinat)
        for j = 1: length(koordinat)
            X(i,j) = koordinat(i,1).^(j-1);
        end
    end
    [m, n] = size(X);
    if m ~= n
        error('Matriks bukan matriks persegi');
    end

    L = zeros(m, n);
    U = zeros(m, n);

    for k = 1:n
        L(k, k) = 1;
        U(k, k) = X(k, k) - L(k, 1:k-1) * U(1:k-1, k);
        if abs(U(k, k)) < 1e-12
            error('Proses Gagal: Matriks Singular');
        end

        for i = k+1:n
            L(i, k) = (X(i, k) - L(i, 1:k-1) * U(1:k-1, k)) / U(k, k);
            U(k, i) = (X(k, i) - L(k, 1:k-1) * U(1:k-1, i)) / L(k, k);
        end
    end
    A = X;
    y = koordinat(:,2);
    
end