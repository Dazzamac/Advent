$Data = Get-Content C:\users\MCCANND4\Documents\Advent\Day7Input.txt
#$Data
[int64]$i = 25
[int64]$x = 25
[int64]$y = 24
$Stopcount = $data.length


#Loop First Number


Do{
    Do{
        Do {
            If ([int64]$Data[$i-$x] + [int64]$Data[$i-$y] -eq [int64]$Data[$i]) {
                $i ++
                $x = 25
                $y = 24
                #$i
            } Else {
                $Y--
            }
            } While ($y -gt -1)
                $x--
                $y = $x-1

        }While ($x -gt -1)
    $Stopcount--
}While ($stopcount -gt 0)


$data[$i]
#################################################################
#Part 2#
#################################################################

$target = $data[$i]
$sum = @()
$Test = 0

#Loop through adding all subsequnet values to first value
:ForI For ($i = 20; $i -lt $data.count; $i++) {
    $Sum += [int64]$Data[$i]
    Write-Host Write-Host -ForegroundColor Red -BackgroundColor Yellow "Trying " $Data[$i]
    #Start Running Total
    $Test += [int64]$Data[$i]
    #Check that first value is less than target
    If ($sum[0] -lt $target) {
        #Loop subsequnt values
        :ForJ For ($j = $i+1; $j -lt $data.count; $j++){
            #Add next value to array of values
            $Sum += [int64]$data[$j]
            #Add sum of values to running total
            $Test += [int64]$data[$j]
            If ($Test -eq $Target){
                Write-Host -ForegroundColor Red -BackgroundColor Yellow "Found!"
                $Lowest = ($Sum | Sort | Select -First 1)
                $Highest  = ($Sum | Sort | Select -Last 1)
                $Result = $Lowest + $Highest
                Write-Host "Adding"$lowest" and "$Highest" ="$Result
                Break ForI
            }
            If ($Test -gt $Target){
                Write-Host -BackgroundColor Red "Exceeded"
                $Sum = @()
                $Test = 0
                Break ForJ
            } Else {
                Write-Host "Adding "$Data[$j+1]
            }

        }#For J
    } Else {
        Write-Host -BackgroundColor Red "Initial Value Exceeded"
    }
}#For I









   
    

