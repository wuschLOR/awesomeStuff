function  [octaveItIs] = isoctave

%%  [octaveItIs] = isoctave
%  returns true it octave is running or false if not running octave
%
%  History
%  2014-06-11 mg  written
%  ----------------------------------------------------------------------------

  a = exist('OCTAVE_VERSION','builtin'); % see if octave version is there
  octaveItIs = a ~=0  % if a is not 0 then true

end%function
