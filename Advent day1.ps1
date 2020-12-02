#Get source data
$DATA = Get-Content C:\Users\mccan\Desktop\Advent\Puzzle1Input.txt

#Initialise variables
[int]$x = 0
[int]$y = 1
Remove-variable values

#Loop First number of array
    Do {
        Write-host -ForegroundColor Yellow "Trying $($data[$x])"

        #Loop second number to add to
          Do {

            #Test if sum is 2020
            If ( [int]$Data[$x] + [int]$data[$y] -eq 2020) {
            
                Write-host "The values are $($data[$x]) and $($data[$y])"
                [int]$1 = $($data[$x])
                [int]$2 = $($data[$y])
                $Values = $($1*$2)
                return $Values
                break

                } else {
                    
                    $y++
                
                    }
                } while ($y -lt $data.length)
                If ($Values -eq $null) {
                    $x++ 
                    [int]$y = $($x + 1)} else {
                    break
                    }
        } While ($x -lt $data.length)
