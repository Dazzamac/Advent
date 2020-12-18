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

    

    

