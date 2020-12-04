$PPData = Get-content .\Day4Input.txt
$Passport =  @{}
$Valid = 0
$PPCount = 0

$PPData | ForEach {
    If ($_){
        $_.Split(" ") | ForEach {
            $Key,$Value = $_.Split(":")
            $Passport.Add($key,$value)
        }
        If (($Passport.Count -eq 7 -and !($Passport.CID)) -or ($Passport.count -eq 8)){ 
        $Valid ++
        $Passport | out-file pass.txt -append
        
        }  
        
 #Blank Line, reset $Passport variable########        
    } Else {
        #If ($PPCount -gt 100) {Break}
        
        $Passport = @{}
        $PPCount ++
        
    }

        
        
  }

  $Valid
