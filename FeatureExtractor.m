classdef FeatureExtractor
    %FeatureExtractor Abstract class for feature extractors
    
    properties
    end
    
    methods (Abstract, Static)
        features = get_features(img);
    end
    
end

