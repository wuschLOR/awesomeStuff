% BETA do not use it ists baaaaad

function drawTexOnCentralPoint ( windowPtr, texturePointer, centralPoint ,changesize )
%  drawTexOnCentralPoint ( windowPtr, DateiPfad, posX, posY ,changesize )
%  SHOW Zeigt ein bild auf den angegeben mittelpunkt an
%  
%    Input:
%      windowPtr  = Windowpointer
%      DateiPfad  = Ort des Bildes+ Dateiname ['.\StimuliM\1234.jpg']
%      posX       = Mittelpunkt X
%      posY       = Mittelpunkt Y
%      changesize = +/- veränderung der Bildgröße (Achtung nur bedingt nutzbar)
%  
%  History
%  2012-03-09 written (MG)
%  2014-05-XX changed to draw textures rather than reading the images (MG)
%  ----------------------------------------------------------------------------

Bild=imread(DateiPfad); 
%hol dir die größe des bilds
if isempty(changesize)
    Bh = size(Bild,1);
    Bw = size(Bild,2);
  else
    Bh = size(Bild,1) + changesize;
    Bw = size(Bild,2) + changesize;    
end%if
   
%packs in ein rect format
Bildbox= [0 0 Bw Bh];
   
%bild an die richtige stelle schieben
Bildbox= CenterRectOnPoint(Bildbox, posX, posY);

%mache das bild zu einer textur die auf Screen angezeit werden kann (weil das internet sagt dasses so schneller ist)
textureIndex=Screen('MakeTexture', windowPtr, Bild);

%pack die teextur auf den Screen
Screen('DrawTexture', windowPtr , texturePointer , [] , Bildbox)
 

end%function

