function WindowsTerminalPath {
	Write-Output "Install WINTERM variable"
	$basepath = "$env:USERPROFILE\AppData\Local\Packages"
	Write-Output "Base path: $basepath"
	$wintermdir = Get-ChildItem $basepath -Recurse | Where-Object { $_.Name -match "WindowsTerminal" }
	Write-Output "WindowsTerminal dir: $wintermdir"
	$settingsdir = "$basepath\$wintermdir\LocalState"
	Write-Output "WindowsTerminal settings path: $settingsdir"
	if (Test-Path -Path $settingsdir) {
		setx WINTERM $settingsdir | Out-Null
	}
	else {
		Write-Error -Message "Can't find windows terminal config directory" -RecommendedAction "Make sure windows terminal installed"
	}
}

WindowsTerminalPath