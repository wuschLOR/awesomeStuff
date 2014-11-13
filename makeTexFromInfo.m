function [ infoStruct] =makeTexFromInfo (windowPtr , infoStruct)

%% [infoStruct] =makeTexFromInfo (windowPtr , infoStruct)
%  help will be added soon
%
%  History
%  2014-06-24 mg  written
%  2014-11-13 mg changed message
%  ----------------------------------------------------------------------------

  [m,n] = size(infoStruct);

  for i= 1:m
#   Doing stuff with the image
    [IMG , MAP , ALPHA] = imread(infoStruct(i).fullpath); %  reading img
    

    infoStruct(i).texture=Screen('MakeTexture' , windowPtr , IMG); %  converting to tex

#   generate Message
    statusPercent = i/m * 100;
    MSG = ['converting files to textures\n sourcefolder is: ' infoStruct(i).folderpath '\n converting is ' num2str(statusPercent) ' % done :)\n' '\n \n did you know that this is experiment is published under\n GPL v3? \n the files can be found at \n github.com/wuschLOR/'];
    DrawFormattedText( windowPtr , MSG , 'center', 'center');
    Screen(windowPtr, 'flip');
  endfor

endfunction