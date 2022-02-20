function simulate(filename, n, num_obs, Hs, rho, silent)
    if ~silent
        fprintf('Running %d paths for each H.\n', n);
    end

    ests = zeros(1, 27);
    file = fopen(filename, 'w');
    fprintf(file, '"H","rho","sigma","est_H_adapted_power","est_rho_adapted_power","est_sigma_adapted_power","est_H_single_power","est_rho_single_power","est_sigma_single_power","est_H_adapted_triangle","est_rho_adapted_triangle","est_sigma_adapted_triangle","est_H_single_triangle","est_rho_single_triangle","est_sigma_single_triangle","est_H_adapted_power_optimal_k","est_rho_adapted_power_optimal_k","est_sigma_adapted_power_optimal_k","est_H_single_power_optimal_k","est_rho_single_power_optimal_k","est_sigma_single_power_optimal_k","est_H_adapted_triangle_optimal_k","est_rho_adapted_triangle_optimal_k","est_sigma_adapted_triangle_optimal_k","est_H_single_triangle_optimal_k","est_rho_single_triangle_optimal_k","est_sigma_single_triangle_optimal_k"');

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
            ests(1, 2) = rho;
            ests(1, 3) = 1;
            [ests(1, 4), ests(1, 5), ests(1, 6)] = estimate(obs, @symmetric_power, ...
                                                            @symmetric_power_deriv, 100, 0);
            [ests(1, 7), ests(1, 8), ests(1, 9)] = estimate(obs, @symmetric_power, ...
                                                            @symmetric_power_deriv, 1, 0);
            [ests(1, 10), ests(1, 11), ests(1, 12)] = estimate(obs, @triangle, ...
                                                             @triangle_deriv, 100, 0);
            [ests(1, 13), ests(1, 14), ests(1, 15)] = estimate(obs, @triangle, ...
                                                               @triangle_deriv, 1, 0);
            [ests(1, 16), ests(1, 17), ests(1, 18)] = estimate(obs, @symmetric_power, ...
                                                            @symmetric_power_deriv, 100, H);
            [ests(1, 19), ests(1, 20), ests(1, 21)] = estimate(obs, @symmetric_power, ...
                                                            @symmetric_power_deriv, 1, H);
            [ests(1, 22), ests(1, 23), ests(1, 24)] = estimate(obs, @triangle, ...
                                                             @triangle_deriv, 100, H);
            [ests(1, 25), ests(1, 26), ests(1, 27)] = estimate(obs, @triangle, ...
                                                               @triangle_deriv, 1, H);
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