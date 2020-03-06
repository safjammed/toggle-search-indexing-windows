@ECHO OFF
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
SC queryex "wsearch"|Find "STATE"|Find /v "RUNNING">Nul&&(  
  sc config wsearch start=delayed-auto 
  sc start wsearch   
  net start wsearch  
  )||(    
    net stop wsearch    
    sc stop wsearch
    sc config wsearch start=disabled    
)
EXIT /b 0