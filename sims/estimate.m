function [est_H, est_rho, est_sigma] = estimate(obs, g, g_prime, iterations)
    kappa = 0.67;
    est_H = estimate_H(obs, kappa, g);
    kappa = max(0, 2 * est_H / (2 * est_H + 1));
    est_H_new = estimate_H(obs, kappa, g);
    counter = 1;
    while abs(est_H_new - est_H) > 0.025 && counter < iterations
        est_H = est_H_new;
        kappa = max(0, 2 * est_H / (2 * est_H + 1));
        est_H_new = estimate_H(obs, kappa, g);
        counter = counter + 1;
    end
    est_H = est_H_new;
    kappa = max(0, 2 * est_H / (2 * est_H + 1));
    obs_preave = preaverage(obs, g, kappa);
    obs_mapped = obs_preave / ((length(obs_preave) .^ ((kappa - 1) * est_H)));
    var = sum(obs_mapped .^ 2) / length(obs_preave);
    est_rho = estimate_rho(obs);
    est_sigma = estimate_sigma(obs, g, g_prime, est_H, est_rho, var);
end

function est_H = estimate_H(obs, kappa, g)
    half_obs = obs(1:2:end);
    obs_preave = preaverage(obs, g, kappa);
    half_obs_preave = preaverage(half_obs, g, kappa);
    variation = sum(obs_preave .^ 2);
    half_variation = 2 * sum(half_obs_preave .^ 2);
    est_H = max(0, log2(half_variation / variation) / (2 * (1 - kappa)));
    clear half_obs, obs_preave;
end

function est_rho = estimate_rho(obs)
    qv = sum(diff(obs) .^ 2);
    est_rho = sqrt(qv / (2 * length(obs)));
end

function est_sigma = estimate_sigma(obs, g, g_prime, H, rho, var)
    int = integral(@(x) g_prime(x) .^ 2, 0, 1);
    est_sigma = (var - rho .^ 2 * int) / eta(g, g_prime, H);
    % est_sigma = (var) / eta(g, g_prime, H);
    % est_sigma = eta(g, g_prime, H);
end