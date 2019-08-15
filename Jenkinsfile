pipeline
 {

    agent any

 


    stages 
	{

            stage('Build')
			 {
		
            steps {
			
                powershell 'dotnet build ApiTest.sln -p:configuration=release -v:n'
    
				            echo "Building......."
 
				    }
		
        }
    
			stage('Test') 
			{
			
            steps {

				                powershell 'dotnet test'
   
				             	echo "Testing.........."
  
				          }
 
			}
 
			 stage('Publish')
 					{
				
            steps {
					
                powershell 'dotnet publish'
					
                echo "Testing.........."

						  }

        				}
			
    }

 			   post
				{

        		always
				{

            archiveArtifacts '**'

    				    }
			
    	}
   
               		 
}