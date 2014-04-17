
img_path = '../../Data/ukbenchsubset/';
codebook_path = 'precomputed/ukbench_dsift_wordhist/1024_SIFT_means';
feat_extractor_path = 0;
feat_encoder_path = 0;
db_path = 0;



%%% Build or load Codebook and DB


f = load(codebook_path);
codebook = f.means;

feat_extractor = DenseSIFTExtractor(10, 3);
feat_encoder = WordHistogramEncoder(codebook);

bow_encoder = BoWEncoder(feat_extractor, feat_encoder);     



%db = cbir_build_db(bow_encoder, img_path, 'jpg');


%%% Get query image (QUERY LOOP?)

%%% Extract features

%%% Encode the extracted features in terms of the codebook

%%% Apply TF-IDF weighting

%%% Use inverted file to get the top K mathes

%%% Rerank the results using spatial verification 

%%% Requery with the top matches

%%% Show results
