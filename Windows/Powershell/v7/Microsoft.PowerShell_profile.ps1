oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/sonicboom_dark.omp.json" | Invoke-Expression
Import-Module PSReadLine

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
}

Clear-Host
