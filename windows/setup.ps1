# Inspired by https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7

# Install and configure scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex
scoop bucket add nerd-fonts
scoop bucket add extras
scoop bucket add java

# Install WSL
$wslInstalled = Get-Command "wsl" -CommandType Application -ErrorAction Ignore
if (!$wslInstalled) {
    Write-Verbose -Message "Installing Windows SubSystems for Linux..."
    Start-Process -FilePath "PowerShell" -ArgumentList "wsl","--install" -Verb RunAs -Wait -WindowStyle Hidden
}

$scoop_packages = @(
	# Main
    "busybox",
    "curl",
    "git",
    "go",
    "python",
    "starship",
    "sudo",

    # Extras
    "audacity",
    "discord",
    "firefox",
    "gpu-z",
    "hwinfo",
    # "idea-ultimate",
    "paint.net",
    "rufus",
    "sublime-text",
    "sublime-merge",
    "sysinternals",
    "thunderbird",
    "transmission",
    "windirstat",

    # Fonts
    "FiraCode-NF-Mono",

    # Java
    "java/temurin-lts-jdk"
    )

$winget_packages = @(
    "AgileBits.1Password",
    "Canonical.Ubuntu.2004",
    "EQAditu.AdvancedCombatTracker",
    "goatcorp.XIVLauncher",
    "Google.Chrome",
    "Lexikos.AutoHotkey",
    "Logitech.GHUB",
    "mguessan.davmail",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Microsoft.WindowsTerminal",
    # "Nvidia.CUDA",
    "Nvidia.RTXVoice",
    "PDFsam.PDFsam",
    "ProtonTechnologies.ProtonVPN",
    "RARLab.WinRAR",
    "SumatraPDF.SumatraPDF",
    "Valve.Steam",
    "VideoLAN.VLC",
    "Zoom.Zoom",
    )


foreach ($item in $scoop_packages) {
    scoop install "$item"
}

foreach ($item in $winget_packages) {
    winget install "$item"
}

# Customisations

# Install 7zip context menus
$HOME\scoop\apps\7zip\current\install-context.reg

# Set firefox as default browser
firefox -setDefalutBrowser

# Install sublime text context menu
reg import $HOME\scoop\apps\sublime-text\current\install-context.reg

# DOTFILES SYMLINKS
# =================

Set-Variable -Name DOTHOME -Value $HOME\code\dotfiles

# Powershell profile
mkdir -Force $HOME\Documents\PowerShell
New-Item -ItemType SymbolicLink -Path $HOME\Documents\PowerShell\Profile.ps1 -Value $DOTHOME\mswindows\Profile.ps1

# Use custom scoop-specified profile location for Firefox and Thunderbird
mkdir -Force $HOME\AppData\Roaming\Mozilla\Firefox
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Mozilla\Firefox\profiles.ini -Value $DOTHOME\firefox\firefox-profiles.ini

mkdir -Force $HOME\AppData\Roaming\Thunderbird
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Thunderbird\profiles.ini -Value $DOTHOME\firefox\thunderbird-profiles.ini
