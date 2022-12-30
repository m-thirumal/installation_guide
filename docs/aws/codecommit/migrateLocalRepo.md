
## Migrating Local Repository to AWS Code Commit
### Instructions

Initialize your sample app as a git repository:

		$ git init .

Commit your existing files:

    $ git add -A .
    $ git commit -m "Initial commit"

Copy the value for the SourceRepoURL and configure a new git remote named codecommit. Be sure to use your value of the SourceRepoURL:

    $ git remote add codecommit https://git-codecommit.us-west-2.amazonaws.com/v1/repos/mytodo

Configure the CodeCommit credential helper. Append these lines to the end of your .git/config file:

    [credential]
        helper =
        helper = !aws codecommit credential-helper $@
        UseHttpPath = true

## Verification

Verify you have a codecommit remote:

    $ git remote -v
    codecommit  https://git-codecommit.us-west-2.amazonaws.com/v1/repos/mytodo (fetch)
    codecommit  https://git-codecommit.us-west-2.amazonaws.com/v1/repos/mytodo (push)

Verify the credential helper is installed correctly. Mac users may see an osxkeychain entry as the first line of output. This is expected, you just need to verify the last two lines match the output below:

    $ git config -l | grep helper
    credential.helper=osxkeychain
    credential.helper=
    credential.helper=!aws codecommit credential-helper $@

Verify you can fetch from the codecommit remote:

    $ git fetch codecommit
    $ echo $?
    0

#### Pushing your changes to AWS CodeCommit

Now we have our pipeline and git remote configured, anytime we push changes to our codecommit remote, our pipeline will automatically deploy our app.
Instructions

Push your changes to the codecommit remote:

    $ git push codecommit master
    Counting objects: 23, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (18/18), done.
    Writing objects: 100% (23/23), 9.82 KiB | 3.27 MiB/s, done.
    Total 23 (delta 2), reused 0 (delta 0)
    To https://git-codecommit.us-west-2.amazonaws.com/v1/repos/mytodo
     * [new branch]      master -> master

#### Verification

The best way to verify the pipeline is working as expected is to view the pipeline in the console:
