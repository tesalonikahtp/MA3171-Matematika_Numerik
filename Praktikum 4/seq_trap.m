function approx = seq_trap(N,delta)
% Ketik jawaban Anda di bawah baris ini
    h = delta ;
    approx = 0 ; %batas bawah
    for i = 1:N
        if or(i==1,i==N)
            %berarti fungsinya di sini sin(i)
            approx = approx + i*sin(i) ; %untuk f(o) dan f(n)
        else
            approx = approx + 2*i*sin(i) ; %untuk f(1) sampai f(n-1)
        end
    end
    approx = approx*h/2 ; %hampiran nilai fungsi dengan metode trapesium komposit
end