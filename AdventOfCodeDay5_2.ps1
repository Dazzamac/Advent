
$BoardingCards = Get-content .\Day5Input.txt
$HighseatID = 0
$Allseats = @()


$Boardingcards | ForEach {
    $BoardingCard = $_.ToCharArray()
    $Seats = @()
    For ($x = 0; $x -le 7; $x++) {
        $Seats += $x
    }
    $Rows = @()
    For ($x = 0; $x -le 127; $x++) {
        $Rows += $x
    }
    $BoardingCard | ForEach {
        
        $MidRowIndex = [int](($Rows.Length+1)/2)
        $MidSeatIndex = [int](($Seats.Length+1)/2)
        Switch ($_){
            F {$Rows = $Rows[0..(([Math]::Floor($Rows.count)/2)-1)]}
            B {$Rows = $Rows[([Math]::Ceiling($Rows.count/2))..($Rows.count-1)]}
            L {$Seats = $Seats[0..(([Math]::Floor($Seats.count)/2)-1)]}
            R {$Seats =$Seats[([Math]::Ceiling($Seats.count/2))..($Seats.Count-1)]}

        }#Switch

    }#BoardingCard | ForEach
    #$Rows
    #$Seats
    $SeatID = ($($Rows) * 8 + $($Seats))
    #$seatID
    $HighseatID = ([Math]::Max($SeatID,$HighseatID))
    #$HighseatID
    $AllSeats += $SeatID

}#$BoardingCards | ForEach 
Write-Host "High Seat ID="$HighseatID
$AllSeats = ($Allseats | Sort)

For ($i=1;$i -lt $Allseats.Count; $i++){
    If (!($Allseats[$i] -eq ($Allseats[$i -1]+1))){
        If (($Allseats[$i] -1) -eq ($Allseats[$i-1]+1)){
            Write-Host 'Seat '$($Allseats[$i]-1)
            }

        
    }
}