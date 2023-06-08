# Troubleshoot

## Error:-

* `hudson.plugins.git.GitException: Could not init`

## Solution:-

Set the `git` path in the `Manage Jenkins > Global Tool Configuration settings`. In the Git section, change the `Path` to Git executable to `/usr/local/bin/git`.


## Error

```
w: Failed to fetch http://pkg.jenkins.io/debian-stable/binary/Release.gpg  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 5BA31D57EF5975CA
```

## Solution

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```
