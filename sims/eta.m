function ret = eta(g, g_prime, g_dbl_prime, H)
    inner = dbl_int(g, g_prime, g_dbl_prime, H);
    middle = g_prime(1) * integral(@(x) (g(x) .* (1 - x) .^ (2 .* H)), 0, 1);
    outer = g(1) * integral(@(x) (g(x) .* (1 - x) .^ (2 * H - 1)), 0, 1);
    ret = 2 * H * (inner + middle + outer);
end

function ret = dbl_int(g, g_prime, g_dbl_prime, H)
    integrand = @(x,y) (y - x) .^ (2 * H) .* g_dbl_prime(y) .^ 2 .* g(x);
    ret = integral2(integrand, 0, 1, @(x) x, 1);
end