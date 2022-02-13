function obs = brnmotion(n)
    start = 0;
    obs = zeros(1, n);
    for i = 2:n
        obs(i) = obs(i - 1) + normrnd(0, 1 / sqrt(n));
    end
end