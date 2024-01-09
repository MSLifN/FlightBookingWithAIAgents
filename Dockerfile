# Using Python 3.11 slim version as a base image
FROM python:3.11-slim

# Setting an environment variable PORT to 5000
ENV PORT 5000

# Inform Docker that the container is listening on the specified port at runtime
EXPOSE 5000

# Setting the working directory in the Docker image
WORKDIR /usr/src/app

# Copying requirements.txt from local environment to the working directory of docker image
COPY requirements.txt .

# Installing required python packages without storing package cache
RUN pip install --no-cache-dir -r requirements.txt

# Copying the rest of the files from local environment to the working directory of docker image
COPY . .

# Setting python as the entry point 
ENTRYPOINT ["python"]

# Providing default arguments to ENTRYPOINT
CMD ["app.py"]
