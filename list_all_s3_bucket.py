import boto3 

aws_mag_con=boto3.session.Session()
iam_con=aws_mag_con.resource('s3')

for each_buk in iam_con.buckets.all():
    print(each_buk.name)
