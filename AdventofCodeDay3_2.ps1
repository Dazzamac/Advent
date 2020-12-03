$Toboggan = Get-Content .\Day3Input.txt
$Width = ($Toboggan[0].ToCharArray()).Length
[int]$Route1TreeCount = 0
[int]$Route2TreeCount = 0
[int]$Route3TreeCount = 0
[int]$Route4TreeCount = 0
[int]$Route5TreeCount = 0


For ($Route = 1; $Route -le 5; $Route++) {
    [int]$Y = 0
    [int]$X = 0
    Switch ($Route) {
        1 {$YRoute = 1; $XRoute = 1}
        2 {$YRoute = 3; $XRoute = 1}
        3 {$YRoute = 5; $XRoute = 1}
        4 {$YRoute = 7; $XRoute = 1}
        5 {$YRoute = 1; $XRoute = 2}
    }

    Do {
        #Move forward a row
        $Y = $Y + $YRoute
        $X = $X + $XRoute
        #Assume jump left to start when end of row is reached
        Switch ($Y) {
            31 {$Y = 0}
            32 {$Y = 1}
            33 {$y = 2}
            34 {$Y = 3}
            35 {$Y = 4}
            36 {$Y = 5}
            37 {$Y = 6}
            default {}
        }

        #Start Sledding!
        $ToboRow = $Toboggan[$X].ToCharArray()
        IF ($ToboRow[$Y] -eq '#') {
            Switch ($Route) {
                1 {$Route1TreeCount++}
                2 {$Route2TreeCount++}
                3 {$Route3TreeCount++}
                4 {$Route4TreeCount++}
                5 {$Route5TreeCount++}
            }
        }
    


    } While ($X -lt ($Toboggan.Length -1))
}

$Route1TreeCount
$Route2TreeCount
$Route3TreeCount
$Route4TreeCount
$Route5TreeCount

$Total = $Route1TreeCount * $Route2TreeCount * $Route3TreeCount * $Route4TreeCount * $Route5TreeCount
$Total
