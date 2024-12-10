# FF14_auto_translate_power_shell
自動化漢化腳本
=======================================
step 1 
使用說明 :
## 取得系統當前腳本權限
先用 管理員開啟 powershell 並使用指令 : 
Get-ExecutionPolicy
取得系統當前腳本 如果得到 Restricted

則需要使用指令
Set-ExecutionPolicy Unrestricted 
使用後可以下
Get-ExecutionPolicy
如果回傳 "Unrestricted"
則設定成功

step 2
先用 txt 開啟文件

找到輸入參數區
# winRAR 工具路徑
$winRARPath = "xxxxx\WinRAR.exe"
找到電腦中 WinRAR.exe 路徑並貼上 替換雙引號內部的 xxxxx 位置
例如 :
$winRARPath = "D:\winrar\WinRAR.exe"

# 設定 ff14 安裝路徑
$ff14InstallPath = "xxxxx"
找到 ff14 安裝資料夾 並取得 SquareEnix 資料夾的前綴路徑 替換掉 xxxxx 的內容
例如 :
$ff14InstallPath = "D:\ff14"
