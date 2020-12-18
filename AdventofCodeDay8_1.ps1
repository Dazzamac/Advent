$instruction = @()
$moves | Foreach {
    $obj = New-Object -TypeName PSObject
    $Action, [int]$Jump = $_.split(" ")
    $obj | Add-Member NoteProperty -Name Operation -Value $Action
    $obj | Add-Member Noteproperty -Name Argument -Value $Jump
    $instruction += $obj
    }

[int]$Accumulator = 0
[int]$Jump = 0
$Jumps = @()

Do {
    
    Write-host "Jump"$($Jump+1)          
        Switch ($instruction[$Jump].Operation) {
        nop {$Jump++}
        acc {$Accumulator += $instruction[$jump].Argument; $Jump++}
        jmp {$Jump = $Jump + $instruction[$jump].Argument}
        }
        If ($Jumps.Contains($Jump)) { 
        Write-Host "Stopped at Operation" $instruction[$Jump]
        Write-Host "Operation Number "$Jump
        Write-Host "Accumulator at" $Accumulator

        Break
    } Else {  
        $Jumps += $Jump
    }
    Write-Host "Acc"$Accumulator
    

} While ($Jump -lt $Instruction.count)

$jumps