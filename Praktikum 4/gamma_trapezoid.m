function result = gamma_trapezoid(z)
    % Batas atas
    b = 100; % Batas atas diubah menjadi 1
    
    % Jumlah partisi
    n = 100; % Anda bisa menyesuaikan n sesuai kebutuhan
    
    h = b/n;
    
    result = 0;
    
    % Hitung gamma(z) dengan trapezoid rule
    for k = 1:n
        x_0 = (k-1) * h;
        x_1 = (k) * h;
        
        % Kak maaf banget ini punten aku dapet konstanta euler dari google soalnya di x = 0 fungsi gamma tuh tidak terdefinisi.
        if x_0 == 0
            gamma = 0.57721;
            result = result + 1/z - gamma;
        else
            result = result + ((x_0^(z-1) * exp(-x_0) + x_1^(z-1) * exp(-x_1)) * h)./2;
    end
end


