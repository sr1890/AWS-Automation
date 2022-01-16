import boto3

#aws_mag_con=boto3.session.Session()
iam_con=boto3.resource('iam')

for each_user in iam_con.users.all():
    print(each_user.name)