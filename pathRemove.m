function pathRemove


%%  [] = rmThisPath()
%  This is going to remove the current path from the octave paths list
%
%  History
%  2014-11-23 mg  rename
%  2014-06-07 mg  written
%  ----------------------------------------------------------------------------

  currentPath = pwd
  fprintf('Now removing the current folder to your octave');
  fprintf(['this will be ' currentPath]);
  rmpath (genpath(currentPath));
  savepath;
  fprintf(' aaaaand its gone');

end%function