num_obs = 10^5;

Hs = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
rho = 0.1;
n = 500;

ests = zeros(1, 5);
tic
for H = Hs
    disp(H)
    for i = 1:n
        fprintf("H = %f, run %d\n", H, i);
        fBm = wfbm(H, num_obs);
        obs = fBm + normrnd(0, rho, [1,num_obs]);
        est_H_iter_power = iter_est(obs, @square, @symmetric_power);
        est_H_power = estimate(obs, 0.67, @square, @symmetric_power);
        est_H_iter_triangle = iter_est(obs, @square, @triangle);
        est_H_triangle = estimate(obs, 0.67, @square, @triangle);
        ests(1, 1) = H;
        ests(1, 2) = est_H_iter_power;
        ests(1, 3) = est_H_power;
        ests(1, 4) = est_H_iter_triangle;
        ests(1, 5) = est_H_triangle;
        writematrix(ests, "ests.csv", "WriteMode", "append");
    end
end
toc

function [f_we, Eu_we, Cor_u] = power_spectrum(u, fs)
    up = u - mean(u);
    wid = 1;
    n1 = floor(length(up)/wid);
    n2 = floor(log2(n1));
    wind_we = 2^n2;
    [Eu_we,f_we] = pwelch(up, wind_we, [], [], fs, 'onesided');
    df = f_we(2) - f_we(1);
    Cor_u = mean(up.^2) / (sum(Eu_we.*df));
end