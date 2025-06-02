#! bin/bash

#Slag for Error-Handling 
set -euo pipefail

# Check whether it is install or not 
check_awscli(){
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. You have to install it." >&2
        #exit 1
        return 1
    fi
}

# Download and Install AWS CLI 
install_awscli(){
    echo "Installing AWS CLI on your system. Please wait a minute..."

    # Download and Install AWS CLI v2
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt-get install unzip -y &> /dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install

    # Verify AWS CLI Installation 
    aws --version

    # Clean up 
    rm -rf awscliv2.zip ./aws
}

# 
state_of_instance(){
    local instance_id="$1"
    echo "Please wait for instance $instance_id to be in running state..."

    while true; do 
        state= $(aws ec2 describe-instances --instance-ids "instance_id" --query 'Reservations[0].Instance[0].State.Name' --output text)
            if [[ "$State" == "running" ]]; then
                echo "Bravo ! your instance is $instance_id is ready to work"
                break
            fi 
            sleep 10 
    done
}

# Create EC2 Instances
create_ec2(){
    local ami_id="$1"
    local instance_type="$2"
    local key_name="$3"
    local subnet_id="$4"
    local security_group_ids="$5"
    local instance_name="$6"

    # Run AWS CLI command to create EC2 Instance 
    instance_id=$(aws ec2 run-instances \
    --image-id "$ami_id" \
    --instance-type "$instance_type" \
    --key-name "$key_name" \
    --subnet-id "$subnet_id" \
    --security-group-ids "$security_group_ids" \
    --tag-specifications "ResourceType= instance, Tags= [{Key=Name, Value=$instance_name}]" \
    --query 'Instance[0].InstanceID' \ 
    --output text
    )
    if [[ -z "$instance_id" ]]; then 
        echo "Failed to create instance." >&2 
        exit 1
    fi 
        echo "Congratulation your instance $instance_id created successfully."

    # Wait for the instance to be in running state
    state_of_instance "$instance_id"
}

main(){
    #check_awscli || install_awscli
    if ! check_awscli; then 
    install_awscli || exit 1
    fi

    echo "Creating EC2 Instance....."

    # Specify the parameter to create a EC2 instances 
    AMI_ID= ""  # Add your ami id 
    INSTANCE_TYPE= "t2.micro" # add yoru instance type 
    KEY_NAME= "" # add key pair 
    SUBNET_ID= "" # add subnet id 
    SECURITY_GROUP_IDS= ""  # Add your security group id sperated by space
    INSTANCE_NAME= "EC2-FROM-SHELL" # Add your instance name 

    # Call the function to create EC2 instances 
    create_ec2 "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SUBNET_ID" "$SECURITY_GROUP_IDS" "$INSTANCE_NAME"

    echo "Successfully completed EC2 created"
}

# Call main fuction with unlimited argument 
main "$@"
