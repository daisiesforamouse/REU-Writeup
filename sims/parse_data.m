function results = parse_data(data_file, filter, Hs, rho, sigma)
    data = table2array(readtable(data_file));
    dims = size(data);
    results = zeros(length(Hs), 2 * dims(2) - 1);
    for i = 1:length(Hs)
        for j = 2:dims(2)
            height = dims(1) / length(Hs);
            ests = data((i - 1) * height + 1 : i * height, j);
            if filter
                ests = ests(ests ~= 0);
            end
            results(i, 2 * j - 2) = Hs(i) - mean(ests);
            results(i, 2 * j - 1) = var(ests).^0.5;
        end
        results(i, 1) = Hs(i);
    end
end