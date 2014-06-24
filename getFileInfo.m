function [fileInfoStruct] = getFileInfo (folderStr , file)
%%  [fileInfoStruct] = getFileInfo (folderStr , file)
%
% gets infos of a specific file
%
%  folderStr       = 'stimulus'     (must be string; folder must be in working directory; filesep will be addet)
%  file            = 'filename.png' (must be string)
%  fileInfoStruct  =
%                       4x1 struct array containing the fields:
%
%                         name
%                         folderpath       !!!bonus!!!
%                         fullpath         full path with the name in it
%                         date
%                         bytes
%                         isdir
%                         datenum
%                         statinfo
%  History
%  2014-06-24 mg  added more paths to the struct
%  2014-06-23 mg  written
%  ----------------------------------------------------------------------------

  folderPath = ['.' filesep folderStr filesep ];
  
  fileInfoStruct  =dir([folderPath file]);

  fileInfoStruct.folderpath = folderPath;
  fileInfoStruct.fullpath   = [folderPath fileInfoStruct.name];

endfunction