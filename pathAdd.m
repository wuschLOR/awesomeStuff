function pathAdd
%%  [] = addThisPath()
%  This is going to add the current path to the octave paths for unlimited power
%  or just happy functions that work whatever folder octave is in right now.
%  ----------------------------------------------------------------------------
%  History
#  2015-04-20 mg  now much more elegant since exclutions work on genpath
%  2015-04-20 mg  othergreatminds + allcomb
%  2014-11-25 mg  new paths addet
%  2014-11-23 mg  raname
%  2014-06-24 mg  added linebreaks for readability and the butbox folder
%  2014-06-07 mg  written
%  ----------------------------------------------------------------------------

  currentPath = pwd;
  fprintf('Now adding the current folder to your octave\n');
  fprintf(['this will be ' currentPath '\n']);
  
  addpath (genpath(currentPath , ['.git'])); % for version higher than 3.2
#   addpath( currentPath);
#   addpath([currentPath filesep 'cedrus']);
#   addpath([currentPath filesep 'dummyfunctions']);
#   addpath([currentPath filesep 'beta']);
#   addpath([currentPath filesep 'othergreatminds'])
#   addpath([currentPath filesep 'othergreatminds' filesep 'allcomb'])
  savepath;
  
  fprintf(' done :) enjoy!\n');

endfunction