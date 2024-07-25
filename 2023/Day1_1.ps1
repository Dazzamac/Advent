<#The newly-improved calibration document consists of lines of text; 
each line originally contained a specific calibration value that the Elves now 
need to recover. On each line, the calibration value can be found by combining 
the first digit and the last digit (in that order) to form a single two-digit number.

For example:

1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
In this example, the calibration values of these four lines are 12, 38, 15, and 77. 
Adding these together produces 142.

Consider your entire calibration document. What is the sum of all of the calibration values?#>

<#LOGIC
Parse each line extracting only the integer values
Concatenate the first and last integer value on each line to form a two digit number
If there is only one integer it is both first and last
Sum all lines
#>

$Input = Get-Content .\Day1_Inut.txt
[INT]$Total = 0
$Numbers = '0','1','2','3','4','4','5','6','7','8','9'

$Input | ForEach {
    $First = $_[$_.IndexOfAny($Numbers)]
    $Last = $_[$_.LastIndexOfAny($Numbers)]
    $FirstLast = "$First$Last"
    $Total += $FirstLast
}
$Total