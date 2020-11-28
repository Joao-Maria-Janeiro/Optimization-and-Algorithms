X = csvread('../data/data_opt.csv');

Z = pdist(X);
D = squareform(Z);

D(2,3)
D(4,5)


max_D = max(Z)

[max_index_x, max_index_y] = find(D == max_D)
