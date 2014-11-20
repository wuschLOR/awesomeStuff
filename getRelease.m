function [releaseTime ]=getRelease

%% getRelease
%
%  just waits till all keys are released 
%  releaseTime == seconds from KbCheck
%  History
%  2014-05-19 mg  written
  while 1

    %was macht das Keyboard?
    [keyIsDown, seconds, keyCode] = KbCheck;
    
    if (sum(keyCode)==0)
      releaseTime=seconds;
      break;
    endif
    
    WaitSecs(.05); # 20* per sec
    % .001 reduziert die Abfragen innerhalb von 5 Sekunden von 16745 auf 3594 aber reduziert auch die Genauigkeit
    % .1    ==    51
    % .01   ==   465
    % .001  ==  3594
    % .0005 ==  6179
    % .0001 == 12402
  endwhile
    
endfunction