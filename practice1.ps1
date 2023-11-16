$numbers1 = @(1,2,3)
$numbers2 = @(4,5,6)

$numbers3 += $numbers1[0] + $numbers2[0]
$numbers3 += $numbers1[1] + $numbers2[1]
$numbers3 += $numbers1[2] + $numbers2[2]

#variant2

$numbers3 = @()
$numbers3 = $numbers3 + $el1
$numbers3 = $numbers3 + $el2
$numbers3 += $el3
$numbers3