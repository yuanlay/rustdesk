# RustDesk 企业部署脚本

$config = "C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config"

# 创建配置目录
New-Item `
$config `
-ItemType Directory `
-Force


# 复制服务器配置
Copy-Item `
".\RustDesk2.toml" `
"$config\RustDesk2.toml" `
-Force



# 设置无人值守密码

$password="jy888"


Start-Process `
".\rustdesk.exe" `
-ArgumentList "--password $password" `
-Wait



# 安装服务

Start-Process `
".\rustdesk.exe" `
-ArgumentList "--install-service" `
-Wait
