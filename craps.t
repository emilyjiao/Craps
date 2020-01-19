/*
File: craps.t
Name: Emily Jiao
Class: ICS2O1
Date: June 5, 2017
Description: This program will run a dice game called Craps.
*/

const LOSE_NUM := 7
const WIN_NUM1 := 7
const WIN_NUM2 := 11
const FIRST_LOSE1 := 2
const FIRST_LOSE2 := 3
const FIRST_LOSE3 := 12
var input : string
var continue : string
var dice1 : int
var dice2 : int
var sum1 : int
var sum2 : int
var point : int := 0
var font1 := Font.New ("Bradley Hand ITC:30")
var font2 := Font.New ("Rosewood Std Regular:50")

%Extensions
var game : int := 0
var win : int := 0
var random : int
var reset : string
var x, y, bnum, bud : int
%Welcome Screen
%Graphics - Random colour for welcome screen each game played
setscreen ("graphics: 1000; 800")

%Background colour
Draw.FillBox (0,0, 1000, 800, 103)
Text.ColorBack (103)
loop
randint (random, 104, 255)
color (random)
Font.Draw ("Welcome to Craps!", 0, 650, font2, random)
locate (15, 1)

%Graphics - Dice drawn
Draw.FillBox (400, 200, 600, 400, white)
Draw.FillOval (500, 300, 20, 20, black)

%MouseClick extension
put "Click anywhere on the screen to continue"
buttonwait ("down", x, y, bnum, bud)
    cls

%Instructions
Font.Draw ("Instructions \n", 0, 750, font1, random)
color (black)
locate (7, 1)
    put "You roll two dice. On the first roll of a game, if the sum of the dice is:"
    put "\t 2, 3 or 12, you lose"
    put "\t 7 or 11, you win"
    put "If you roll any other sum this is called your point and you keep rolling. \n"
    put "On subsequent rolls if you:"
    put "\t Get your point again, you win"
    put "\t Roll a 7, you lose"
    put "Keep rolling until you get your point or a 7 \n"
    put "Click anywhere on the screen to continue"
buttonwait ("down", x, y, bnum, bud)
    cls

%First roll
    randint (dice1, 1, 6)
    randint (dice2, 1, 6)
    sum1 := dice1+dice2
    
%Drawing outline of dice first for efficiency
    Draw.FillBox (500, 200, 700, 400, white)
    Draw.FillBox (290, 200, 490, 400, white)
    
