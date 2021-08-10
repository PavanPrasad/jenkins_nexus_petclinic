# jenkins_nexus_petclinic
Configure a Jenkins job to create dockerized build of java application and push the same to nexus repository.

## Setup a Jenkins job
Here I have used a freestyle project.
![jenkins1](https://user-images.githubusercontent.com/12725846/128854425-70a28bdb-5b0d-43ef-b723-58c1e3eb42bc.png)

```
cd /opt/jenkins/workspace/pavan-project/
git clone http://pawan@git.ndzhome.com/pawan/pavan1stproject.git
cd pavan1stproject
./mvnw package
````
Now the jar file is created. Now we need to build the docker image, for that run below script in jenkins build area
``
sudo docker build -t pavan_project .
``
if incase your application needs to run and not to push to nexus##
``
#sudo docker run -d -p 8070:8070 --name pavan_container pavan_project - 
``

## Create user in nexus with username and a password
![3](https://user-images.githubusercontent.com/12725846/128856184-cf20b4b2-60ec-4875-9d69-579fac107bca.png)

## Now create a repository in-order to push the jar file to nexus repository
![2](https://user-images.githubusercontent.com/12725846/128856329-df936aff-76da-4a36-926e-8dbd13aaf10a.png)

## Setup Jenkins Job--part 2
Create a password text file to pass the login password of nexus user created in above step
```
cat my_password.txt | sudo docker login --username pavan --password-stdin localhost:8070
```
Create a tag to link the created image to nexus repository
```
sudo docker tag pavan_project localhost:8070/pavan-repo-git/pavan_project
```
Finally push the image to nexus repository
```
sudo docker push localhost:8070/pavan-repo-git/pavan_project
```
Final code looks like below:
![jenkins2](https://user-images.githubusercontent.com/12725846/128855472-fd55aec2-22c6-40c4-83b8-e569606e00fd.png)

## Task is completed, once the above process is success
![4](https://user-images.githubusercontent.com/12725846/128857746-816b937f-173c-45a8-bf75-b6ea99a45250.png)

Now checking in Nexus, the image is uploaded.
![5](https://user-images.githubusercontent.com/12725846/128857862-453268ee-a7e4-4f08-9092-a47b82e338a4.png)

#### END OF PROJECT ####

