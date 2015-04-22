function [ infoStruct] =makeTexFromInfo (windowPtr , infoStruct)

## [infoStruct] =makeTexFromInfo (windowPtr , infoStruct)
#  Takes a infoStructure provided by 
#    - getFilesInFolderInfo
#    - getFileInfo
#    - dir([folderPath file]);
#  and convertes the images via imread to textures displayable by 
#  Screen('DrawTexture') a PTB function.
#  If the file is a .png the alpha Channel will be added to be used with 
#  Screen('BlendFunction') also a PTB function.
###############################################################################
#
#  History
#  2015-04-15 mg  added the alpha channel for .png
#  2014-11-13 mg  changed message
#  2014-06-24 mg  written
###############################################################################

  [m,n] = size(infoStruct);

  for i= 1:m
#   Doing stuff with the image
    [IMG , MAP , ALPHA] = imread(infoStruct(i).fullpath); #  reading img
    
    #check for png
    #http://old.psychtoolbox.org/OldPsychtoolbox/wikka.php?wakka=FaqImageTransparency
    if findstr( infoStruct(i).name , '.png') & ~isempty(ALPHA)
      IMG(:,:,4) = ALPHA(:,:);
    endif

    infoStruct(i).texture=Screen('MakeTexture' , windowPtr , IMG); #  converting to tex

#   generate Message
    statusPercent = i/m * 100;
    MSG = ['converting files to textures\n sourcefolder is: ' infoStruct(i).folderpath '\n converting is ' num2str(statusPercent) ' % done :)\n' '\n \n did you know that this is experiment is published under\n GPL v3? \n Check it out at \n github.com/wuschLOR/'];
    DrawFormattedText( windowPtr , MSG , 'center', 'center');
    Screen(windowPtr, 'flip');
  endfor

endfunction