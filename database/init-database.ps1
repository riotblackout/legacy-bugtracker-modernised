param (
    [string]$Server = "localhost,1433",
    [string]$User = "btnet_user",
    [string]$Password = "Btnet123!",
    [string]$Database = "btnet"
)

Write-Host "Creating database if not exists..."

sqlcmd -S $Server -U $User -P $Password -Q "
IF DB_ID('$Database') IS NULL
BEGIN
    CREATE DATABASE [$Database]
END
"

Write-Host "Applying schema..."

Get-ChildItem "src\BugTracker.Database\dbo\Tables\*.sql" |
ForEach-Object {
    sqlcmd -S $Server -U $User -P $Password -d $Database -i $_.FullName
}

Write-Host "Database initialised successfully."
