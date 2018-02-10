# Configuration file for jupyterhub.

## Class for authenticating users.
c.JupyterHub.authenticator_class = 'tmpauthenticator.TmpAuthenticator'

## The ip address for the Hub process to *bind* to.
#  
#  See `hub_connect_ip` for cases where the bind and connect address should
#  differ.
c.JupyterHub.hub_ip = '0.0.0.0'

## The public facing ip of the whole application (the proxy)
c.JupyterHub.ip = '0.0.0.0'

## The public facing port of the proxy
c.JupyterHub.port = 443

## Purge and reset the database.
c.JupyterHub.reset_db = True

## The class to use for spawning single-user servers.
#  
#  Should be a subclass of Spawner.
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'

# Spawner Specific Settings
c.DockerSpawner.image = 'jupyterhub/singleuser:latest'
c.DockerSpawner.network_name = 'bridge'
c.DockerSpawner.container_ip = "0.0.0.0"

## Path to SSL certificate file for the public facing interface of the proxy
#  
#  When setting this, you should also set ssl_key
c.JupyterHub.ssl_cert = '/etc/letsencrypt/live/jupyter.fun/fullchain.pem'
         
## Path to SSL key file for the public facing interface of the proxy
#       
#  When setting this, you should also set ssl_cert
c.JupyterHub.ssl_key = '/etc/letsencrypt/live/jupyter.fun/privkey.pem'

