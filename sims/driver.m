Hs = [0.1, 0.2, 0.3, 1/3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
rho = 0.1;
n = 50;
num_obs = 10^5;

tic;
simulate('testing.csv', n, num_obs, Hs, rho, false);
end_time = toc;

fprintf('Total running time: %f | Average path run time: %f\n', end_time, end_time / (n * length(Hs)));
