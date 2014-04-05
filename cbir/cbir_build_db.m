function db = cbir_build_db( image_encoder, ...
                                img_dir, img_extenstion)
    %CBIR_BUILD_DB builds a database as a hashmap from image name to image
    %descriptor
    %   image_encoder: instance of FeatureEncoder class (or subclass)
    %   img_dir: directory where the database images are stored
    %   img_extension: 'jpg' / 'png' / etc
    %
    %   db: hashmap from image names to their descriptors

    images = dir([img_dir '*.' img_extenstion]);
    
    % naive storage solution
    db = containers.Map;
    
    for i=1:numel(images)
        
        img = vl_imreadgray(images(i).name);
        db(images(i).name) = image_encoder.encode(img);
        
    end
end

