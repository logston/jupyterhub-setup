# jupyterhub-setup

Create a VM.

First run 

    curl https://raw.githubusercontent.com/logston/jupyterhub-setup/master/setup.sh | bash
    
Then run 

    sudo certbot certonly --standalone --preferred-challenges http -d jupyter.fun

Then run 

    sudo systemctl start jupyterhub.service

Done.
