
$objectArr = @()
$AllSubs = @(Get-AzureRmSubscription | Select -ExpandProperty SubscriptionName)
$Date = Get-Date -Format d
foreach ($SubName in $AllSubs) {
Select-AzureRmSubscription -SubscriptionName $SubName
$AllOfResourceType = (find-AzureRmResource | Where {$_.ResourceType -eq "Microsoft.Web/sites"})

foreach ($ResourceType in $AllOfResourceType) {


    $prop = [ordered]@{
        'SubscriptionName' = $subname
        'Name' = $ResourceType.Name
        'ResourceType' = $ResourceType.ResourceType
        'Date' = $Date
        }
 $obj = New-Object -Type PSCustomObject -Property $prop
 $objectArr += $obj

 }
 }
  $objectArr

$objectArr | Export-Csv C:\Temp\websites.csv -NoTypeInformation
