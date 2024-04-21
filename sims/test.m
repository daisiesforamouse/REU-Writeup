function [est_H, est_rho, est_sigma] = test(num_obs, H, rho)
    num_obs = 2^ceil(log2(num_obs));
    fBm = fbm1d(H, num_obs, 1)';
    obs = fBm + normrnd(0, rho, [1,num_obs + 1]);
    [est_H, est_rho, est_sigma] = estimate(obs, @symmetric_power, ...
                                           @symmetric_power_deriv, 200, 0);
end

function ret = symmetric_power(x)
    ret = x .^ 2 .* (1 - x) .^ 2;
end

function ret = symmetric_power_deriv(x)
    ret = 2 .* x .* (x - 1) .* (2 .* x - 1);
end

function ret = symmetric_power_deriv2(x)
    ret = 12 .* x .^ 2 - 12 .* x + 2;
end

function ret = triangle(x)
    ret = 2 .* min(x, 1 - x);
end

function ret = triangle_deriv(x)
    ret = -4 * (heaviside(x - 0.5) - 0.5);
end

function ret = triangle_deriv2(x)
    ret = 0 .* x;
end
