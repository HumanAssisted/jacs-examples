 ls
 cat agent.raw.json
 jacs --help
 jacs config create
 jacs config read
 jacs agent create -f ./agent.raw.json --create-keys=true
 ls jacs/
 ls jacs/keys
 ls jacs/agents
 vim jacs.config.json
  jacs document --help
 jacs document create -f ddl.json --embed=true --attach mobius.jpeg
 ls jacs/documents
 jacs document verify -f ./jacs/documents
 jacs document create-agreement -f  --agentids agent1,agent2
 ls jacs/documents/
 jacs document sign-agreement -f
 vim jacs/documents/
 jacs document check-agreement -f