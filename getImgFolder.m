function [fileStruct] = getImgFolder (folderStr, fileType)
%%  [fileStruct] = getImgFolder (folder, filetype)
%
%  function to get the names of all files from a subfolder. For exampel all png
%  files from the folder pic und turns them into a array.
%  
%  folderStr   = pic (must be string)
%  fileType    = png (must be string) '*' if you want all files
%  fileStruct  =
%    			4x1 struct array containing the fields:
% 
%      			  name
%      			  date
%      			  bytes
%      			  isdir
%      			  datenum
%      			  statinfo
%
%  History
%  2014-05-13 written (MG)
%  ----------------------------------------------------------------------------




  realFolderStr = ['.' filesep folderStr filesep] % makes a wohle path

  fileStruct = dir([realFolderStr '*.' fileType]); % reads all the files

endfunction 

%  --------------------------------------------------------------------------  %