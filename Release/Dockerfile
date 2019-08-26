FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
ENV Solution_Name="ApiTest.dll"
ADD publish app
WORKDIR /app
COPY . Release/publish/ 
ENTRYPOINT ["dotnet", "/app/${Solution_Name}"]