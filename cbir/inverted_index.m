classdef inverted_index
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = inverted_index(imgs, words)
            % build an inverted index mapping from each word to the images
            % that it appears in
        end
        
        function get_matches(words)
            % return images which contain the following words
        end
        
        function add(img, words)
            % insert image into index for the following words
        end
        
        function term_freq = get_word_frequencies()
            % returns how often each word in the index occurs in the images
    end
    
end

