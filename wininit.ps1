function WindowsTerminalPath([string]$winterm) {
	REG delete HKCU\Environment /F /V $winterm | Out-Null

	$basepath = "$env:USERPROFILE\AppData\Local\Packages"
	$wintermdir = Get-ChildItem $basepath -Recurse | Where-Object { $_.Name -match "WindowsTerminal" }
	$settingsdir = "$basepath\$wintermdir\LocalState"
	
	Write-Output "[$winterm]WindowsTerminal settings path: $settingsdir"
	if (Test-Path -Path $settingsdir) {
		setx $winterm $settingsdir | Out-Null
	}
	else {
		Write-Error -Message "Can't find windows terminal config directory" -RecommendedAction "Make sure windows terminal installed"
	}
}

WindowsTerminalPath("WINTERM")

Set-Variable -Name $env:WSLENV -Value "WINTERM/p" -Force 