classdef WordHistogramEncoder < FeatureEncoder
    %WORDHISTOGRAMENCODER Maps features to the closest codebook word and
    %represents the descriptor as a histogram of the words

    properties
        codebook
        kd_forest %used for faster nearest neighbor search
    end
    
    methods
        function obj = WordHistogramEncoder(codebook)
            obj.codebook = codebook;
            obj.kd_forest = vl_kdtreebuild(obj.codebook, 'NumTrees', 7);
        end
        
        function descriptor = encode(obj, features)
            words = vl_kdtreequery(obj.kd_forest, obj.codebook, ...
                                   single(features));
            
            [~, num_buckets] = size(obj.codebook);
            
            descriptor = zeros(1,num_buckets);
            
            for i=1:numel(words)
                descriptor(words(i)) = descriptor(words(i)) + 1;
            end
            
        end
    end


end