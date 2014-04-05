
data_path = '../Data/ukbenchsubset/';
files = dir([data_path '*.jpg']);


max_imgs = 1;
bound = min(max_imgs, numel(files));



features = cell(bound);
dSIFT = DenseSIFTExtractor(10, 3);


for i=1:bound
    
    img = vl_imreadgray(files(i).name);
    features{i} = dSIFT.get_features(img);
    
    fprintf('%d/%d \n', i, bound);
    
end


% Should use > 25,000 means 
% codebook should probably be a singleton
% codebook = vl_kmeans(features, 1024, 'Algorithm', 'ANN', 'Verbose', ...
%                                  'MaxNumIterations', 50);
                             
codebook = load('cbir/codebooks/1024_SIFT_means');

hist_encoder = WordHistogramEncoder(codebook.means);

save('histogram_encoder.mat', 'hist_encoder');

descriptor = hist_encoder.encode(features{1});

% % Build random forrest for faster nearest neighbor search                     
% forest = vl_kdtreebuild(codebook, 'NumTrees', 5);
% 
% 
% % Map features to words
% words = vl_kdtreequery(forest, codebook, single(dSIFT.get_features(img)));
                             