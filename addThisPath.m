function addThisPath
%%  [] = addThisPath()
%  This is going to add the current path to the octave paths for unlimited power
%  or just happy functions that work whatever folder octave is in right now.
%
%  History
%  2014-06-07 mg  written
%  ----------------------------------------------------------------------------

  currentPath = pwd
  fprintf('Now adding the current folder to your octave');
  fprintf(['this will be ' currentPath]);
  addpath (currentPath);
  savepath;
  fprintf(' done :) enjoy');

end%function