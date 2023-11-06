function [t,x,y] = runge_kutta_2(t0,tN,Nt,x0,y0,f,g)
% Ketik jawaban Anda di bawah baris ini
   h = (tN - t0) / Nt;
   x(1) = x0;
   y(1) = y0;
   t(1) = t0;

    for i = 1 : Nt
        
        k11 = h * f(t(i),x(i),y(i));
        k12 = h * g(t(i),x(i),y(i));
        k21 = h * f(t(i)+(h/2),x(i)+(k11/2),y(i)+(k12/2));
        k22 = h * g(t(i)+(h/2),x(i)+(k11/2),y(i)+(k12/2));
        k31 = h * f(t(i)+(h/2),x(i)+(k21/2),y(i)+(k22/2));
        k32 = h * g(t(i)+(h/2),x(i)+(k21/2),y(i)+(k22/2));
        k41 = h * f(t(i)+(h),x(i)+(k31),y(i)+(k32));
        k42 = h * g(t(i)+(h),x(i)+(k31),y(i)+(k32));
        x(i+1) = x(i) + (k11 + 2*k21 + 2*k31 + k41)/6;
        y(i+1) = y(i) + (k12 + 2*k22 + 2*k32 + k42)/6;
        t (i+1) = t0 + i * h;
    end

end