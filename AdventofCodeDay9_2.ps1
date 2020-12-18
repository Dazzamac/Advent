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
#################################################################

$data[$i]


$target = $data[$i]
$sum = @()
$Test = 0
$i = ($data.length -1)
$j = $i-1
Do {

    If ([int64]$data[$i] -lt $target){
        $Sum += [int64]$data[$i]
        Do {
            
            $Sum | ForEach { $Test += $_ }
            If ([int64]$Test -lt $Target){
                $Sum += [int64]$data[$i-$j]
                $j--
                Write-Host "Checking"  $i  "and" $j
            } ElseIf ([int64]$Test -eq $Target) {
                $i
                $j
                break
            } Else {
                
                $Sum = @()
                $Test = 0
                Write-host -fore red -BackgroundColor Yellow "Exceeded"   
                $i--
                $j = $i-1
            }
        } While ($J -gt 0)
    
        
     
     } Else { 
     Write-host -fore red -BackgroundColor Yellow "Exceeded"
     $i--
     $j = $i-1} 
}while ($i -gt -1)

    

    

