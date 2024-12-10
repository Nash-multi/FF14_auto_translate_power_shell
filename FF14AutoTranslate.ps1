## 取得系統當前腳本權限
## Get-ExecutionPolicy
## 設定系統當前腳本權限
## Set-ExecutionPolicy Unrestricted 
## 設定權限為無法使用腳本
## Set-ExecutionPolicy Restricted
##
########## 輸入參數區
# winRAR 工具路徑
$winRARPath = "D:\RAR\WinRAR.exe"

# 定義漢化包本地保存路徑
$savePath = ".\"

# 設定 ff14 安裝路徑
$ff14InstallPath = "G:\FF14"

## ff14 替代路徑
############################################
## 使用系統管理員執行
$ScriptFullPath = $MyInvocation.MyCommand.Definition
If(-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
    $arguments = "& '" + $ScriptFullPath + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

$destinationPath = $ff14InstallPath + "\SquareEnix\FINAL FANTASY XIV - A Realm Reborn\game\sqpack\ffxiv\"

# 定義 GitHub API URL
$repo = "GpointChen/FFXIVChnTextPatch-GP"
$apiUrl = "https://api.github.com/repos/$repo/releases/latest"

$response = Invoke-RestMethod -Uri $apiUrl -Headers @{'User-Agent' = 'Powershell'}

$releaseName = $response.name
$releaseBody = $response.body

$rarAsset = $response.assets | Where-Object { $_.name -like "ffxiv-*.rar" }

if ($rarAsset) {
    $rarFileName = $rarAsset.name
    $downloadUrl = $rarAsset.browser_download_url
    Write-Host "發現壓縮檔案: $rarFileName"
    Write-Host "下載連結: $downloadUrl"
    
    $rarFileRoute = $savePath + $rarFileName

    # 下載檔案
    Invoke-WebRequest -Uri $downloadUrl -OutFile $rarFileRoute
    Write-Host "下載完成，檔案已保存至: $savePath" />

    $arguments = "x `"$rarFileRoute`" `"$destinationPath`" -ibck -y"

    Start-Process -FilePath $winRARPath -ArgumentList $arguments -Wait

    Write-Host "檔案已成功解壓縮到: $destinationPath"
    
    Write-Host "#########################################"
    Write-Host ""
    Write-Host "可手動移除漢化包壓縮檔案 : $rarFileRoute "
    Write-Host ""
    Write-Host "#########################################"
    
} else {
    Write-Host "未找到 .rar 檔案。"
}

Read-Host -Prompt "Job Done. Enter to quit"
