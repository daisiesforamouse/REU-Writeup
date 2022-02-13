function preave = preaverage(obs, g, kappa)
     intervals = diff(obs);
     n = length(obs);
     kn = floor(n^kappa);
     preave = g(1 / kn) * intervals(1:(n - kn));
     for j = 2:kn
         preave = preave + g(j / kn) * intervals(j:(n - kn + j - 1));
     end
     clear intervals;
 end