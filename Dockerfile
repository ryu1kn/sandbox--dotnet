FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# Copy csproj and restore as separate layers
COPY *.sln ./
COPY src/Bookstore/*.csproj ./src/Bookstore/
COPY test/BookstoreTests/*.csproj ./test/BookstoreTests/
RUN dotnet restore

COPY src/Bookstore/. ./src/Bookstore/
COPY test/BookstoreTests/. ./test/BookstoreTests/
RUN dotnet test

WORKDIR /app/src/Bookstore
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/src/Bookstore/out ./
CMD ["dotnet", "Bookstore.dll"]
