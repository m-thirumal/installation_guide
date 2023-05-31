# Troubleshoot

## Error:-

* `hudson.plugins.git.GitException: Could not init`

## Solution:-

Set the `git` path in the `Manage Jenkins > Global Tool Configuration settings`. In the Git section, change the `Path` to Git executable to `/usr/local/bin/git`.
