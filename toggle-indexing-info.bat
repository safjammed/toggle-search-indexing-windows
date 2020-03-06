@ECHO OFF
SC queryex "wsearch"|Find "STATE"|Find /v "RUNNING">Nul&&(
  echo "***Service is NOT RUNNING***"  
  net start wsearch
  echo "Windows Search indexing started"  
  PAUSE
  )||(
    echo "***Service is RUNNING***"
    net stop wsearch
    echo "Windows Search indexing stopped"
    PAUSE
)
