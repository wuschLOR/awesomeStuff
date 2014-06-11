function [randColMatrix , nextSeed , outputMsg] = randomizeColMatrix (colMatrix , randomSeed=[] , inputColMultiplyer=[] , pairingOK=[] , recencyOK=[])

if nargin <4
  if ~exist('randomSeed'              , 'var') ;  randomSeed              = []; end%if
  if ~exist('inputColMultiplyer'      , 'var') ;  inputColMultiplyer      = []; end%if
  if ~exist('pairingOK'               , 'var') ;  pairingOK               = []; end%if
  if ~exist('recencyOK'               , 'var') ;  recencyOK               = []; end%if
end%if


if isempty(randomSeed)        ; randomSeed         = 42    ; end%if
if isempty(inputColMultiplyer); inputColMultiplyer = 1     ; end%if
if isempty(pairingOK)         ; pairingOK          = true  ; end%if
if isempty(recencyOK)         ; recencyOK          = true  ; end%if
 
%%  [randColMatrix , nextSeed , outputMsg] = randomizeColMatrix (colMatrix , randomSeed , inputColMultiplyer , pairingOK , recencyOK)
%  Input:
%   colMatrix     = Matrix with 2 culums
%  		    1 1
%  		    2 2
%  		    3 3
%  		    4 4
%   randomSeed = seed um die randoms zu steuern
%   inputColMultiplyer = multiply the colMatrix with a factor
%   pairingOK = true   == just generates the random colMatrix once
%                false  == generates the randColMatrix after and after until the
%                          output has no equal pairs
%   recencyOK  = true   == nothing is done to the colMatrix
%                  false  == keeps sorting the rows until no stimuli follows itself
%  Output:
%    randColMatrix = matrix mit zwei spalten die durchrandomisiert wurde
%  			3 2
%  			1 4
%  			4 3
%  			2 1
%    nextSeed = randomSeed + 42 setzt den nächsten seed fest
%
%  History
%  2014-06-11 mg  changed stuff to make it work with matlab
%  2014-06-05 mg  added features to prevent dubblets and/or prevent the same
%                 stimuli showing up directly after another
%  2014-05-16 mg  written
%  ----------------------------------------------------------------------------
  %diary ( num2str( strftime( '%Y%m%d%H%M%S' ,localtime (time () ) ) ) )
%    diary ('randcolseewhats happening')
  lengthColMatrix = length(colMatrix);
  lengthColMatrix = lengthColMatrix * inputColMultiplyer;

  outputMsg = ' ';

%  randomseed
  if isoctave
      rand('state' , randomSeed); % octave
    else
      rng (randomSeed);           % matlab
  end%if

  counterCombination=0; % counter for the outputMsg
  do
  %  generieren der colMatrix in der richtigen größe
    colMatrixNew = [ , ];

    do
      colMatrixNew = [colMatrix ; colMatrixNew];
    until length(colMatrixNew) >= lengthColMatrix
     
    %  generieren einer indexMatrix
    indexCol1 = [(randperm(lengthColMatrix))' colMatrixNew(:,1)];
    indexCol2 = [(randperm(lengthColMatrix))' colMatrixNew(:,2)];
     
    %  sortiern nach der indexspalte
    indexCol1 = sortrows(indexCol1,1);
    indexCol2 = sortrows(indexCol2,1);
     
    randColMatrix = [indexCol1(:,2) indexCol2(:,2)];
    
    pairSum = sum(randColMatrix(:,1) == randColMatrix(:,2));
    counterCombination = counterCombination +1; % counter for the outputMsg
    
  until pairingOK ==true | pairSum == 0 | counterCombination >=5000 % entweder ist pairingOK true dann wir das ganze nur ein mal ausgeführt oder eben wenn es öfters durchläuft bis die pairSum gleich 0 ist oder nach 5000 versuchen kein paarfreies paar gefunden wurde.

  if pairingOK == true;  outputMsg = ['the ' num2str(counterCombination) ' combination was taken  ! ']; end%if
  if pairingOK == false; outputMsg = ['the ' num2str(counterCombination) ' combination was taken  ! ']; end%if

  
  %  alternatives Paarungsverhalten (total lame)
  swappCounter =0
  if counterCombination >= 5000
    do
    
      for thisRow=1:lengthColMatrix
        if randColMatrix(thisRow ,1) == randColMatrix(thisRow, 2) % wenn dubletten auftreten
          leftORright= randiFake(2); %  random ob links oder rechts getauscht werden soll
          newRow = randiFake(lengthColMatrix); % random neue zeile

          thisRowData = randColMatrix(thisRow, leftORright); % inhalt auslagern
          newRowData  = randColMatrix(newRow , leftORright); % "

          randColMatrix(thisRow,leftORright) = newRowData; % inhalt vertauschen
          randColMatrix(newRow ,leftORright) = thisRowData;% ""
          swappCounter = swappCounter+1;
        end%if
      end%for

      pairSum = sum(randColMatrix(:,1) == randColMatrix(:,2));
    until pairSum == 0
  outputMsg = ['Swapping hell was done for ' num2str(swappCounter) ' ! '];
  end%if
  
  

  % Analyse ob der selbe Stimulus mehrfach hintereinander angezeigt wird
  counterSorting = 0; % counter for the outputMsg
  switch recencyOK
    case false
      do
        dublett=0
        for thisRow=2:lengthColMatrix
          lastRow=thisRow-1;

          % linke Spalte
          if randColMatrix(lastRow,1) == randColMatrix(thisRow,1)
            dublett = dublett +1
            %es wird eine zufällige Zeile ausgewählt    newrandperm = newrandperm +1 mit der die aktuelle Zeile getauscht wird
            newRow = randiFake(lengthColMatrix)

            %austauschen der Zeilen
            thisRowData = randColMatrix(thisRow,:);
            newRowData  = randColMatrix(newRow ,:);

            randColMatrix(thisRow,:) = newRowData;
            randColMatrix(newRow ,:) = thisRowData;
            
            counterSorting = counterSorting +1; % counter for the outputMsg
          end%if

          % rechte Spalte
          if randColMatrix(lastRow,2) == randColMatrix(thisRow,2)
            dublett = dublett +1
            %es wird eine zufällige Zeile ausgewählt mit der die aktuelle Zeile getauscht wird
            newRow = randiFake(lengthColMatrix)
            
            %austauschen der Zeilen
            thisRowData = randColMatrix(thisRow,:);
            newRowData  = randColMatrix(newRow ,:);

            randColMatrix(thisRow,:) = newRowData;
            randColMatrix(newRow ,:) = thisRowData;
            counterSorting = counterSorting +1; % counter for the outputMsg
          end%if
        end%for
      until dublett ==0
      outputMsg = [outputMsg 'sorting was done ' num2str(counterSorting) ' times ! '];
    case true
      outputMsg = [outputMsg 'sorting was done ' num2str(counterSorting) ' times ! '];
  end%switch
  outputMsg
  nextSeed = randomSeed + 42; % the answer to everyting
  
end%function