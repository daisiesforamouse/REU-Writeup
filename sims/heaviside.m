function ret = heaviside(x)
    ret = 0 .* (x < 0) + 0.5 .* (x == 0) + 1 .* (x > 0);
end
