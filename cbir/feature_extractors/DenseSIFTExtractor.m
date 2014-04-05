classdef DenseSIFTExtractor < FeatureExtractor
    %SIFTExtractor Extract dense SIFT features 
    %   Wrapper on the VLFeat implementation
    
    properties
        step_size = 5;
        bin_size = 3;
    end
    
    methods
        
        function obj = DenseSIFTExtractor(step_size, bin_size)
            if step_size
                obj.step_size = step_size;
            end
            
            if bin_size
                obj.bin_size = bin_size;
            end
        end
    
        function features = get_features(obj, img)
            % takes in a grayscale image and outputs a matrix of column
            % vectors of extracted SIFT feautures
            if ~isa(img,'single')
                img = single(img);
            end
            
            [~,features] = vl_dsift(img, 'fast', 'step', obj.step_size, ...
                'size', obj.bin_size);
        end
    end
    
end

