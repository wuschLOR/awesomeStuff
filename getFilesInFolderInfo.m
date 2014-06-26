function [fileInfoStruct] = getFilesInFolderInfo (folderStr, fileType)
%%  [fileInfoStruct] = getFilesInFolderInfo (folder, filetype)
%
%  function to get the names of all files from a subfolder. For exampel all png
%  files from the folder pic und turns them into a array.
%  
%  folderStr   = pic (must be string)
%  fileType    = png (must be string) '*' if you want all files
%  fileInfoStruct  =
%    			4x1 struct array containing the fields:
% 
%      			  name
%                         folderpath       !!!bonus!!!
%                         fullpath         full path with the name in it
%      			  date
%      			  bytes
%      			  isdir
%      			  datenum
%      			  statinfo
%
%  History
%  2014-06-24 mg  added more path to the struct
%  2014-06-23 mg  changed name to be more clear
%  2014-05-13 mg  written
%  ----------------------------------------------------------------------------

  folderPath = ['.' filesep folderStr filesep]; % makes a wohle path

  fileInfoStruct = dir([folderPath '*.' fileType]); % reads all the files that are fileType

  for i=1:length(fileInfoStruct)
   
    fileInfoStruct(i).folderpath = folderPath;
    fileInfoStruct(i).fullpath   = [folderPath fileInfoStruct(i).name];
    
  endfor

endfunction