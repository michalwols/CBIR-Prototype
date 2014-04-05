function descr = rootsift(sift_descr)
    % ROOTSIFT Convert SIFT descriptors into rootSIFT descriptors

    root = sqrt(sift_descr);
    descr = bsxfun(@times, root, 1 ./ sqrt(sum(root.^2)));

end
