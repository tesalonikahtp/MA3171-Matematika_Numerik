function [a,c,d] = ncspline(h,b,y)
% Ketik jawaban Anda di bawah
    n = length(h);
    a = zeros(1,n);
    c = zeros(1,n);
    d = zeros(1,n); 
    for i = 1:n
        a(i) = a(i) + (b(i+1) - b(i))./(3.*h(i));
        c(i) = c(i) + ((y(i+1)-y(i))./h(i)) - (a(i).*h(i).^2) - (b(i).*h(i));
        d(i) = d(i) + y(i);
    end

end