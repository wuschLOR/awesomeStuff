%% beta do not use
function [pressedButtonTime , pressedButtonValue , pressedButtonStr , pressedButtonCode] = getRatingCustom( till , keyNames , keyValue )

%% [pressedButtonTime , pressedButtonValue , pressedButtonStr , pressedButtonCode] = getRatingCustom( till )
%
%  helptext goes in here
%
%  INPUT
%    till     ==  default = PTB time stamp + 60 seconds
%    keyNames == Cellarray of key names ()
%    keyValue == Cellarray of key values corresponding to the keyNames
%
%  History
%  2014-06-18 mg  now the rating has a timelimit
%  2014-05-19 mg  written
%  2014-11-12 mg  changet to recive a custom array of keys and output characters
%  ----------------------------------------------------------------------------
  if nargin < 1
      till = GetSecs + 60;
  endif

  KbName('UnifyKeyNames');

  escapeKey = KbName('escape');

  key1 = KbName('1!'); % for number =1
  key2 = KbName('2@'); % for number =2
  key3 = KbName('3#'); % for number =3
  key4 = KbName('4$'); % for number =4
  key5 = KbName('5%'); % for number =5
  key6 = KbName('6^'); % for number =6
  key7 = KbName('7&'); % for number =7

#   counter=0;
  while 1
#       counter= counter+1;
      %was macht das Keyboard?
      [keyIsDown, seconds, keyCode] = KbCheck;
      % falls eine taste gedrückt ist UND sie eine taste von key1 - key4 ist UND nicht mehr als eine taste gedrückt sind
      if keyIsDown && ( keyCode(key1) || keyCode(key2) || keyCode(key3) || keyCode(key4) || keyCode(key5) || keyCode(key6) || keyCode(key7) ) && (sum(keyCode)==1); % &&
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
      if keyIsDown && keyCode(escapeKey);
          Screen('CloseAll');
          finalMsg = 'what what'
          ListenChar(0);
          exit
      endif
      
      WaitSecs(.0001);  % .001 reduziert die abfragen innerhalb von 5 secunden von 16745 auf 3594 aber reduziert auch die Genauigkeit auf eben nur
                        % .1    ==    51
                        % .01   ==   465
                        % .001  ==  3594
                        % .0005 ==  6179
                        % .0001 == 12402
  endwhile

#   counter
  switch pressedButtonStr
    case '1!'
      pressedButtonValue   = 1;
    case '2@'
      pressedButtonValue   = 2;
    case '3#'
      pressedButtonValue   = 3;
    case '4$'
      pressedButtonValue   = 4;
    case '5%'
      pressedButtonValue   = 5;
    case '6^'
      pressedButtonValue   = 6;
    case '7&'
      pressedButtonValue   = 7;
    otherwise
      pressedButtonValue   = 9999;
  endswitch

endfunction