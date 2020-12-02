$PassFile = Get-Content .\Day2Input.txt
[int]$GoodCount = 0   
$PassFile | Foreach { 
    $Range = $($_.Split(" ")[0])
    $Char = $(($_.Split(" ")[1]).trim(":"))
    $Password = $($_.Split(" ")[2])

    [int]$Lower,[int]$Upper = $range.Split("-")
    $CharCount = ($Password.ToCharArray() | Where-Object {$_ -eq $Char} | Measure-Object).Count
    If ($Charcount -ge $Lower -and $charcount -le $upper) {
        $GoodCount++
        }
    }

$GoodCount

