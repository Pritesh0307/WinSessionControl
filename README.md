# WinSessionControl

A VB.NET + PowerShell solution to manage Windows user sessions with:

- Auto logout after a set duration
- Toast notifications before logout
- Temporary login restrictions after logout
- Manager password-protected UI

## Setup

1. Install BurntToast:
   ```powershell
   Install-Module -Name BurntToast -Force -Scope AllUsers

