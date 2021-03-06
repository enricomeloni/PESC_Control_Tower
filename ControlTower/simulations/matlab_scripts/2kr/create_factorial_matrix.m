% Creates the table for 2kr analysis starting from the columns of single factors
%                      A  B
% I.E. if combs =   [  1  1 ] 
%                   |  1 -1 | 
%                   | -1  1 | 
%                   [ -1 -1 ]
%
%                  I,  A,  B, AB
% coeff_matrix = [ 1,  1,  1,  1 ]
%                | 1,  1, -1, -1 |
%                | 1, -1,  1, -1 |
%                [ 1, -1, -1,  1 ] 
%
function [ coeff_matrix ] = create_factorial_matrix( combs )

    %k is number of factors
    k = size(combs,2);
    two_k = size(combs,1);
    
    
    %factors id
    factor_idx = 1:1:k;
    
    
    coeff_matrix = [];
    
    for i = 2:k
        %factors interaction
        factor_comb = nchoosek(factor_idx,i);
        n_comb = nchoosek(k,i);
        
        
        for j = 1:n_comb
            
            add_col = zeros(two_k,1);
            
            for z = 1:two_k
               add_col(z,1) = prod( combs(z, factor_comb(j,:) ) );  
            end
            
            coeff_matrix = [coeff_matrix,add_col];
        end
        
    end
    %matrix with factors and interactions
    
    one_column = ones(two_k,1);

    coeff_matrix = [one_column, combs, coeff_matrix];

end