%For structure for simulating dice roll
for i : 0..0
delay (100)
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (600, 300, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)

	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (330, 300, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (450, 300, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (540, 300, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
	Draw.FillOval (660, 300, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
delay (100)
end for
    
%Extension - Level 1
    game := 1+game
    put "Game: ", game
    
    put "Dice 1: ", dice1
    put "Dice 2: ", dice2
    put "Your point from your first roll is, ", sum1

%Case structure to determine what to draw for first roll for dice1
case dice1 of
    label 1 :
	Draw.FillOval (390, 300, 20, 20, black)
    label 2 : 
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
    label 3 : 
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
    label 4 :
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
    label 5 : 
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
    label 6 :
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (330, 300, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (450, 300, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
end case

%Case structure to determine what to draw for first roll for dice2
case dice2 of
    label 1 :
	Draw.FillOval (600, 300, 20, 20, black)
    label 2 : 
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
    label 3 : 
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
    label 4 :
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
    label 5 : 
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
    label 6 :
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (540, 300, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
	Draw.FillOval (660, 300, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
end case
%Lose Numbers
    if (sum1 = FIRST_LOSE1 or sum1 = FIRST_LOSE2 or sum1 = FIRST_LOSE3) then
	put "You lose"
	put "Press any key to exit"
    
%Win Numbers + extension - Level 1
    elsif (sum1 = WIN_NUM1 or sum1 = WIN_NUM2) then
	put "You win!"
	put "Press any key to exit"
	win := win+1
    else 
	put "Since you just rolled a(n) ", sum1, ", \nyou can roll again to try to get another ", sum1, " to win."
	put "Press c to continue or any other key to quit"
	point := sum1
    end if
    get input

%Extension - Reset number of games played and wins
    put "Press r to reset the number of games played and number of wins to 0. If not, press any other key."
    get reset
    if (reset = 'r') then
	win := 0
	game :=0
    end if
	cls  
      
%Continuation if user did not lose or win on first roll
loop
    if (input not = 'c') then
    exit
    end if
    exit when (sum1 = 7 or sum1 = 11 or sum1 = 2 or sum1 = 3 or sum1 = 12)
    
    randint (dice1, 1, 6)
    randint (dice2, 1, 6)
    sum2 := dice1+dice2
    
%Drawing outline of dice first for efficiency
Draw.FillBox (500, 200, 700, 400, white)
Draw.FillBox (290, 200, 490, 400, white)

%For structure for simulating dice roll
for i : 0..0
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (600, 300, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
delay (100)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)

	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (330, 300, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (450, 300, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (540, 300, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
	Draw.FillOval (660, 300, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillBox (500, 200, 700, 400, white)
	Draw.FillBox (290, 200, 490, 400, white)
delay (100)
end for

    put "Dice 1: ", dice1
    put "Dice 2: ", dice2
%Case structure to determine what to draw for each roll for dice 1
case dice1 of
    label 1 :
	Draw.FillOval (390, 300, 20, 20, black)
    label 2 : 
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
    label 3 : 
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
    label 4 :
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
    label 5 : 
	Draw.FillOval (390, 300, 20, 20, black)
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
    label 6 :
	Draw.FillOval (330, 240, 20, 20, black)
	Draw.FillOval (330, 300, 20, 20, black)
	Draw.FillOval (330, 360, 20, 20, black)
	Draw.FillOval (450, 240, 20, 20, black)
	Draw.FillOval (450, 300, 20, 20, black)
	Draw.FillOval (450, 360, 20, 20, black)
end case

%Case structure to determine what to draw for each roll for dice 2
case dice2 of
    label 1 :
	Draw.FillOval (600, 300, 20, 20, black)
    label 2 : 
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
    label 3 : 
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
    label 4 :
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
    label 5 : 
	Draw.FillOval (600, 300, 20, 20, black)
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
    label 6 :
	Draw.FillOval (540, 240, 20, 20, black)
	Draw.FillOval (540, 300, 20, 20, black)
	Draw.FillOval (540, 360, 20, 20, black)
	Draw.FillOval (660, 240, 20, 20, black)
	Draw.FillOval (660, 300, 20, 20, black)
	Draw.FillOval (660, 360, 20, 20, black)
end case

%Win condition + extension - Level 1
    if (sum2 = point) then
	put "Since you rolled a(n) ", sum2, ", you win!"
	put "This game has ended. Press any key to exit the game."
	win := win+1  
    get input

%Extension - Reset number of games played and wins       
    put "Press r to reset the number of games played and number of wins to 0. If not, press any other key."
    get reset
    if (reset = 'r') then
	win := 0
	game := 0
    end if
    exit

%Lose condition
    elsif (sum2 = LOSE_NUM) then
	put "Since you rolled a(n) 7, you lose."
	put "This game has ended. Press any key to exit the game."
    get input

%Extension - Reset number of games played and wins    
    put "Press r to reset the number of games played and number of wins to 0. If not, press any other key."
    get reset
    if (reset = 'r') then
	win := 0
	game := 0
    end if
    exit
    
%Didn't win, didn't lose yet condition    
    else
	put "Since you rolled a(n) ", sum2, ", \nyou can roll again to try to get another ", point, " to win. \nPress 'c' to continue or any key to quit."
    get input

%Extension - Reset number of games played and wins
    put "Press r to reset the number of games played and number of wins to 0. If not, press any other key."
    get reset
    if (reset = 'r') then
	win := 0
	game := 0
    end if
    exit when (input not = 'c')
    end if
    cls
end loop

%Gives player a choice to play again or exit the program
    cls
    put "The game has ended, I hope you had fun!"
    put "Total games played: ", game
    put "Total games won: ", win
    put "To play again press 'c', to exit the progam press any other key"
    get input
    put "Press r to reset the number of games played and number of wins to 0. If not, press any other key."
    get reset
    if (reset = 'r') then
	win := 0
	game :=0
    end if
    exit when (input not = 'c')
    cls
end loop
    cls
    
%Exit message
    put "The program has ended; bye for now!"
