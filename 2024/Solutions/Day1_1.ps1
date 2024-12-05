<#Maybe you can help The Historians reconcile their lists?

For example:

3   4
4   3
2   5
1   3
3   9
3   3
Maybe the lists are only off by a small amount! To find out, pair up the numbers and measure how far apart they are. Pair up the smallest number in the left list with the smallest number in the right list, then the second-smallest left number with the second-smallest right number, and so on.

Within each pair, figure out how far apart the two numbers are; you'll need to add up all of those distances. For example, if you pair up a 3 from the left list with a 7 from the right list, the distance apart is 4; if you pair up a 9 with a 3, the distance apart is 6.

In the example list above, the pairs and distances would be as follows:

The smallest number in the left list is 1, and the smallest number in the right list is 3. The distance between them is 2.
The second-smallest number in the left list is 2, and the second-smallest number in the right list is another 3. The distance between them is 1.
The third-smallest number in both lists is 3, so the distance between them is 0.
The next numbers to pair up are 3 and 4, a distance of 1.
The fifth-smallest numbers in each list are 3 and 5, a distance of 2.
Finally, the largest number in the left list is 4, while the largest number in the right list is 9; these are a distance 5 apart.
To find the total distance between the left list and the right list, add up the distances between all of the pairs you found. In the example above, this is 2 + 1 + 0 + 1 + 2 + 5, a total distance of 11!

Your actual left and right lists contain many location IDs. What is the total distance between your lists?#>

# Load input data from a file
$Inputs = Get-Content "./Inputs/Day1.txt"

# Initialize arrays to store numbers from the input
$Left = @()
$Right = @()

# Initialize a variable to hold the total sum of differences
$Total = 0

# Process each line from the input
ForEach ($Input in $Inputs) {
    # Split the line into two numbers, cast to integers, and add to respective arrays
    $Left += [int]($Input -split '\s+')[0]
    $Right += [int]($Input -split '\s+')[1]
}

# Sort the arrays in ascending order
$OrderedLeft = $Left | Sort-Object
$OrderedRight = $Right | Sort-Object

# Calculate the absolute differences between corresponding elements in the sorted arrays
For ($i = 0; $i -lt $OrderedLeft.Count; $i++) {
    # Find the difference and ensure it's positive
    $Sum = [math]::Abs($OrderedLeft[$i] - $OrderedRight[$i])
    
    # Add the difference to the running total
    $Total += $Sum
}

# Output the final total
$Total


#########################################################################################
#######################################Part 2############################################
#########################################################################################
<#Calculate the total similarity score by adding up each number on the left after 
multiplying it by the number of times it appears on the right#>
# Initialize an array to store similarity values for each unique number
$SimilarityValues = @()

# For each value in the $Left array
ForEach ($Value in $Left) {
    # Count the number of times the current value appears in the $Right array
    $Count = ($Right | Where-Object { $_ -eq $Value } | Measure-Object).Count
    
    # Multiply the value by its count and add the result to similarity values
    $Sum = $Count * $Value
    $SimilarityValues += $Sum
}

# Calculate the total similarity score by summing all similarity values
($SimilarityValues | Measure-Object -Sum).Sum