# ADB - Assignment A: Amazon Aurora DB
Amazon Aurora DB is an enterprise relational database engine compatible with MySQL and PostgreSQL. Aurora is provided by AWS (Amazon Web Services) through the Amazon Relational Database Service (RDS) which is a managed service that offers databases in the cloud. With RDS customers transfer the responsibility of maintaining the database underline infrastructure to Amazon, but also assumes the responsibility of their security in the cloud, customer data, applications, platforms, operation systems and server side data encryption.

We are going to use the minimal recommended configuration to deploy an RDS in AWS in a safe mner, and please remember that deploying a Database with public access to the internet is not recommended, it's considered a serious security flaw, the recommended way to expose your database is limiting the endpoint access to consumers inside your VPC, to be able to connect to the database we are going to create an EC2 instance with public access to the internet that will work as a bastion instance. 

![demonstration architecture](img/archlitecture.png)


Deploying all these resources manually can be tricky, and after completing this demonstration you might want to destroy the entire environment without the need to pick manually resources that you have created before to avoid undesired charges, for these reasons we are going to use Terraform
