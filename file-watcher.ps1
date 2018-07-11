$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = ".\pandoc-input\"
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true  

$action = { $path = $Event.SourceEventArgs.FullPath
    $changeType = $Event.SourceEventArgs.ChangeType
    $date = Get-Date -Format d.M.yyyy
                
				$dateiname = (Get-Item $path).BaseName
				$output = ".\pandoc-output\" + $dateiname + ".html"
               
				If ( $dateiname.startswith("job-application-") ) {
        #Add-content "..\log.txt" -value $dateiname
        pandoc $path -o $output --template=./pandoc-templates/job-application.html --metadata date=$date
				}	
}   

Register-ObjectEvent $watcher "Created" -Action $action
Register-ObjectEvent $watcher "Changed" -Action $action
Register-ObjectEvent $watcher "Renamed" -Action $action
while ($true) {sleep 1}
PAUSE