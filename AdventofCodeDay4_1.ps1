$PPData = Get-content .\Day4Input.txt
$Passport =  @{}
$Valid = 0


$PPData | ForEach {#Iterate each line
    If ($_){#Check if line is blank or not
        $_.Split(" ") | ForEach { #Separate each item field and iterate
            $Key,$Value = $_.Split(":")#Create Keypairs
            $Passport.Add($key,$value)#Add keypairs to hash
        }
        If (($Passport.Count -eq 7 -and !($Passport.CID)) -or ($Passport.count -eq 8)){ #Check if all data is complete or at least only CID is missing
        $Valid ++ #Update valid count
        $Passport | out-file pass.txt -append #Add valid passport data to file for troubleshooting and verification
        
        }  
        
 #########Blank Line, reset $Passport variable########        
    } Else {
                
        $Passport = @{}
               
    }

        
        
  }

  $Valid # Return result
  
  If ($Passport.byr -and $Passport.iyr -and $Passport.eyr -and $Passport.hgt -and $Passport.hcl -and $Passport.ecl -and $Passport.pid <#-and $passport.cid#>){ 
        $Valid ++

        
        }  
