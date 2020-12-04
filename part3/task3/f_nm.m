function f = f_nm(ym, yn, D, n, m)
    f = norm(ym - yn) - D(m, n);
end