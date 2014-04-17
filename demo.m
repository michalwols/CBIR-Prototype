data_path = '../Data/ukbenchsubset/';
image = 'ukbench00035.jpg';
k = 5;

img = vl_imreadgray([data_path image]);

encoding = bow_encoder.encode(img);

results = flat_index.top_k_matches(encoding, k);

for i=1:k
    figure(i)
    im = vl_imreadgray(strjoin([data_path results{i}], ''));
    imshow(im);
end
