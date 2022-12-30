# ssh: connect to host bitbucket.org port 22: Connection timed out

  1. Open `ssh config` file

         vi ~/.ssh/config

  2. Add these lines and save it.

          Host bitbucket.org
          Hostname  altssh.bitbucket.org
          Port  443

