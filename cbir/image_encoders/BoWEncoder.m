classdef BoWEncoder < ImageEncoder
    %BOWENCODER 
    
    properties (SetAccess = immutable)
        feature_extractor
        feature_encoder
    end
    
    methods 
        function obj = BoWEncoder(feature_extractor, feature_encoder)
            obj.feature_extractor = feature_extractor;
            obj.feature_encoder = feature_encoder;
        end
            
        function descriptor = encode(obj, img)
            features = obj.feature_extractor.get_features(img);
            descriptor = obj.feature_encoder.encode(features);
        end
    end
    
end

