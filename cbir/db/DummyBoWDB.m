classdef DummyBoWDB < ImageDB

    
    properties
        img_encoder % used to get feature vector from img
        index       % indexes images in the db
        img_dir     % path to directory where images are stored
    end
    
    methods
        function obj = DummyDB(img_encoder, index, img_dir)
            obj.img_encoder = img_encoder;
            obj.index = index;
            obj.img_dir = img_dir;
        end
        
        function add(obj, img_name)
            
            %open img
            
            
            
            
            
        end
            
        function results = query(obj, img_name)
            
            
        end
    end
    
end

