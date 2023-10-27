function [h, b] = b_finder(x, y)
    n = length(x);
    h = zeros(1, n-1);
    b = zeros(1,n);

    % Perhitungan h(i) untuk i = 0,1,2,...,n-1
    for i = 1:n-1
        h(i) = x(i + 1) - x(i);
    end
    A = zeros(n-2,n-2);
    for i = 1:n-2
        A(i,i) = A(i,i) + (2*(h(i) + h(i+1)));
    end
    for i = 2:n-2
        A(i,i-1) = A(i,i-1) + h(i);
        A(i-1,i) = A(i-1,i) + h(i);
    end
    z = zeros(1,n-2);
    for i = 2:n-1
        z(i-1) = z(i-1) + (3*(y(i+1)-y(i))/h(i)) - (3*(y(i)-y(i-1))/h(i));
    end


    %Eliminasi Gauss
    for k = 1:n-3
        p = A(k+1,k)/A(k,k);
        A(k+1,k+1) = A(k+1,k+1) - p*A(k,k+1);
        z(k+1) = z(k+1) - p*z(k);
        A(k+1,k) = 0;
    end
    b(n-1) = z(n-2)/A(n-2,n-2);
    for k = n-2:-1:2
        b(k) = (z(k-1) - A(k-1,k)*b(k+1))/A(k-1,k-1);
    end
end
