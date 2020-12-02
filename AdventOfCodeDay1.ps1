#Get source data
$DATA = Get-Content C:\Users\mccan\Desktop\Advent\Puzzle1Input.txt

#Initialise variables
[int]$x = 0
[int]$y = 1
[int]$z = 2
Remove-variable values

#Loop First number of array
    Do {
        Write-host -ForegroundColor Yellow "Trying $($data[$x])"

        #Loop second number to add to
          Do {
            #Write-Host -ForegroundColor Green "Trying $($data[$x]) and $($Data[$y])"

            Do {
                #Write-Host -ForegroundColor Green "Trying $($data[$x]) and $($Data[$y]) and $($data[$z])"
                #Test if sum is 2020
                If ( [int]$Data[$x] + [int]$data[$y] + [int]$Data[$z] -eq 2020) {
            
                    Write-host "The values are $($data[$x]) and $($data[$y]) and $($Data[$z])"
                    [int]$1 = $($data[$x])
                    [int]$2 = $($data[$y])
                    [int]$3 = $($data[$z])
                    $Values = $($1*$2*$3)
                    return $Values
                    break

                    } else {
                    
                        $z++
                
                        }
                        } while ($z -lt $Data.length)
                        If ($Values -eq $null) {
                        $y++ 
                        [int]$z = $($y + 1)} else {
                        break
                    }
                    } while ($y -lt $data.length)
                If ($Values -eq $null) {
                    $x++ 
                    [int]$y = $($x + 1)} else {
                    break
                    }
        } While ($x -lt $data.length)
