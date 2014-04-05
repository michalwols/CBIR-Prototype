classdef FeatureEncoder
    %WORDENCODER Base class for feature encoders which turn

    methods (Abstract)
        descriptor = encode(obj, features);
    end
end
