<powershell>
# Install OpenSSH Server if not present
if (-not (Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Server*' | Where-Object State -eq 'Installed')) {
    Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
}

# Ensure SSH service is running and set to auto-start
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service sshd

# Configure SSH to use PowerShell as default shell
#New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

# Restart SSH service to apply changes
#Restart-Service sshd

# Verify installation
#Write-Output "SSH Server Status:"
#Get-Service sshd | Select-Object Name, Status, StartType
#Write-Output "SSH should be accessible on port 22 via AWS Security Group rules"
</powershell>