$PPData = Get-content .\Day4Input.txt
$Passport =  @{}
$Valid = 0
$PPCount = 0
$badpass = 0

$PPData | ForEach {
    If ($_){
        $_.Split(" ") | ForEach {
            $Key,$Value = $_.Split(":")
            $Passport.Add($key,$value)
        }    
        
 #Blank Line, reset $Passport variable########        
    } Else {
        
        If ($Passport.byr -and`
         $Passport.iyr -and`
          $Passport.eyr -and`
           $Passport.hgt -and`
            $Passport.hcl -and`
             $Passport.ecl -and`
              $Passport.pid){ 
           
        $Valid ++
        $Passport | Out-File Passport.txt -append

        
        }
        $Passport = @{}
        $PPCount ++
        
    }

        
        
  }

  $Valid
  $badpass
