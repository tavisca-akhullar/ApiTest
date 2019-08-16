FROM mcr.microsoft.com/dotnet/core/aspnet:2.2

WORKDIR app
COPY ApiTest/bin/Release/netcoreapp2.2 .
ENTRYPOINT ["dotnet", "ApiTest.dll"]
