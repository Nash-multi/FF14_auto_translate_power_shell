<h1>自動化漢化腳本</h1>
<h2><b>step 1 </b></h2>
使用說明 : <br>
# 取得系統當前腳本權限 <br>
先用 管理員開啟 powershell 並使用指令 : <br>
Get-ExecutionPolicy <br>
取得系統當前腳本 如果得到 Restricted <br>
<br>
則需要使用指令 <br>
Set-ExecutionPolicy Unrestricted  <br>
使用後可以下 <br>
Get-ExecutionPolicy <br>
如果回傳 "Unrestricted"<br>
則設定成功 <br>
<br>
<h2><b>step 2<b/></h2>
先用 txt 開啟文件<br>
<br>
找到輸入參數區<br>
# winRAR 工具路徑<br>
$winRARPath = "xxxxx\WinRAR.exe"<br>
找到電腦中 WinRAR.exe 路徑並貼上 替換雙引號內部的 xxxxx 位置 <br>
例如 : <br>
$winRARPath = "D:\winrar\WinRAR.exe" <br>
<br>
# 設定 ff14 安裝路徑 <br>
$ff14InstallPath = "xxxxx" <br>
找到 ff14 安裝資料夾 並取得 SquareEnix 資料夾的前綴路徑 替換掉 xxxxx 的內容 <br>
例如 : <br>
$ff14InstallPath = "D:\ff14" <br>
