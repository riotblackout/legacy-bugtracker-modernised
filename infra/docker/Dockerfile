# BugTracker.NET - Windows IIS container (ASP.NET .NET Framework)
# NOTE: Requires Docker Desktop set to Windows containers.

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference='Stop'; $ProgressPreference='SilentlyContinue';"]

WORKDIR C:/src

# Copy entire repo (or limit later for speed)
COPY . .

# Restore NuGet packages (packages.config-based)
RUN nuget restore .\src\BugTracker.NET.sln

# Build the web project
RUN msbuild .\src\BugTracker.Web\BugTracker.Web.csproj /p:Configuration=Release /p:DeployOnBuild=true /p:WebPublishMethod=FileSystem /p:publishUrl=C:\out


# -----------------------------

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022
SHELL ["powershell", "-Command", "$ErrorActionPreference='Stop'; $ProgressPreference='SilentlyContinue';"]

WORKDIR C:/inetpub/wwwroot

# Clean default IIS site content
RUN Remove-Item -Recurse -Force * 2>$null

# Copy published site from build stage
COPY --from=build C:\out\ .

# Ensure App_Data folders exist
RUN mkdir C:\inetpub\wwwroot\App_Data\logs
RUN mkdir C:\inetpub\wwwroot\App_Data\uploads


EXPOSE 80
