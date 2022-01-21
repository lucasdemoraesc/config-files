# Gerenciador de pacotes scoop


### Liberar a execução de scripts locais no powershell
````powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
````

### Instalar scoop
````powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
````

### Instalar oh-my-posh
````powershell
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
````