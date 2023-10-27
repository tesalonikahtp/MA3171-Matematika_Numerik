function result = zeta_func(s, n)
    result = 1;
    for i = 2:n
        result = result + 1/(i.^s);
    end
end