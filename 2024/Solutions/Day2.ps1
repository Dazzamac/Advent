<#The unusual data (your puzzle input) consists of many reports, one report per line. 
Each report is a list of numbers called levels that are separated by spaces. 
For example:

7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
This example data contains six reports each containing five levels.

The engineers are trying to figure out which reports are safe. 
The Red-Nosed reactor safety systems can only tolerate levels that are either gradually
 increasing or gradually decreasing. So, a report only counts as safe if both of the 
 following are true:

The levels are either all increasing or all decreasing.
Any two adjacent levels differ by at least one and at most three.
In the example above, the reports can be found safe or unsafe by checking those rules:

7 6 4 2 1: Safe because the levels are all decreasing by 1 or 2.
1 2 7 8 9: Unsafe because 2 7 is an increase of 5.
9 7 6 2 1: Unsafe because 6 2 is a decrease of 4.
1 3 2 4 5: Unsafe because 1 3 is increasing but 3 2 is decreasing.
8 6 4 4 1: Unsafe because 4 4 is neither an increase or a decrease.
1 3 6 7 9: Safe because the levels are all increasing by 1, 2, or 3.
So, in this example, 2 reports are safe.

Analyze the unusual data from the engineers. How many reports are safe?#>

# Load input data from a file
$Inputs = Get-Content "./Inputs/Day2.txt"

# Initialize a count of safe reports
$SafeCount = 0

# Iterate the reports
ForEach ($Report in $Inputs) {
    $Values = $Report -split '\s+' | ForEach-Object { [int]$_}
    # Test 1: Any two adjacent levels differ at least one and less than 3
    $Safe = $true
    For ($i=0;$i -lt ($Values.count -1); $i++){
        $Difference = [math]::Abs($Values[$i] - $Values[$i+1])
        #$Difference
        If ($Difference -lt 1 -or $Difference -gt 3){
            $Safe = $false
            break
        }
    }
    # Test 2: Check that values are increasing or decreasing
    If ($Safe){
        Write-Verbose "Test 1 Complete"

        # Initialize flags to check for ascending or descending order
        $Descending = $true
        $Ascending = $true


        For ($i=0;$i -lt ($Values.count -1); $i++){
            # Check if the current number is greater than the next one (for descending order)
            If ($Values[$i] -gt $Values[$i+1]){
                $Ascending = $false
            }
            # Check if the current number is less than the next one (for ascending order)
            if ($Values[$i] -lt $Values[$i + 1]) {
                $Descending = $false
            }
        }
        # Output the result based on the flags
        if ($Ascending) {
            Write-Verbose "Test 2 Complete: Ascending"
            $SafeCount++
        } elseif ($Descending) {
            Write-Verbose "Test 2 Complete: Descending"
            $SafeCount++
        } else {
            Write-Verbose "Test 2 Failed: Not in order"
            $Safe = $False
        }
    } Else {
        Write-Verbose "Test 1 Failed: Increments too large"
    }
    
}

Write-Host "Total number of safe reports is: $Safecount"

#########################################################################################
#######################################Part 2############################################
#########################################################################################
