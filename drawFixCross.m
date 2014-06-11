function drawFixCross( windowPtr , color , centerPointX , centerPointY , lineLengthPx , penWidth )
%%  drawFixCross( windowPtr , color , centerPointX , centerPointY , lineLengthPx , penWidth )
%  Malt ein Fixationskreuz mit dem Mittelpunkt
%  
%  Input:
%    windowPtr    = window pointer
%    color        = [r g b]
%    centerPointX = 1 px
%    centerPointY = 1 px
%    lineLengthPx = e.g. 100px
%    penWidth     = (1.000000 to 5.000000) default is 1
%
%
%  History
%  2012-03-09 written (MG)
%  2014-05-14 cosmetic changes (MG)
%  ----------------------------------------------------------------------------


%  Horizontal line
  fromH = centerPointX - lineLengthPx/2;
  fromV = centerPointY;
  toH   = centerPointX + lineLengthPx/2;
  toV   = centerPointY;
  %color = [255 20 147];

  Screen('DrawLine', windowPtr , color , fromH , fromV , toH , toV , penWidth);

%  Vertikal line
  fromH = centerPointX;
  fromV = centerPointY - lineLengthPx/2;
  toH   = centerPointX;
  toV   = centerPointY + lineLengthPx/2;
  %color = [127 255 212];
  
  Screen('DrawLine', windowPtr , color , fromH , fromV , toH , toV , penWidth);

end%function


