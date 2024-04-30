% Hs = [0.1, 0.2, 0.3, 1/3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
Hs = [1/3];
rho = 0.1;
n = 1000;
% num_obs = 10^5;
num_obs = 86400;
output_file = num2str(now) + "_output.csv";

tic;
simulate(output_file, n, num_obs, Hs, rho, false);
end_time = toc;

fprintf('Total running time: %f | Average path run time: %f\n', end_time, end_time / (n * length(Hs)));
