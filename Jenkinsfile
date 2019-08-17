pipeline {
    agent any
	parameters {		
			string(	name: 'Git_Url',
					defaultValue: "https://github.com/tavisca-akhullar/ApiTest.git",
					description: '')

			string(	name: 'Solution_Name',
					defaultValue: "ApiTest.sln", 
					description: '')

			string(	name: 'Test_Project_Path',
					description: '')

	`		string(	name: 'Container_Name',
					defaultValue: "myapitest", 
					description: '')
			
			string(	name: 'Build_Version',
					defaultValue: "1.0", 
					description: '')

			string(	name: 'Application_Port',
					defaultValue: "8999", 
					description: '')

			string(	name: 'Contiainer_Port',
					defaultValue: "6969", 
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
		powershell 'docker build -t ${Container_Name}:${Build_Version} Release'
		powershell'docker run -p ${Container_Port}:${Application_Port} ${Container_Name}'
		powershell 'docker container rm -f ${Container_Name}:${Build_Version}'
        }	
    }

   post{
	  always{
	      deleteDir()
	  }
      }
 }
