clc
clear
blackjack = simpleGameEngine('retro_cards.png', 16, 16, 5, [21, 71, 52]);  %uses simple game engine and sets the background coulour to green using [21, 71, 52]
board = [1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1]; %creates a matrix for drawscene function
drawScene(blackjack,board); %displays the board
img=imread('hitenter.png'); %shows the starting page
image(img);
axis off;
gamestarter=getKeyboardInput(blackjack); %gets the keyboard input for starting the game



while strcmp(gamestarter,'return') %if the input is enter game starts
%the following line of code creates an array 1x52 of randomized number between
%21 and 72, which all number are unique
    randomCards=randperm(52,52)+20; creates %a random array with random number between  21 to 71 but it may conatin repeating values 
i=1;
j=i+1;
while i<=52
    while j<=52
     if randomCards(i)==randomCards(j)    %gets the number executes the following command if the number is found repeating
         randomCards(j)=randperm(72,1,1)-randi(21,1,1);  % gets a new number between 21 and 72
         i=1;  % restarts the whole loop
         j=i+1; %gets to the next index which is 2
     end
     j=j+1;% increments j
    end
    i=i+1; % increments i
end


%this displays the gameboard with random cards
board = [1, 1, randomCards(25), 4, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1;randomCards(15), randomCards(16), 1, 1, randomCards(4), randomCards(5),1; 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1];
drawScene(blackjack,board);
playercard=[randomCards(4),randomCards(5)];  %gets the player cards
computercard=[randomCards(15),randomCards(16)]; %gets the computer card
dealercard=[randomCards(25)]; %gets the first card of the dealer
playercondition=sumchecker(playercard); %gets the sum of player cards bu using sumchecker
computercondition=sumchecker(computercard);% gets the sum of computer cards by using sum checker
dealercondition=sumchecker(dealercard);%gets the sum of dealer cards by using sumchecker


if playercondition==21  %displays winning message if the player has won
    text(100,200,'YOU WON','FontSize',50,'Color','r')
elseif playercondition<21 %if the plyer sum is less than 21
    hitordeal=getKeyboardInput(blackjack); %asks player to hit enter(to get a new card) or press d for deal
    counter=0;%counting purpose
while(strcmp(hitordeal,'return') && playercondition<21)%executes when player hit enter and sum is less than 21
        a=4;%a,b are for looping purpose
        b=1;
   for i=5:7%i,j are for looping purpose
     j=5;
    while strcmp(hitordeal,'return') && playercondition<21 && j<=7%executes when player hit enter and sum is less than 21 and j<7
        
        if (counter>2)
hitordeal=getKeyboardInput(blackjack);%gets the keyborad input when the counter is greater than 2,so gets the keyboard input whether to draw fourth card

        end
        if hitordeal=='d'% if the pressed value is d breaks out
            break;
        end 
         board(i,j)=randomCards(a);%gets the card and store it in board
         drawScene(blackjack,board);%draws the board
         playercardnew(b)=randomCards(a);%gets the player card and store it in a new variable
         playercondition=sumchecker(playercardnew);% checks the sum of player cards
         counter=counter+1;
         a=a+1;
        b=b+1;
         j=j+1;
    end
    if j==7% reset the column if the column is 7
        j=5;
    end
        
  end
    
 end
    if playercondition>21 %if the sum of plyer card becoems more than 21 it shows a busted message
       xlabel('BUSTED','FontSize',20,'Color','r')       
      
    elseif playercondition==21 %if the sum is 21 it shows win message
         xlabel('YOU WON','FontSize',20,'Color','r')       
       

    end
    
end


if computercondition==21 
elseif computercondition<21 % if sum of computer card is less than 21 gets the hit or deal by using ai.m function
    hitordealai=ai(computercondition);% passes the sum into ai function and gets the output whther to hit or deal
    counterai=0;%counter
    while(strcmp(hitordealai,'return') && computercondition<21) %executes when the ai decide to hit
        a=15;%for looping
      b=1;
 for x=5:7%for looping
     y=1;
    while strcmp(hitordealai,'return') && computercondition<21 && y<=3%executes when ai hits and sum is less than 21 and j<=3
       
        if (counterai>2)%gets the ai return based on computercondition
hitordealai=ai(computercondition);
         end
        
         if hitordealai=='d'%breaks as ai decided to deal
            break;
        end
        pause(1);%pauses execution for 1 second to make game look more realistic
        
        board(x,y)=randomCards(a);%gets the card and store it in board
        drawScene(blackjack,board);%draws the board
        computercardnew(b)=randomCards(a); %gets the computer card and store it in a new variable
         computercondition=sumchecker(computercardnew);% checks the sum of computer cards
         counterai=counterai+1;
          a=a+1;
        b=b+1;
         y=y+1;
     end
    if y==3 %reset the column to 1
        y=1;
    end
  end
end
end
m=25;%for looping
p=1;
for n=1:3%for looping
    o=3;
while dealercondition<17 && o<=5 %gets the new card for dealer if the sum of current card is less than 17
    board(n,o)=randomCards(m);%gets the card and store it in board
    drawScene(blackjack,board);%draws the board
    dealercardnew(p)=randomCards(m);%gets the dealer card and store it in a new variable
         dealercondition=sumchecker(dealercardnew);% checks the sum of dealer cards
         pause(1);%pauses the execution for 1 sec
         m=m+1;
         o=o+1;
         p=p+1;
end
end
%the following code checks the condition and prints the message
if dealercondition<=21 && playercondition<=21 %executes when plyer and dealer card sum is less than 21
playerdiff=21-playercondition;       %gets the difference of player card
computerdiff=21-computercondition;   %gets the difference of computer card
dealerdiff=21-dealercondition;       %gets the difference of dealer card
if dealerdiff>playerdiff && dealerdiff>computerdiff %prints player won as player is closest to 21
    xlabel('YOU WON','FontSize',20,'Color','r')
elseif dealerdiff<playerdiff && dealerdiff<computerdiff %prints player lost when dealer is closer to 21 than  player
     xlabel('YOU LOST','FontSize',20,'Color','r')
elseif dealerdiff==playerdiff %when both player and dealer sum is same prints its a push
     xlabel('ITS A PUSH','FontSize',20,'Color','r')

end
elseif  dealercondition>21 && playercondition<=21%prints win as dealer is busted
    xlabel('YOU WON,DEALER GOT BUSTED','FontSize',20,'Color','r')
end
gamestarter=getKeyboardInput(blackjack);%if player hits enter game restarts
end