% decode responses to 2800 natural images from one repeat
% decoder correlates responses on first half to second half
% stimulus that is most correlated is the decoded stimulus "imax"
% decoding accuracy is probability that "imax" is true stimulus
function decode2800(matroot)

load(fullfile(matroot,'natimg2800_proc.mat'));

%%

clear pCorrect nStims nNeu;

nn = 2.^[12:-1:0];

nNeu = NaN*size(length(nn)+1,length(respAll));
for ip = 1:length(respAll) 
    
    r1 = respAll{ip}(:, :, 1);
    r2 = respAll{ip}(:, :, 2);
        
    r1 = zscore(r1, 1,1);
    r2 = zscore(r2, 1,1);
        
    NN = size(r1,2);
    
    nStims(ip) = size(r1,1);
    nNeu(2:length(nn)+1,ip) = nn;
    nNeu(1,ip)          = NN;
        
    rng(1);
    rperm = randperm(NN);

    for k = 1:size(nNeu,1)
        r10 = r1(:, rperm(1:nNeu(k,ip)));
        r20 = r2(:, rperm(1:nNeu(k,ip)));
        CC = corr(r10', r20');
        [~, imax] = max(CC, [], 1);
        pCorrect(k,ip) = nanmean(imax == [1:numel(imax)]);
		if k == 1
			fprintf('natimg2800 decoding accuracy: %0.3f\n',pCorrect(k,ip));
		end
    end
    
end

save(fullfile(matroot, 'decoder2800.mat'),'pCorrect','nNeu');