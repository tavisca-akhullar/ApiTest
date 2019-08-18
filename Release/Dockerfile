FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
ADD publish app
WORKDIR /app
ENTRYPOINT ["dotnet", "/app/ApiTest.dll"]
