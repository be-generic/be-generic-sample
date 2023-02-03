# Use the official Microsoft SQL Server image as the base image
FROM mcr.microsoft.com/mssql/server:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy the initialization script to the /app directory in the container
COPY ./BeGeneric/sql /app
RUN ls

# Set the environment variable for the SA password
ENV ACCEPT_EULA=Y \
    SA_PASSWORD=Password123


EXPOSE 1433

# Run the initialization script when the container starts
CMD /bin/bash entrypoint.sh & /opt/mssql/bin/sqlservr

