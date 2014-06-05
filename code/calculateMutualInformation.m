function mi=calculateMutualInformation(s1,s2)
  if (numel(s1)~=numel(s2))
    error('Input vectors must be the same length!');
  else
    N=numel(s1);
  end
  
  nbins=max(sturges(s1),sturges(2));
  p1=hist(s1,nbins)/N;
  p2=hist(s2,nbins)/N;
  temp(:,1)=s1; 
  temp(:,2)=s2;
  p12=hist3(temp,[nbins nbins])/N;
  
  mi=0;
  for i=1:nbins
    for j=1:nbins
      if p12(i,j)~=0
        mi=mi+p12(i,j)*log(p12(i,j)/(p1(i)*p2(j)));
      end
    end
  end
end