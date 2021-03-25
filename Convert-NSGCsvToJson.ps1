$rules = Import-Csv .\NSGRules.csv

$NSGs = $rules | Group-Object -Property nsgname
$obj2 = foreach ($NSG in $NSGs) {
    [PSCustomObject]@{
        NSGName = $NSG.Name
        securityRules = @(foreach ($rule in $NSG.Group) {
            [PSCustomObject]@{
                name = $rule.ruleName
                properties = ($rule | Select-Object -Property * -ExcludeProperty nsgName,ruleName)
            }
        })
    
    }
}
$obj2 | ConvertTo-Json -Depth 4 | Out-File ./rules.json