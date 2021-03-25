$rules = Import-Csv .\NSGRules.csv

$NSGs = $rules | Group-Object -Property nsgname
foreach ($NSG in $NSGs) {
    $NSG
    $obj = foreach ($rule in $NSG.Group) {
        [PSCustomObject]@{
            name = $rule.ruleName
            properties = ($rule | Select-Object -Property * -ExcludeProperty nsgName,ruleName)
        }
    }
    $obj | ConvertTo-Json
}
    





<#     [PSCustomObject]@{
        name = $NSG.ruleName
        properties = ($NSG | Select-Object -Property * -ExcludeProperty nsgName,ruleName)
    }
}
$rules | Where-Object {$_.nsgname -eq "NSG1"} | `
ForEach-Object { 
    [PSCustomObject]@{
        name = $_.ruleName
        properties = ($_ | Select-Object -Property * -ExcludeProperty nsgName,ruleName)
    }
} | ConvertTo-Json #>