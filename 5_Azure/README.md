# Azure Cloud. Home task.

## Part 1. Configure application.
### Step 1. Create a service connection in a Azure DevOps project to your subscription.

### Step 2. Build your app locally .net project via dotnet tool. dotnet restore/build/run.

### Step 3. Create an Azure DevOps repo.

### Step 4. Create a branching policy for you application. Added yourself as a reviewer.


## Part 2. Configure a pipeline to deploy infrastructure.
### Step 1. Create a separate resource group and deploy azure storage account.

### Step 2. Create a container with the name “tfstate” and remember the name. use portal settings.

### Step 3. Create another repo to store devops code.

### Step 4. Create a folder terraform. 

### Step 5. Add app service implementation.

### Step 6. Integrate application insights with app service.

### Step 7. Updated backend “azurerm” according to the guide.

### Step 8. Run az login or Connect-AzAccount to connect the azure subscription from your local.

### Step 9. Run terraform apply to deploy infrastructure.

### Step 10. Create a yaml pipeline with the following steps: terraform install, terraform init, terraform plan/apply.

### Step 11. Inside yaml pipeline add trigger to main branch. The scenario – when main is updated, pipeline should run automatically

### Step 12. Added 3 steps – terraform install, terraform init, terraform plan/apply. Plan is an optional one. You may add it as 4th step

## Part 3. Create a deploy pipeline to app service.
### Step 1. Add yml pipeline to the application folder.

### Step 2. Your pipeline structure should contain 2 stages. 1st – build, create zip archieve, and publish an artifact. 2nd – download an artifact and deploy it to azure app service.

### Step 3. To deploy .zip to app service use azure app service deployment task.
