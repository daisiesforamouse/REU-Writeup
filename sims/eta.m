function ret = eta(g, g_prime, H)
    inner = dbl_int(g, g_prime, H);
    outer = g(1) * integral(@(x) (g(x) .* (1 - x) .^ (2 * H - 1)), 0, 1);
    ret = (-inner + outer) * 2 * H;
end

function ret = dbl_int(g, g_prime, H)
    integrand = @(x,y) (((y - x) .^ (2 * H - 1)) .* g_prime(y) .* g(x));
    ymin = @(x) x;
    ret = integral2(integrand, 0, 1, ymin, 1);
end