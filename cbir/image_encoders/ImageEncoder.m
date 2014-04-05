classdef ImageEncoder
    %IMAGEENCODER Abstract base class for global image descriptor encoders
    
    methods (Abstract)
        descriptor = encode(obj, img);
    end
    
end

