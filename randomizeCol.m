function [randCol ,  nextSeed , outputMsg] = randomizeCol(col , randomSeed , inputColMultiplyer)

if nargin <3
  if ~exist('randomSeed'              , 'var') ;  randomSeed              = []; endif
  if ~exist('inputColMultiplyer'      , 'var') ;  inputColMultiplyer      = []; endif
endif

if isempty(randomSeed)        ; randomSeed         = 42    ; endif
if isempty(inputColMultiplyer); inputColMultiplyer = 1     ; endif


%%
% helptext goes in here
%  History
%  2014-06-16 written
%  ----------------------------------------------------------------------------

  lengthCol = length(col);
  lengthCol = lengthCol * inputColMultiplyer;

  outputMsg = ' ';

  %  randomseed
  if isoctave
      rand('state' , randomSeed); % octave
    else
      rng (randomSeed);           % matlab
  end%if

 
  %  generieren der Col in der richtigen größe
  colNew = [];

  do
    colNew = [col ; colNew]; % immer so lang die col an die colNew dran hängen bis sie lang genug ist 
  until length(colNew) >= lengthCol

  indexCol = [(randperm(lengthCol))' colNew];

  indexCol = sortrows(indexCol,1);

  randCol = indexCol(: , 2:end);

  outputMsg = 'done';
  outputMsg
  nextSeed = randomSeed + 42; % the answer to everyting


endfunction