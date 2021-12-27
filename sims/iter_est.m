function final_est = iter_est(obs, f, g)
    est_H = estimate(obs, 0.67, f, g);
    est_H_new = estimate(obs, 2 * est_H / (2 * est_H + 1), f, g);
    counter = 0;
    while abs(est_H_new - est_H) > 0.025 && counter < 1000
        est_H = est_H_new;
        est_H_new = estimate(obs, max(0, 2 * est_H / (2 * est_H + 1)), f, g);
        counter = counter + 1;
    end
    final_est = est_H_new;
end