FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /App

# Copy everyting
COPY . ./

#restore and distinct layer
RUN dotnet restore

#Build and publish a release
RUN dotnet publish -o out

#build runtime images
FROM mcr.microsoft.com/dotnet/aspnet:6.0 
WORKDIR /App
COPY --from=build /App/out .

#Tells ASP.NET which port to listen on
ENV ASPNETCORE_URLS=http://+:5000

#Documentation/metadata for image || Not Actually controls listening
EXPOSE 5000

#Run dotnet app
ENTRYPOINT ["dotnet", "MinApiExample.dll"]
