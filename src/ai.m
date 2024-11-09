function [hitordeal]=ai(sum)
%this function checks whther the sum of cards is less than 12 or not and
%then decides to hit or deal, the deciding value is 12 because at 12 there
%are some chnaces of getting busted but before 12 you can always hit and do
%not get busted.
if sum<12 %returns 'return' when the sum is less than 12, which suggets to hit
    hitordeal='return';
elseif sum>=12 %returns 'd' when the greater than or equal is less than 12, which suggets to deal
    hitordeal='d';
end
end