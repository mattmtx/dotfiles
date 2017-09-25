filter_val="Name=tag:Name,Values="$1
instance_id=$(aws ec2 describe-instances --filter $filter_val --query Reservations[].Instances[].InstanceId --output text)
key_name=$(aws ec2 describe-instances --filter $filter_val --query Reservations[].Instances[].KeyName --output text)
private_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].PrivateIpAddress' --output text)
echo "ssh -i ~/.ssh/"$key_name".pem ubuntu@"$private_ip 

