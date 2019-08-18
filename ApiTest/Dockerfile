FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base

WORKDIR app/

COPY ApiTest/bin/Release/netcoreapp2.2/ .

ENTRYPOINT ["dotnet", "ApiTest.dll"]
