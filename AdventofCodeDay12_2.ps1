$Directions = Get-clipboard | Foreach {
   [pscustomobject]@{Dir=$_.Substring(0,1);Move=[int]$_.Substring(1)}}

#Starting Positions
$x=0
$y=0
#$Heading = 90
$wpx=10
$wpy=1

#$Directions 
For ($i=0; $i -lt $Directions.Count; $i++) {
    Switch ($Directions[$i].Dir){
        F { Write-Host "Forward" ($Directions[$i].Move * $wpx) ($Directions[$i].Move * $wpy)
            $x = $x + ($Directions[$i].Move * $wpx)
            $y = $y + ($Directions[$i].Move * $wpy)}
        N {Write-Host "North"$Directions[$i].Move; $wpy = $wpy + $Directions[$i].Move}
        S {Write-Host "South"$Directions[$i].Move; $wpy = $wpy - $Directions[$i].Move}
        E {Write-Host "East"$Directions[$i].Move; $wpx = $wpx + $Directions[$i].Move}
        W {Write-Host "West"$Directions[$i].Move; $wpx = $wpx - $Directions[$i].Move}
        R {Write-Host "Rotate Right"$Directions[$i].Move
            Switch ($Directions[$i].Move) {
                90 {$Temp = $WPX
                    $WPX = $WPY
                    $WPY = $Temp *-1}
                180 {$WPX = $WPX *-1
                     $WPY = $WPY * -1}
                270 {$Temp = $WPX
                     $WPx = $WPy * -1
                     $WPy = $temp}
            }
            Write-Host "Waypoint now located at "$WPX $WPY
        }        
        
        L {Write-Host "Rotate Left"$Directions[$i].Move
            Switch ($Directions[$i].Move) {
                90 {$Temp = $WPX
                    $WPX = $WPY *-1
                    $WPY = $Temp}
                180 {$WPX = $WPX *-1
                     $WPY = $WPY *-1}
                270 {$Temp = $WPX
                     $WPX = $WPY 
                     $WPY = $Temp *-1 }
            }
            
        
        }
    }
    Write-Host "Ship at" $x $y
    Write-Host "Waypoint at" $wpx $wpy       
    
}#ForEach

