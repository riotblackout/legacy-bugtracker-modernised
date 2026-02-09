# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2022 AS build
SHELL ["cmd", "/S", "/C"]

WORKDIR C:\src
COPY . .

# Restore packages
RUN nuget restore src\BugTracker.NET.sln

# Build the SOLUTION (not the csproj)
RUN msbuild src\BugTracker.NET.sln /p:Configuration=Release /p:Platform="Any CPU"



# ---------- RUNTIME STAGE ----------
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022
SHELL ["powershell", "-Command", "$ErrorActionPreference='Stop';"]

WORKDIR C:\inetpub\wwwroot
RUN Remove-Item -Recurse -Force * 2>$null

# Copy all website files (aspx, config, etc.)
COPY src\BugTracker.Web\ C:\inetpub\wwwroot\

# 🔥 IMPORTANT: Copy compiled DLLs from build stage
COPY --from=build C:\src\src\BugTracker.Web\bin\ C:\inetpub\wwwroot\bin\



# Ensure required writable folders exist
RUN New-Item -ItemType Directory -Force -Path C:\inetpub\wwwroot\App_Data\logs ; `
    New-Item -ItemType Directory -Force -Path C:\inetpub\wwwroot\App_Data\uploads

EXPOSE 80
