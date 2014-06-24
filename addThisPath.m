function addThisPath
%%  [] = addThisPath()
%  This is going to add the current path to the octave paths for unlimited power
%  or just happy functions that work whatever folder octave is in right now.
%
%  History
%  2014-06-07 mg  written
%  2014-0-24  mg  added linebreaks for readability and the butbox folder
%  ----------------------------------------------------------------------------

  currentPath = pwd
  fprintf('Now adding the current folder to your octave\n');
  fprintf(['this will be ' currentPath '\n']);
  
#   addpath (genpath(currentPath , 'git')); % for version higher than 3.2
  addpath( currentPath);
  addpath([currentPath filesep 'butbox']);
  addpath([currentPath filesep 'dummyfunctions']);
  savepath;
  
  fprintf(' done :) enjoy!\n');

endfunction