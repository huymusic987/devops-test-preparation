#!/bin/bash

yum install -y docker

systemctl daemon-reload

systemctl enable docker

systemctl start docker

useradd DockerAdmin

usermod -aG docker DockerAdmin

nano /etc/ssh/sshd_config

PasswordAuthentication yes

service sshd reload

nano Dockerfile

FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps

docker kill $(docker ps -q)
docker system prune

docker build -t my-image-name:tag .

docker run -d --name container-name -p ec2-port:container-port image-name

# Change to the dockeradmin user's home directory where the Dockerfile and .war file are
cd /home/DockerAdmin
# Create a named volume for persistent logs. The '|| true' prevents an error if it already exists.
docker volume create my-app-logs || true
# Build a new version of the image
docker build -t tomcat-image .
# Stop and remove the old container if it exists, to free up the name
docker stop tomcat-container || true
docker rm tomcat-container || true
# Run the new container, mapping the volume to the logs directory

docker run -d --name tomcat-container -p 8080:8080 \
-v my-app-logs:/usr/local/tomcat/logs \
tomcat:v3

<%-- Add this logging code --%>
<%@ page import=
"java.io.
*
, java.util.Date, java.text.SimpleDateFormat" %>
<%
try {
// Define the path for the log file inside the container
String logDirPath =
"/usr/local/tomcat/logs";
String logFilePath = logDirPath + "/app.log";
// Ensure the log directory exists
File logDir = new File(logDirPath);
if (!logDir.exists()) {
logDir.mkdirs();
}
// Open the log file in append mode (the 'true' flag)
PrintWriter outLog = new PrintWriter(new FileWriter(logFilePath, true));
// Create a timestamp
String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
// Write the log entry
outLog.println(timestamp + "
- Page accessed by a user.
");
// IMPORTANT: Close the writer to save the changes
outLog.close();
} catch (IOException e) {
// Basic error handling
e.printStackTrace();
}
%>
<p style=
"color: green;"><b>A new log entry was just added to
/usr/local/tomcat/logs/app.log!</b></p>


# Download the latest version of Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Make the downloaded file executable
sudo chmod +x /usr/local/bin/docker-compose

# Confirm installation
docker-compose --version