$questions = Get-Content .\Day6Input.txt
$Group =  @()
[int]$Sum = 0

$questions | ForEach {
    If ($_) {
        $Person += $_.ToCharArray()
        $Person | ForEach { If (!($_ -in $Group)) {
            $Group+= $_
        }
        }


    }<#If ($_)#> Else {
        $Sum = $($Sum + $Group.Count)
        $Group = @()
        $Person = @()
    }#Else
}#$questions | ForEach

$Sum