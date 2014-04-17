classdef RootSIFTExtractor < FeatureExtractor

    methods
        function features = get_features(obj, img)
             if ~isa(img,'single')
                img = single(img);
            end
            [~,features] = vl_covdet(img, 'descriptor', 'SIFT');
            features = max(eps, rootsift(features));
        end
    end
end

