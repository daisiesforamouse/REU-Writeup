function est_H = estimate(obs, kappa, f, g)
    half_obs = obs(1:2:end);
    obs_preave = preaverage(obs, g, kappa);
    half_obs_preave = preaverage(half_obs, g, kappa);
    variation = sum(f(obs_preave));
    half_variation = 2 * sum(f(half_obs_preave));
    est_H = max(0, log2(half_variation / variation) / (2 * (1 - kappa)));
    clear half_obs, obs_preave;
end