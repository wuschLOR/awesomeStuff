function [fileInfoStruct] = getFileInfo (folder , file)
%%  [fileInfoStruct] = getFileInfo (folder , file)
%
% gets infos of a specific file
%
%  folder          = 'stimulus'     (must be string; folder must be in working directory; filesep will be addet) 
%  file            = 'filename.png' (must be string)
%  fileInfoStruct  =
%                       4x1 struct array containing the fields:
%
%                         name
%                         date
%                         bytes
%                         isdir
%                         datenum
%                         statinfo
  fileInfoStruct  =dir([['.' filesep folder filesep ] file]);

endfunction
