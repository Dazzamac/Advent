$BoardingCards = Get-content .\Day5Input.txt
$Seats = @()
For ($x = 0; $x -le 7; $x++) {
    $Seats += $x
}
$Rows = @()
For ($x = 0; $x -le 127; $x++) {
    $Rows += $x
}

$Boardingcards | ForEach {
    $BoardingCard = $_.ToCharArray()
    $BoardingCard | ForEach {
        $MidRowIndex = [int](($Rows.Length+1)/2)
        $MidSeatIndex = [int](($Seats.Length+1)/2)
        Switch ($_){
            F {$Rows = <#If($MidrowIndex = 2) {$Rows[0]} Else {#>$Rows[0..($MidRowIndex-1)]}#}
            B {$Rows = $Rows[$MidRowIndex..($Rows.Length-1)]}
            L {$Seats = <#If ($MidseatIndex = 2) {$Seats[0]} Else {#>$Seats[0..($MidSeatIndex-1)]}#}
            R {$Seats =$Seats[$MidSeatIndex..($Seats.Length-1)]}

        }#Switch
        
    }#BoardingCard | ForEach
    $Rows
    $Seats

}#$BoardingCards | ForEach