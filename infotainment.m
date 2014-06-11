function infotainment (windowPtr , text)
%%  infotainment (windowPtr , text)
%
%  helptext goes in here
%
%  History
%  2014-05-13 written (MG)
%  ----------------------------------------------------------------------------
 

  oldTextColor= Screen('TextColor', windowPtr , [255 20 147]);
  oldTextSize = Screen('TextSize' , windowPtr , 50); %s chrift groß machen

  
  DrawFormattedText( windowPtr , text, 'center', 'center');

%    sx=='center', then each line of text is horizontally centered in the window
%    sx=='right', then each line of text is right justified to the right border of the target window
%    sy=='center'
  
  Screen( windowPtr , 'flip');
  
  KbPressWait;
  
  Screen(windowPtr , 'flip');
  
  Screen('TextSize'  , windowPtr , oldTextSize  ); % fontsize wiederherstellen
  Screen('TextColor' , windowPtr , oldTextColor ); % textcolor wiederherstellen

  
end%function 