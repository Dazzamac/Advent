$Instructions = Get-Clipboard
$Hash = @{}
$i = 0 
[int]$val = 0

$Instructions | ForEach {
    
    $Hash.add($i,$_)
    $i++
}
DO {
    
    $Jump = $hash.$($Val).split(" ")[1]
    $JumpOp = $Jump.Substring(0,1)
    [int]$JumpNum = $Jump.Substring(1,$($Jump.length -1))
    $Jump

    If ($Jump -eq '+0'){
        $val++
        Write-Host "Index"$Val
    } Else {
        Switch ($JumpOp) {
            - {[int]$Val = $($val - $JumpNum)}
            + {[int]$val = $($val + $JumpNum)}
            }
        
        Write-Host "Index"$Val
        }   
        $i++   

} While ($i -lt $Instrucions.length)