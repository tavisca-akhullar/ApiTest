pipeline {
    agent any
	parameters {		
			
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

			string(	name: 'Container_Port',
					defaultValue: "6969", 
					description: '')


			string(	name: 'Docker_Registry',
					defaultValue: "myrepository", 
					description: '')
		    
    }
	
    stages {
        stage('Build') {

            steps {
		    powershell('dotnet ${Sonar_MS_Tool} begin /k:"ApiTestDemo" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="46256c0cd50596270a8806d20a71b5ddda0c01c6"')
		    powershell 'dotnet restore ${Solution_Name} --source https://api.nuget.org/v3/index.json'
		    powershell 'dotnet build  ${Solution_Name} -p:Configuration=release -v:n'
                    powershell 'dotnet test'
		    powershell('dotnet ${Sonar_MS_Tool} end /d:sonar.login="46256c0cd50596270a8806d20a71b5ddda0c01c6"')
            }
        }
	
	 stage('Publish') { 
	 docker.withRegistry('','docker_credentials'){
            steps {
                powershell 'dotnet publish'
		powershell "docker build -t ${Container_Name}:${Build_Version} Release"
		powershell "docker tag ${Container_Name} ${User_Id}/${Docker_Registry}:${Build_Version}"
		powershell "docker push ${User_Id}/${Container_Name}:${Build_Version}"
		powershell "docker image rm -f ${Container_Name}:${Build_Version}"
            }
	}
   }

		 stage('Deploy') { 
		 docker.withRegistry('','docker_credentials'){
            	   steps {
			powershell 'docker pull ${Docker_Registry}/${Container_Name}:${Build_Version}'
			powershell 'docker run -p ${Application_Port}:${Container_Port} ${Container_Name}:${Build_Version}'
        	}	
	   }
       }
   }
} 
