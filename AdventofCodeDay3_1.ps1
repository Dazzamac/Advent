﻿$Toboggan = Get-Content .\Day3Input.txt
$Width = ($Toboggan[0].ToCharArray()).Length
[int]$TreeCount = 0
[int]$Y = 0
[int]$X = 0

Do {
    #Move forward a row
    $Y = $Y + 3
    $X = $X + 1
    #Assume jump left to start when end of row is reached
    Switch ($Y) {
        31 {$Y = 0}
        32 {$Y = 1}
        33 {$y = 2}
        default {}
    }

    #Start Sledding!
    $ToboRow = $Toboggan[$X].ToCharArray()
    IF ($ToboRow[$Y] -eq '#') {
        $Treecount++
    }
    


} While ($X -lt ($Toboggan.Length -1))

$TreeCount

