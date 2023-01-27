# terraform-tasks
Terraform Task #3  
Create below Resources in us-east-1 region: 
• VPC with 3 public subnets 
• Application Load Balancer 
• Aurora RDS Cluster with 2 DB Instances, for replication 
• Autoscaling Group with minimum 2 X CentOS7 EC2 instances with WordPress installed 
• EC2 instances attached to Load Balancer 
• Route53 DNS CNAME record for Application Load Balancer 
• For all resources, use below tags: 
Project = VPC_Task 
Environment = Test 
Team = DevOps 
Created_by = Your_Name 
 
Output 
DNS name of the Load Balancer 
Route53 DNS record 
 
Note 
- Other resources, Ex. Key Pairs, Security Groups should be added/created as needed 
- Use below as User Data to install WordPress 
#!/bin/bash 
 setenforce 0 
 
yum install httpd -y  
yum install epel-release yum-utils -y 
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y 
yum-config-manager --enable remi-php73 
yum install php php-mysql -y  
systemctl start httpd 
systemctl enable httpd 
 
yum install unzip wget -y 
rm -rf /var/www/html/* 
wget https://wordpress.org/latest.zip 
unzip latest.zip 
mv wordpress/* /var/www/html/ 
chown -R apache:apache /var/www/htm
