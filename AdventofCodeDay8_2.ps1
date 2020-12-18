$moves=Get-Clipboard
$instruction = @()
$moves | Foreach {
    $obj = New-Object -TypeName PSObject
    $Action, [int]$Jump = $_.split(" ")
    $obj | Add-Member NoteProperty -Name Operation -Value $Action
    $obj | Add-Member Noteproperty -Name Argument -Value $Jump
    $instruction += $obj
    }

Function Invoke-Instructions {
[int]$Accumulator = 0
[int]$Jump = 0
$Jumps = @()


Do {
    
    #Write-host "Jump"$($Jump+1)          
        Switch ($instruction[$Jump].Operation) {
        nop {$PreJump = $Jump; $Jump++}
        acc {$PreJump = $Jump; $Accumulator += $instruction[$jump].Argument; $Jump++}
        jmp {$PreJump = $Jump; $Jump = $Jump + $instruction[$jump].Argument}
        }
        If ($Jumps.Contains($Jump)) { 
            #Write-Host "Stopped at Operation" $instruction[$Jump]
            #Write-Host "Operation Number "$Jump
            #Write-Host "Accumulator at" $Accumulator
            #Write-Host "The previous operation was" $Prejump $instruction[$PreJump]

        Break
        } Else {  
            $Jumps += $Jump
    }
    #Write-Host "Acc"$Accumulator
    

} While ($Jump -lt $Instruction.count)
If ($Jump -eq 647) {
Return $Accumulator
}
}

Function Switch-Instruction{
    param (
        $i)
        If($instruction[$i].Operation -eq "jmp"){
            $instruction[$i].Operation = "nop"
        } ElseIf ($instruction[$i].Operation -eq "nop"){
            $instruction[$i].Operation = "jmp"
        }
            
}

For ($i=0;$i -le $Instruction.count; $i++){
    Switch-Instruction $i
    $acc = Invoke-Instructions
    If($Acc){
        $acc
        break
        }
        Switch-Instruction $i
    }

    $acc