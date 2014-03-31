
data_path = '../Data/ukbenchsubset/';
files = dir([data_path '*.jpg']);


max_imgs = 100;
bound = min(max_imgs, numel(files));

features = [];
dSIFT = DenseSIFTExtractor(10, 3);


for i=1:bound
    
    img = vl_imreadgray(files(i).name);
    features = [features, dSIFT.get_features(img)];
    
    fprintf('%d/%d \n', i, bound);
    
end

features = single(features);
means = vl_kmeans(features, 300, 'Algorithm', 'ANN', 'Verbose', ...
                                 'MaxNumIterations', 20);

                             %% 
forest = vl_kdtreebuild(means, 'NumTrees', 5);

words = vl_kdtreequery(forest, means, single(dSIFT.get_features(img)));
                             