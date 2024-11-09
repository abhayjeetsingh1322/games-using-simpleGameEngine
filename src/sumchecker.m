function [sumchecker] = sumchecker(cardarray)

% this function basically gets the value of card such as 2,3 to 10 or 11
% depending upon their location in card sprite 
% there are two types of sum if there is an ace in the  card one with
% value of 1 and another with value of 11
% this function returns the sum of card which has the most suitable sum


for i=1:numel(cardarray)
    if ((cardarray(i)==21) || (cardarray(i)==34) || (cardarray(i)==47) || (cardarray(i)==60))
        cardvalues(i)=1; %this statement if to get the values of ace
        cardvaluesAce(i)=11;
    elseif ((cardarray(i)>=31 && cardarray(i)<=33) || (cardarray(i)>=44 && cardarray(i)<=46) || (cardarray(i)>=57 && cardarray(i)<=59) || (cardarray(i)>=70 && cardarray(i)<=72))
         cardvalues(i)=10; % this assigns the value to face cards
         cardvaluesAce(i)=10;
    else
        %this assigns value to number cards the logic to get the value for
        %number card was the card-lowerbound(the starting point of number card for each type of card)+2;
        if cardarray(i)>=22 && cardarray(i)<=30
            cardvalues(i)=cardarray(i)-22+2;
            cardvaluesAce(i)=cardarray(i)-22+2;
        elseif cardarray(i)>=35 && cardarray(i)<=43
            cardvalues(i)=cardarray(i)-35+2;
            cardvaluesAce(i)=cardarray(i)-35+2;
        elseif cardarray(i)>=48 && cardarray(i)<=56
            cardvalues(i)=cardarray(i)-48+2;
            cardvaluesAce(i)=cardarray(i)-48+2;
        else
            cardvalues(i)=cardarray(i)-61+2;
            cardvaluesAce(i)=cardarray(i)-61+2;

        end
    end
end


sumnoAce=sum(cardvalues);  %gets the sum of value when ace is 1
sumAce=sum(cardvaluesAce); %gets the sum of card when ace is 11
if (sumnoAce>21 && sumAce>21)
    sumchecker=sumnoAce;   %if both the sum is above 21 then gives output the sunnoAce
elseif (sumnoAce==21 || sumAce==21)  %if any of the sum is 21 then give output of 21
    sumchecker=21;
elseif (sumnoAce<21 && sumAce>21)    %if sunnoAce is less than 21 and sunAce>21 give sumnoAce as output
    sumchecker=sumnoAce;
else
    sumchecker=sumnoAce;             %if another condition go with lower value
end
end