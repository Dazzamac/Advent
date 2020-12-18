$data = Get-Content C:\Users\MCCANND4\Documents\Advent\Day10Input.txt | Sort-Object
$data = ([System.int32[]]$data | sort)
$1Jolt = 1
$2Jolt = 1
$3Jolt = 1

For ($i = 1; $i -lt $data.length; $i++){
       $Jump = $data[$i] - $data[$i-1]
       Switch ($Jump) {
        1 { $1Jolt++ }
        2 { $2Jolt++ }
        3 { $3Jolt++ }
       }

}
$Sum = $1Jolt * $3Jolt
$Sum





