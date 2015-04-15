function [pressedButtonTime , pressedButtonValue , pressedButtonStr, pressedButtonTimeRaw ] = cedrusgetRating( handle , till)
%% [pressedButtonTime , pressedButtonValue , pressedButtonStr  ] = cedrusgetRating( handle , till)
##################################ACHTUNG:######################################
%  THIS FUNCTION DOES NOT USE THE BUTTONBOX TIMING STUFF CAUSE IT DOESN'T WORK 
%  POPERLY - IF YOU WANT TO HAVE GOOD RATINGS USE ANOTHER DEVICE!
%  http://docs.psychtoolbox.org/CedrusResponseBox
%  https://github.com/kleinerm/Psychtoolbox-3/blob/master/Psychtoolbox/PsychHardware/CedrusResponseBox.m
#  why use the timestamp and not some of the timings of evt or the keyboard ?
#  the function below tells you how many calls for evt your octave can handle
#  a R500 does this 1800-2300 times a second. You also get can retrieve how 
#  precise the interaction with the buttonbox is. Besides the timestamp is not 
#  related to any functionality of the box it lets you estimate the reactiontime
#  more precise than your keyboard with varies 5ms
###############################################################################
# function callspersec = cedrusRate (handle)
#   counter=0;
#   till = GetSecs+10;
#   do
#     evt = CedrusResponseBox('GetButtons', handle);
#     timestampPress = GetSecs;
#     ++counter
#   until (~isempty(evt) | timestampPress>= till)
#   callspersec = counter /10
###############################################################################
%  INPUT
%    handle = cedrus box handler 
%    till =  default = PTB time stamp + 60 timestampPress
%
%  History
%  2014-11-26 mg  changed timing to GetSecs instead of evt.ptbtime
%  2014-11-24 mg  rename
%  2014-06-27 mg  written
% ----------------------------------------------------------------------------
  # first thing to do is geting a timestamp 
  timestampStart=GetSecs
  
  # check if till is present
  if nargin < 2
      till = timestampStart + 60;
  endif

  # alte events wegwerfen
  CedrusResponseBox('FlushEvents', handle);

  #sobald ein butten gedrückt wurde das aufzeichnen 
  do
    evt = CedrusResponseBox('GetButtons', handle);
    timestampPress = GetSecs;
  until (~isempty(evt) | timestampPress>= till)

# evt =
# {
#   raw =  208
#   port = 0
#   action =  1
#   button =  7
#   buttonID = 6.Left
#   rawtime =  14.543
#   ptbtime =  1.4039e+09
#   ptbfetchtime =  1.4039e+09
# }

  
  if timestampPress<= till
    # taste is gedrückt worden
#     pressedButtonTime    = evt.ptbtime;
    pressedButtonTime    = timestampPress; # <- worst part ever evt.ptbtime is reliable as shit
    pressedButtonStr     = evt.buttonID;
    pressedButtonValue   = evt.button;
  else
    #keine taste ist gedrückt worden
    pressedButtonTime    = timestampPress;
    pressedButtonStr     = 'FAIL';
    pressedButtonValue   = 9999;
  endif
  
  buttons = 1;
  while any(buttons(1,:))
    buttons = CedrusResponseBox('FlushEvents', handle);
  endwhile

endfunction
