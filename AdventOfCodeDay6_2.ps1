$questions = Get-Content .\Day6Input.txt -Delimiter "`n`n"
$Group =  @()
[int]$Sum = 0
$i = 0


$questions | ForEach {
    If ($_) {
        $Personcount ++
        @($_.split("") | 
        Where-Object {$_ -match "."} | 
        Group-Object | 
        Where-Object {$_.count -ge $Personcount}
        ).count
        
        <#$Person += $_.ToCharArray()
        $Person | ForEach { If (!($_ -in $Group)) {
            $Group+= $_
        }
        }@#>


    }<#If ($_)#> Else {
        $Sum = $($Sum + $Group.Count)
        $Group = @()
        $Person = @()
        $i = 0
    }#Else
} | Measure-Object -sum #$questions | ForEach

$Sum