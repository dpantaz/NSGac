$nsgs = Get-AzNetworkSecurityGroup
$array = @()
Foreach ($nsg in $nsgs) {
    $nsgRules = $nsg.SecurityRules
    foreach ($nsgRule in $nsgRules) {
        $obj1 = [PSCustomObject]@{
            NSGName = $nsg.name
            ruleName = $nsgRule.name
            description = $nsgRule.description
            protocol = $nsgrule.protocol
            sourcePortRange = [string]::join(“,”, ($nsgRule.sourcePortRange))
            destinationPortRange = [string]::join(“,”, ($nsgRule.destinationPortRange))
            sourceAddressPrefix = [string]::join(“,”, ($nsgrule.SourceAddressPrefix))
            destinationAddressPrefix = [string]::join(“,”, ($nsgRule.destinationAddressPrefix))
            access = $nsgRule.access
            priority = $nsgRule.priority
            direction = $nsgrule.direction
        }
        $array += $obj1
    }
}
$array | Export-Csv "$exportPath\NSGRules.csv" -NoTypeInformation -Encoding ASCII