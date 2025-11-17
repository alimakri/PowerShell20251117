$services = Get-Service

# foreach($service in $services)
# {
#     if ($service.Status -eq "Running")
#     {
#         Write-host $service.name -ForegroundColor green
#     }
#     else
#     {
#         Write-host $service.name -ForegroundColor red
#     }
# }

# for($index=0;$index -lt $services.Count-1;$index++)
# {
#     if ($services[$index].Status -eq "Running")
#     {
#         Write-host $services[$index].name -ForegroundColor green
#     }
#     else
#     {
#         Write-host $services[$index].name -ForegroundColor red
#     }
# }

$index=0;
while($index -lt $services.Count-1)
{
     if ($services[$index].Status -eq "Running")
     {
         Write-host $index, $services[$index].name -ForegroundColor green
     }
     else
     {
         Write-host $index, $services[$index].name -ForegroundColor red
     }
     $index++
}