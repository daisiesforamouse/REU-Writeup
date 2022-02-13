function simulate(filename, n, num_obs, Hs, rho, silent)
    if ~silent
        fprintf('Running %d paths for each H.\n', n);
    end

    ests = zeros(1, 5);
    file = fopen(filename, 'w');
    fprintf(file, '"H","est H (adapted power)","est rho (adapted power)","est_sigma (adapted power)","est H (single power)","est rho (single power)","est_sigma (single power)","est H (adapted triangle)","est rho (adapted triangle)","est_sigma (adapted triangle)","est H (single triangle)","est rho (single triangle)","est_sigma (single triangle)""');
    fclose(file);
    for H = Hs
        for i = 1:n
            if ~silent
                fprintf('H = %f, run %d\n', H, i);
            end
            num_obs = 2^ceil(log2(num_obs));
            fBm = fbm1d(H, num_obs, 1)';
            obs = fBm + normrnd(0, rho, [1,num_obs + 1]);
            ests(1, 1) = H;
            [ests(1, 2), ests(1, 3), ests(1, 4)] = estimate(obs, @symmetric_power, ...
                                                            @symmetric_power_deriv, 100);
            [ests(1, 5), ests(1, 6), ests(1, 7)] = estimate(obs, @symmetric_power, ...
                                                            @symmetric_power_deriv, 1);
            [ests(1, 8), ests(1, 9), ests(1, 10)] = estimate(obs, @triangle, ...
                                                             @triangle_deriv, 100);
            [ests(1, 11), ests(1, 12), ests(1, 13)] = estimate(obs, @triangle, ...
                                                               @triangle_deriv, 1);
            writematrix(ests, filename, 'WriteMode', 'append');
        end
    end
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