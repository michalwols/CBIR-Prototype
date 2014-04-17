classdef ImageDB
    
    methods (Abstract)
        results = query(img);
        add(img);
    end
    
end

