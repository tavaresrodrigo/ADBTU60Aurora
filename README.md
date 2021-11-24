# ADB - Assignment A: Amazon Aurora DB
Amazon Aurora DB is an enterprise relational database engine compatible with MySQL and PostgreSQL. Aurora is provided by AWS (Amazon Web Services) through the Amazon Relational Database Service (RDS) which is a managed service that offers databases in the cloud. With RDS customers transfer the responsibility of maintaining the database underline infrastructure to Amazon, but also assumes the responsibility of their security in the cloud, customer data, applications, platforms, operation systems and server side data encryption.

We are going to use the minimal recommended configuration to deploy an RDS in AWS in a safe mner, and please remember that deploying a Database with public access to the internet is not recommended, it's considered a serious security flaw, the recommended way to expose your database is limiting the endpoint access to consumers inside your VPC, to be able to connect to the database we are going to create an EC2 instance with public access to the internet that will work as a bastion instance. 

![demonstration architecture](img/architecture.png)

Deploying all these resources manually can be tricky, and after completing this demonstration you may want to destroy the entire environment without the need to pick manually resources that you have created before just to avoid undesired charges, for these reasons we are going to use Terraform. Let's define a resource called aws\_db\_instance and name it "default", feel free to go straight tot the [main.tf](terraform/main.tf) and deploy your detabase if you already know how the define the AWS resources in Terraform, if you are just getting started, not problem at all, we will approach each step until you are able to connect to your database in the Cloud. 

First we need to grab the default security group ID in the AWS Management Console VPC.


