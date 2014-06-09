function [ texArray ] = makeTex ( windowPtr , ImgArray, folderStr  )
%%  [ texArray ] = makeTex ( windowPtr , ImgArray, folderStr  )
%
%  Input:
%    windowPtr =  Psychtoolbox window Pointer
%    ImgArray  =  struct array mit den metadaten der Bilder
%		  vorher mit einlesen: ImgArray = dir ('Image.png')
%    folderStr =  falls die bilder isch nicht im root verzeichnis befinden,
%		  hier bitte einen string eingeben 'folder'
%  
%  Output:
%    texArray  =
%
%  History
%  2014-05-13 written (MG)
%  ----------------------------------------------------------------------------


  realFolderStr = ['.' filesep folderStr filesep];
  
  [m,n] = size(ImgArray); %wie viele bilder sind im img ordner
  
  for i = 1:m
  
    [image , map , alphaCannel] = imread( [realFolderStr ImgArray(i,1).name]);

   % image(:,:,4) = alphaCannel(:,:); %http://psychtoolbox.org/FaqImageTransparency

    texArray(i,:)=Screen('MakeTexture', windowPtr, image);

    statusPercent = i/m * 100;
    prompt = ['Converting ' realFolderStr ' this is ' num2str(statusPercent) ' % done :)'];
    DrawFormattedText( windowPtr , prompt , 'center', 'center');
    Screen(windowPtr, 'flip');
    
  end

endfunction 

