FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["BeGeneric/BeGeneric.csproj", "BeGeneric/"]
RUN dotnet restore "BeGeneric/BeGeneric.csproj"
COPY . .
WORKDIR "/src/BeGeneric"
RUN dotnet build "BeGeneric.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BeGeneric.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BeGeneric.dll"]