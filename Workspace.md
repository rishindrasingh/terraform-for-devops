
****WorkSpace: ****

To list all workspace 
```sh
terraform workspace list   # to list all workspace
```
Now this list command will list all workspace along with it will also show your current workspace

To create and switch to a new workspace
```sh
terraform workspace new dev
```

Now to switch to any other workspace 
```sh
terraform workspace select <workspace name>
```

The main idea behind Terraform workspaces is to provide a way to manage multiple instances of a Terraform configuration within the same directory, allowing you to isolate state files for different environments or use cases.

Here lets create a "prod" environment first using terraform configuration file then we will use the same code to create a "dev" environment

This we will do by using git and terraform function.

First create a branch name "master" if not already created for prod environment changes
```sh
git checkout -b master      #this will create a new branch and switch to that newly created branch
```
Now you can add/commit your changes using git

```sh
git add .
git commit -m "Add your comments here"
```
Next you are ready to create your resources using terraform apply command
```sh
terraform apply --auto-approve
```

Now to manage the resources of dev environment using same terraform configuration file, let's switch the terraform workspace to dev workspace and also switch the git branch  to dev branch

```sh
terraform workspace select dev
git checkout -b dev # if dev branch is not present
git switch dev  # if dev branch is already present
```
Next you can change the configuration file as per dev environment and then we need to add/commit it into git repo.
```sh
git add .
git status
git commit -m "Add your comments here"
```
Now you can use terraform apply command to create/update your resources

```sh
terraform apply --auto-approve
```


