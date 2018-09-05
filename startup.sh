#!bin/bash
set -v

##Get project id from meta-data
PROJECTID=$(curl -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")

# Install logging monitor. The monitor will automatically pick up logs sent to
# syslog.
# [START logging]
curl -s "https://storage.googleapis.com/signals-agents/logging/google-fluentd-install.sh" | bash
service google-fluentd restart &
# [END logging]

# Install dependencies from apt:
apt-get install -yq ca-certificates git nodejs build-essential supervisor

# Install nodejs

mkdir /opt/nodejs
curl https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.gz | tar xvzf - -C /opt/nodejs --strip-components=1
ln -s /opt/nodejs/bin/node /usr/bin/node
ln -s /opt/nodejs/bin/npm /usr/bin/npm

# Clone git
gcloud source repos clone <repo name>  /opt/app --project=$PROJECTID


cd /opt/app/
# Install dependencies
npm install
# Start application in port 80
PORT=80 npm start
