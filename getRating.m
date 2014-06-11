function [pressedButtonTime , pressedButtonValue , pressedButtonStr , pressedButtonCode] = getRating()

%% [pressedButtonTime , pressedButtonValue , pressedButtonStr , pressedButtonCode] = getRating()
%  
%
%  helptext goes in here
%
%  History
%  2014-05-19 mg  written
%  ----------------------------------------------------------------------------


  KbName('UnifyKeyNames');

  escapeKey = KbName('escape');

  key1 = KbName('1!'); % for number =1
  key2 = KbName('2@'); % for number =2
  key3 = KbName('3#'); % for number =3
  key4 = KbName('4$'); % for number =4
  key5 = KbName('5%'); % for number =5
  key6 = KbName('6^'); % for number =6
  key7 = KbName('7&'); % for number =7


  while 1
      %was macht das Keyboard?
      [keyIsDown, seconds, keyCode] = KbCheck;
      % falls eine taste gedrückt ist UND sie eine taste von key1 - key4 ist UND nicht mehr als eine taste gedrückt sind
      if keyIsDown && ( keyCode(key1) || keyCode(key2) || keyCode(key3) || keyCode(key4) || keyCode(key5) || keyCode(key6) || keyCode(key7) ) && (sum(keyCode)==1); % &&
          break;
      end%if
      if keyIsDown && keyCode(escapeKey);
          Screen('CloseAll');
          finalMsg = 'what what'
          ListenChar(0);
          exit
      end%if
  end%while

  pressedButtonTime    = seconds;
  pressedButtonCode    = keyCode;
  pressedButtonStr     = KbName(keyCode);

  switch pressedButtonStr
    case '1!'
      pressedButtonValue   = 1
    case '2@'
      pressedButtonValue   = 2
    case '3#'
      pressedButtonValue   = 3
    case '4$'
      pressedButtonValue   = 4
    case '5%'
      pressedButtonValue   = 5
    case '6^'
      pressedButtonValue   = 6
    case '7&'
      pressedButtonValue   = 7
    otherwise
      pressedButtonValue   = 9999
  end%switch

end%function