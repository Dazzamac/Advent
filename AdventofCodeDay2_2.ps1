$PassFile = Get-Content .\Day2Input.txt
[int]$GoodCount = 0   
$PassFile | Foreach { 
    $Range, $Char, $Password = $($_.Split(" "))
    $Char = $Char.trim(":")
    #$Password = $($_.Split(" ")[2])

    [int]$Lower,[int]$Upper = $range.Split("-")
    $lower--
    $upper--
    
    $PassArray = $Password.ToCharArray() 
    If ((($PassArray[$lower] -eq $char) -or ($PassArray[$upper] -eq $char)) -and`
     !(($PassArray[$lower] -eq $char) -and ($PassArray[$upper] -eq $char))) { 
       $GoodCount++ 
        }
    
    }

$GoodCount

