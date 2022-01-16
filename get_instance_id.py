import boto3

aws_ec2_cli=boto3.client('ec2')
response = aws_ec2_cli.describe_instances()
for each_instance in response['Reservations']:
    for each_id in each_instance['Instances']:
        print(each_id['InstanceId'])

