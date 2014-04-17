classdef FlatIndex
    
    properties
        img_names
        weighted_hists
        num_imgs
        word_freq   
    end
    
    methods
        function obj = FlatIndex(img_names, word_histograms)
            
            obj.img_names = img_names;
            obj.num_imgs = numel(img_names);
            obj.word_freq = sum(word_histograms > 0);
            updated_hists = zeros(size(word_histograms));
            
            
            
            for i=1:obj.num_imgs
                updated_hists(i,:) = word_histograms(i,:)  ...
                                     .* tf_idf(word_histograms(i,:), ...
                                     obj.word_freq, obj.num_imgs);
            end
            
            obj.weighted_hists = updated_hists;
            
        end
        
        function names = top_k_matches(obj, word_hist, k)
            % return images which contain the following words
            
            weighted_hist = word_hist .* tf_idf(word_hist, ...
                                    obj.word_freq, obj.num_imgs);
            
                                
            diffs = bsxfun(@minus,obj.weighted_hists, weighted_hist);
            scores = abs(sum(diffs, 2));
            
            [~,idx] = sort(scores);
            
            names = obj.img_names(idx(1:k));
        end
        
    end
    
end

