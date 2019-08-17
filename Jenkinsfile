pipeline {
    agent any
	parameters {		
			string(	name: 'Git_Url',
					defaultValue: "https://github.com/tavisca-akhullar/DemoApi.git",
					description: '')

			string(	name: 'Solution_Name',
					defaultValue: "ApiTest.sln", 
					description: '')

			string(	name: 'Test_Project_Path',
					description: '')
		    
    }
	
    stages {
        stage('Build') {
            steps {
				powershell 'dotnet restore ${Solution_Name} --source https://api.nuget.org/v3/index.json'
                powershell 'dotnet build  ${Solution_Name} -p:Configuration=release -v:n'
				
            }
        }
		
        stage('Test') {
            steps {
                powershell 'dotnet test' 
            }
        }
	
	 stage('Publish') { 
            steps {
                powershell 'dotnet publish'
		powershell 'cp ApiTest\obj\Release\netcoreapp2.2\* Release\publish' 
            }
        }

		 stage('Deploy') { 
            steps {
		powershell 'docker build -t myapitest Release'
		powershell'docker run -p 1212:8999 myapitest'
		powershell 'docker image rm -f myapitest:latest'
        }
	
		
    }
}
