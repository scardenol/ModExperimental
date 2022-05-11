% (A_max - A_min)*prbs(order, n) + A_min.
function S = params_prbs(u)
S = struct();
S.n = length(u);
S.A_max = max(u); 
S.A_min = min(u);
[S.order, S.freq] = consecutive_k(u, [S.A_max, S.A_min]);

    function [order, freq] = consecutive_k(x, k)
    freq = [];
    
    for i = k
        f = find(diff([0, x, 0] == i));
        p = f(1:2:end-1); % Start indices
        y = unique(f(2:2:end)-p); % Consecutive onesu counts
        freq = unique([freq, y]);
    end
    order = length(freq);
    end
end
