$Directions = Get-clipboard | Foreach {
   [pscustomobject]@{Dir=$_.Substring(0,1);Move=[int]$_.Substring(1)}}

#Starting Positions
$x=0
$y=0
$Heading = 90

#$Directions 
For ($i=0; $i -lt $Directions.Count; $i++) {
    Switch ($Directions[$i].Dir){
        F { Write-Host "Forward" ;Switch ($Heading){
                90 {Write-Host "East" $Directions[$i].Move; $x = $x + $Directions[$i].Move}
                270 {Write-Host "West" $Directions[$i].Move; $x = $x - $Directions[$i].Move}
                0 {Write-Host "North" $Directions[$i].Move; $y = $y + $Directions[$i].Move}
                180 {Write-Host "South" $Directions[$i].Move; $y = $y - $Directions[$i].Move}}}
        N {Write-Host "North"$Directions[$i].Move; $y = $y + $Directions[$i].Move}
        S {Write-Host "South"$Directions[$i].Move; $y = $y - $Directions[$i].Move}
        E {Write-Host "East"$Directions[$i].Move; $x = $x + $Directions[$i].Move}
        W {Write-Host "West"$Directions[$i].Move; $x = $x - $Directions[$i].Move}
        R {Write-Host "Rotate Right"; $Heading = $Heading + $Directions[$i].Move
            If ($Heading -ge 360) {
                $Heading = $Heading - 360}
           Write-Host "New Heading" $Heading}
        L {Write-Host "Rotate Left"; $Heading = $Heading - $Directions[$i].Move
            If ($Heading -lt 0) {
                $Heading = $Heading + 360}
           Write-Host "New Heading" $Heading}
    }
    $x
    $y        
    
}#ForEach

