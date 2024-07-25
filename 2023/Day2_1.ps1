<#As you walk, the Elf shows you a small bag and some cubes which are either 
red, green, or blue. Each time you play this game, he will hide a secret number
 of cubes of each color in the bag, and your goal is to figure out information
  about the number of cubes.

To get information, once a bag has been loaded with cubes, the Elf will reach
 into the bag, grab a handful of random cubes, show them to you, and then put
  them back in the bag. He'll do this a few times per game.

You play several games and record the information from each game (your puzzle input).
Each game is listed with its ID number (like the 11 in Game 11: ...) followed by a
 semicolon-separated list of subsets of cubes that were revealed from the bag
  (like 3 red, 5 green, 4 blue).

For example, the record of a few games might look like this:

Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
In game 1, three sets of cubes are revealed from the bag (and then put back again). 
The first set is 3 blue cubes and 4 red cubes; the second set is 1 red cube, 2 green 
cubes, and 6 blue cubes; the third set is only 2 green cubes.

The Elf would first like to know which games would have been possible if the bag 
contained only 12 red cubes, 13 green cubes, and 14 blue cubes?

In the example above, games 1, 2, and 5 would have been possible if the bag had 
been loaded with that configuration. However, game 3 would have been impossible 
because at one point the Elf showed you 20 red cubes at once; similarly, game 4 
would also have been impossible because the Elf showed you 15 blue cubes at once. 
If you add up the IDs of the games that would have been possible, you get 8.

Determine which games would have been possible if the bag had been loaded with only 
12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of the IDs of those games?#>

###LOGIC###
<#Sort the games into a table where each key is the game number
In each game sort each round as another table with the colour as the key#>

$Gamelist = @{}
$MaxColours = @{
  Red = 12
  Green = 13
  Blue = 14
}
Get-Content -Path .\Day2_Input.txt | ForEach-Object {
  #First Get the key value pairs for the games
  $GameKey = ($_ -split ':',2)[0].Trim()
  $GameValues = ($_ -split ':',2)[1].Trim()

  #Split out the values to each round
  $Rounds = $GameValues -split ';'

  $GameValuesList = @()

  #For Each Round define the colour and count as a new hashtable
  ForEach ($Round in $Rounds){
    $ValueHashTable = @{}
    $ColourCountValues = $Round -split ','

    ForEach ($ColourPair in $ColourCountValues){
      $Count,$Colour = $ColourPair.Trim() -split ' ',2
      $ValueHashTable[$Colour] = [int]$Count
    }
    #Add the Rounds to the game list
    $GameValuesList += $ValueHashTable
  }
  #Add the gamelist with its corresponding game number
  $Gamelist[$GameKey] = $GameValuesList
}

#Now that the game lists have been completed, we should verify if they are 
#within the limit

$ValidGames = @()

ForEach ($Game in $GameList.Keys){
  Write-host -foregroundcolor yellow "Iterating $Game"
  :BreakGame ForEach ($Round in $($Gamelist[$game])) {
    Write-host -ForegroundColor blue "Checking Round $($Gameslist[$game].Indexof($Round))"
    ForEach ($Colour in $MaxColours.Keys){
      #If the value corresponding to the colour is greater than the maxvalue
      #break from the game
      If ($Round[$Colour] -gt $MaxColours[$Colour]){
        Write-host -ForegroundColor Red "$Round[$Colour] -gt $MaxColours[$Colour]"
        break BreakGame
      }

      
    }
    #If not broken from the game at his stage, add to list of valid games
    Write-Host -ForegroundColor Green "$Round[$Colour] -le $MaxColours[$Colour]"
    $ValidGames += $Game
  }
}
