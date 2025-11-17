$html = @"
            <html>
            <head>
            <meta charset="utf-8">
            <title>Services Windows</title>
            <style>
                .running  
		            { 
		            color: green; 
		            }   
                .stopped  
		            { 
		            color: red; 
		            }   
            </style>
            </head>
            <body>
            <h1>Services Windows</h1>
            <table>
	            <!--ROWS-->
            </table>
            </body>
            </html>
"@
$services = Get-Service
$rows = $services | ForEach-Object {
    $class = if ($_.Status -eq "Running") { "running" }
             elseif ($_.Status -eq "Stopped") { "stopped" }
             else { "other" }

    "<tr class=""$class"">
        <td>$($_.Name)</td>
        <td>$($_.DisplayName)</td>
        <td>$($_.Status)</td>
    </tr>"
}

$htmlNewVersion = $html.Replace("<!--ROWS-->", ($rows -join "`n"))
$htmlNewVersion | Set-Content -Path "c:\Ali\servicesSimple.html" -Encoding UTF8