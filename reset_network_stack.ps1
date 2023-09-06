# Reset Winsock
Write-Host "Resetting Winsock..."
netsh winsock reset

# Reset TCP/IP stack for both IPv4 and IPv6
Write-Host "Resetting TCP/IP stack for IPv4 and IPv6..."
netsh int ip reset resetlog.txt
netsh int ipv6 reset reset.log

# Reset Winsock catalog
Write-Host "Resetting Winsock catalog..."
netsh winsock reset catalog

# Reset IPv4 and IPv6 configurations and create reset log files
Write-Host "Resetting IPv4 and IPv6 configurations..."
netsh int ipv4 reset reset.log
netsh int ipv6 reset reset.log

# Check if to restart the computer
if ($restartChoice -eq "Yes") {
    Write-Host "Restarting the computer to apply network stack changes..."
    Restart-Computer -Force
} else {
    Write-Host "Network stack changes applied. Please consider restarting your computer later for changes to take full effect."
}
