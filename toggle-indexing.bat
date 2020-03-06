@ECHO OFF
SC queryex "wsearch"|Find "STATE"|Find /v "RUNNING">Nul&&(  
  net start wsearch
  echo "Windows Search indexing started"
  exit /b 0  
  )||(        
    net stop wsearch
    echo "Windows Search indexing stopped"
    exit /b 0    
)
