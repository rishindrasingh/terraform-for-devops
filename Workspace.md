
**Workspace**

The main idea behind Terraform workspaces is to provide a way to manage multiple instances of a Terraform configuration within the same directory, allowing you to isolate state files for different environments or use cases.

🔑 **Key Concepts of Terraform Workspaces:**

1. **State Isolation:**

a). Each workspace has its own Terraform state file (terraform.tfstate), which means changes in one workspace do not affect others.

b). This is useful for managing environments like dev, staging, and prod using the same configuration but separate states.

2. **Single Configuration, Multiple Environments:**

a). You can reuse the same Terraform code and switch between workspaces to deploy resources in different environments.

3. **Default Workspace:**

Terraform starts with a default workspace named default. You can create and switch to other workspaces as needed.

4. **Workspace Commands:**
```sh
terraform workspace list – Lists all workspaces.
terraform workspace new <name> – Creates a new workspace.
terraform workspace select <name> – Switches to a workspace.
terraform workspace show – Displays the current workspace.
```
🧠 **Why Use Workspaces?**

a). **Environment separation**: Keep dev/test/prod environments isolated.

b). **Avoid state conflicts**: Prevent overwriting or mixing up resources.

c). **Simplify CI/CD pipelines**: Manage deployments across environments cleanly.

⚠️ **Limitations**

Workspaces isolate state, not configuration. If you need different configurations per environment (e.g., different resource sizes or regions), you’ll still need to use variables or separate directories/modules.

**Demo**

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


