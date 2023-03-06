# App Deployment using Terraform in AWS   

Deploying a Java web application using Terraform on AWS ElasticBeanStalk in a VPC network.   

### Tools/Technology used:      

- Terraform  
- AWS Services: 
    - S3 bucket : To store terraform state file.   
    - RDS : For mysql database   
    - VPC   
    - Amazon MQ (Message Queuing rabbitMQ Server) 
    - ElastiCache (memcached server)
    - ElasticBeanStalk 
    - EC2 

### Terraform file structure   

1. vars.tf : Contains are variable declarations.    
2. backend-s3.tf : S3 bucket configurations.   
3. backend-services.tf : Provision rds, rabbitMQ and Memcache services.   
4. bastion-host.tf : Provision bastion host.  
5. bean-app.tf : ElasticBeanstalk app configuartion.  
6. bean-env.tf :  ElasticBeanstalk environment configuration.    
7. keypairs.tf : Generate keypairs.    
8. providers.tf : Provider configuration.  
9. secgrp.tf : security group configuration.  
10. vpc.tf :  vpc provision configuration.    

### Provisioning and Compiling app 

1. Provision the infrastructrue  

```
terraform init
terraform fmt
terraform validate 
terraform plan
terraform apply
```  

2. Build the application artifact 

close the repository  

```
git clone https://github.com/Ajaytekam/AWSVprofileApp.git
cd AWSVprofileApp/codeRepo
```

Modify application.properties file 

```
vi src/main/resources/application.properties    
```  

* Replace mysql db url with rds instance 
* Replace memcached url with ElastiCache url 
* Replace rabbitMQ url with ActiveMQ url 
* Replace the rabbitMQ port to 5671
* Change rabbitMQ username and password according to vars.tf configuration     

To compile the application you need to install jdk8 and maven or you can use below docker image to build application  

```
docker pull ajaytekam/vprofile-artifact-builder  
```  

Now goto the `AWSVprofileApp/codeRepo` directory and run the container 

```
docker run -it --rm -v $(pwd):/build ajaytekam/vprofile-artifact-builder /bin/bash
cd /build && mvn clean install -DskipTests && exit
```

3. Now goto `ElasticBeanStalk console > Environments > vprofile-bean-prod` 
and upload the artifact file. 

### References :  

Application source repo : https://github.com/Ajaytekam/AWSVprofileApp
