function [Selection]=Boltzmann(prob)
   rullet=sum(prob)*rand(1);
   slice=0;i=0;
   while slice<rullet
       i=i+1;
       slice=slice+prob(i);
   end
   Selection=i;
