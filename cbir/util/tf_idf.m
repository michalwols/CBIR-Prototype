function [ weights ] = tf_idf( word_freq, doc_freq, num_docs )
%TF_IDF Computes tf-idf weights

    tf = word_freq ./ sum(word_freq);
    idf = log( num_docs ./ doc_freq);
    
    weights = tf .* idf;

end

