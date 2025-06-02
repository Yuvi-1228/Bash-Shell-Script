#! bin/bash
<< Task 
Deploy the app and handle the error
Task

# Code Clone from GitHub
code_clone (){
    echo "Cloning code from github..... please wait a minute."
    git clone https://github.com/LondheShubham153/django-notes-app.git

}

#Install requirement or dependencies 
install_requirement(){
    echo "Installing Dependence... Thank you for your patience."
    echo "Installing Docker....."
    sudo apt-get install docker.io -y 
    echo "Successfully install docker. Wait for another installation..."
    echo "Installing nginx...."
    sudo apt-get install nginx -y 
    echo "Successfully install nginx..."
    echo "Congratulation ! Successfully Install Requirement"
    echo "Installing Docker compose"
    sudo apt-get install docker-compose -y 
    echo "Successfully install Docker Compose"
}

# Restart after Installation 
required_restarts(){
    sudo chown $USER /var/run/docker.sock
    #sudo systemctl enable docker 
    #sudo systemctl enable nginx
    #sudo systemctl restart docker
}

# Deploy app 
deploy(){
    docker build -t notes-app .
    #docker run -d -p 8000:8000 notes-app:latest
    docker-compose up -d 
}

echo "*********** Deployment Started*********"
if ! code_clone; then 
    echo "The code directory is already exists"
    cd django-notes-app
fi 
if ! install_requirement; then 
    echo "Installing requirement failed becuase dependencies already exists"
    exit 1
fi 
if ! required_restarts; then
    echo "There is identified error"
    exit 1
fi 
if ! deploy; then
    echo "Deployment Failed, mailing the admin"
    # sendmail
    exit 1
fi

echo "******************* Deployment Successfully*************"