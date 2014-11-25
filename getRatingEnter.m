function [pressedButtonTime , pressedButtonValue , pressedButtonStr , pressedButtonCode] = getRatingEnter( till )

%% [pressedButtonTime , pressedButtonValue , pressedButtonStr , pressedButtonCode] = getRatingEnter( till )
%
%  helptext goes in here
%
%  INPUT
%    till =  default = PTB time stamp + 600 seconds
%
%  History
%  2014-11-13 mg  changed keys + new exit keys
%  2014-06-18 mg  now the rating has a timelimit
%  2014-05-19 mg  written
%  ----------------------------------------------------------------------------
  # check if till is present
  if nargin < 1
      till = GetSecs + 600;
  endif

  KbName('UnifyKeyNames');

  escapeKey1 = KbName('LeftGUI');
  escapeKey2 = KbName('LeftAlt');
  escapeKey3 = KbName('DELETE' );
  
  key1 = KbName('Return'); % for number =Enter


#   counter=0;
  while 1
#       counter= counter+1;
      %was macht das Keyboard?
      [keyIsDown, seconds, keyCode] = KbCheck;
      % falls eine taste gedrückt ist UND sie eine taste von key1 - key4 ist UND nicht mehr als eine taste gedrückt sind
      if keyIsDown && keyCode(key1) && (sum(keyCode)==1); % &&
          pressedButtonTime    = seconds;
          pressedButtonCode    = keyCode;
          pressedButtonStr     = KbName(keyCode);
          break;
      endif
      % falls die zeit abgelaufen ist
      if seconds >= till
          pressedButtonTime    = seconds;
          pressedButtonCode    = keyCode;
          pressedButtonStr     = 'FAIL';
          break;
      endif
      % falls jemand die escape taste gedrückt hat - wahrscheinlich keine gute idee das an zu lassen ;
      if keyIsDown && (keyCode(escapeKey1) && keyCode(escapeKey2) && keyCode(escapeKey3) ) && (sum(keyCode)==3) ;
          Screen('CloseAll');
          finalMsg = 'what what'
          ListenChar(0);
      endif
      
      WaitSecs(.5);  % .001 reduziert die abfragen innerhalb von 5 secunden von 16745 auf 3594 aber reduziert auch die Genauigkeit auf eben nur
                        % .1    ==    51
                        % .01   ==   465
                        % .001  ==  3594
                        % .0005 ==  6179
                        % .0001 == 12402
  endwhile

#   counter
  switch pressedButtonStr
    case '1!'
      pressedButtonValue   = Return;
    otherwise
      pressedButtonValue   = 9999;
  endswitch

endfunction