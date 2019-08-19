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

			string(	name: 'Container_Name',
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

			
			string(	name: 'User_Id',
					defaultValue: "1234", 
					description: '')
			
			
			string(	name: 'Password',
					defaultValue: "1234", 
					description: '')

			string(	name: 'Repository',
					defaultValue: "myrepository", 
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
		
            }
        }

		 stage('Deploy') { 
            steps {
		powershell 'docker build -t ${Container_Name}:${Build_Version} Release'
		powershell'docker run -p ${Container_Port}:${Application_Port} ${Container_Name}'
		    docker tag ${Container_Name} ${User_Id}/${Repository}:${Build_Version}'
		powershell 'docker login -u ${User_Id} -p ${Password}'
		powershell 'docker push ${User_Id}/${Container_Name}:${Build_Version}'
		powershell 'docker image rm -f ${Container_Name}:${Build_Version}'
        }	
    }

   post{
	  always{
	      deleteDir()
	  }
      }
 }
