FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ApiTest/*.csproj ./ApiTest/
WORKDIR /app/ApiTest
RUN dotnet restore

# copy and publish app and libraries
WORKDIR /app/
COPY ApiTest/. ./ApiTest/
WORKDIR /app/ApiTest
RUN dotnet publish -c Release -o out


# test application -- see: dotnet-docker-unit-testing.md
FROM build AS testrunner
WORKDIR /app/tests
COPY tests/. .
ENTRYPOINT ["dotnet", "test", "--logger:trx"]


FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/dotnetapp/out ./
ENTRYPOINT ["dotnet", "ApiTest.dll"]
