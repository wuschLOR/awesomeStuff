function [newSizeRect] = putRectInRect ( catalystRect=[100 100 600 600], oldSizeRect=[10 10 100 60] )
%% [newSizeRect] = putRectInRect ( catalystRect , oldSizeRect )
%
% Input:
%   catalystRect =
%   oldSizeRect  =
% Output:
%   newSizeRect = gibt das vegrößerte/verkleinerte oldSizeRect zentriert im
% 		catalystRect aus. Das ausgegbene rect kann direkt gezeichnte
% 		werden, daes die ortslage des catalystRect miteinbezieht.
% History
% 2014-05-?? written (MG)
% ----------------------------------------------------------------------------

%% kucken wie das verhältniss der rects zueinander ist 
widthCatalystRect = catalystRect(3)-catalystRect(1);
widthOldRect      = oldSizeRect(3)-oldSizeRect(1);

widthRatio = widthCatalystRect / widthOldRect; % das heißt wert :
					% < 1 oldSizeRect muss vverkleinert werden
					% > 1 oldSizeRect muss gestreckt werden

heigthCatalystRect = catalystRect(4)-catalystRect(2);
heigthOldRect      = oldSizeRect(4)-oldSizeRect(2);

heigthRatio = heigthCatalystRect / heigthOldRect;

%% schaun ob die höhe länger ist oder die breite


if widthRatio  < heigthRatio; %die breite des rects ist näher an der des catalystRect dran deshalb muss die breite hochskaliert werden
  ratio='breit'
endif;

if widthRatio  > heigthRatio;% wie oben nur dass eben die höhe näher dran ist
  ratio='hoch'
endif;

if widthRatio == heigthRatio;
  ratio='gleich'
endif;


%% oldSizeRect verkleinern
switch ratio
  case 'breit'

    reSizeRect(1) = 0;
    reSizeRect(2) = 0;
    reSizeRect(3) = widthOldRect  * widthRatio;
    reSizeRect(4) = heigthOldRect * widthRatio;

  case 'hoch'

    reSizeRect(1) = 0;
    reSizeRect(2) = 0;
    reSizeRect(3) = widthOldRect  * heigthRatio;
    reSizeRect(4) = heigthOldRect * heigthRatio;


  case 'gleich' %bei gleich widthRatio verwenden da die Bilder im Normalfall eher zu breit sind

    reSizeRect(1) = 0;
    reSizeRect(2) = 0;
    reSizeRect(3) = widthOldRect  * widthRatio;
    reSizeRect(4) = heigthOldRect * widthRatio;
  
  otherwise
    %well fuck

endswitch

%% reSizeRect in das catalystRecteinmitteln


leftwidth  = widthCatalystRect  - reSizeRect(3);
leftheigth = heigthCatalystRect - reSizeRect(4);

newSizeRect(1) = catalystRect(1) + leftwidth/2;
newSizeRect(3) = catalystRect(1) + leftwidth/2 +  reSizeRect(3);

newSizeRect(2) = catalystRect(2) + leftheigth/2;
newSizeRect(4) = catalystRect(2) + leftheigth/2 + reSizeRect(4);




endfunction