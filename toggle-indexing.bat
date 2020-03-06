@ECHO OFF
echo "******************************************************"
echo "*             SEARCH INDEX TOGGLER                   *"
echo "******************************************************"
echo ""
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
SC queryex "wsearch"|Find "STATE"|Find /v "RUNNING">Nul&&(
  echo "******Service is NOT RUNNING************" 
  sc config wsearch start=delayed-auto 
  sc start wsearch 
  REM RUN NET if SC fails
  net start wsearch
  echo "Windows Search indexing started"  
  )||(
    echo "*******Service is RUNNING*********"
    REM RUN NET if SC fails
    net stop wsearch    
    sc stop wsearch
    sc config wsearch start=disabled    
    echo "Windows Search indexing stopped"
)
PAUSE