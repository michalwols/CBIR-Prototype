classdef FeatureExtractor
    %FeatureExtractor Abstract class for feature extractors
    
    methods (Abstract)
        features = get_features(img);
    end
    
end

