1. Create Repository

		git init

		git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY

		git push -u REMOTE-NAME BRANCH-NAME

2. Create new BRANCH locally

		git checkout -b NEW-BRANCH-NAME
		
      To push the locally created new branch to remote
		
		git push --set-upstream origin  NEW-BRANCH-NAME

3. List local branches

		git branch

4. Switch branch

		git checkout branch-name

5. Stash/Un-Stash files

	One of the ways to resolve the checkout error is to stash the changes. This is usually done temporarily to save the work you have done so far in the current branch — if you are not ready to commit these changes.

		git stash

	To recover or undo the stashed changes, we can come back to the branch where we stashed the changes and pop them.

		git stash pop

6. Check branch status

		git status

7. Rename local branch

		git branch -m OLD-BRANCH-NAME NEW-BRANCH-NAME

8. Rename remote branch

		git push origin :OLD-BRANCH-NAME NEW-BRANCH-NAME

9. Synchronise branch changes

		# To add all changes
		git add .
		# To add a specific file
		git add FILE-PATH
		git commit -m "COMMIT-MESSAGE"
		git add FILE-PATH
		git commit --amend -m "CHANGE-COMMIT-MESSAGE"

10. Clone repository

		git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY

11. Checking commit log

		git log

12. Reset to the last commit

		git reset -hard origin/BRANCH-NAME

13. Merge local repository with the remote repository

		# Fetch remote from github
		git fetch REMOTE-NAME
		# Merge remote branch with local branch
		git merge REMOTE-NAME/BRANCH-NAME

		git pull REMOTE-NAME BRANCH-NAME

14. Move a commit from one branch to another

		git cherry-pick COMMIT-HASH

15. Remove untracked files & directories

		# To remove untracked files
		git clean -f
		# TO remove untracked directories
		git clean -fd

16. Delete a branch on a local repository

		git branch -d BRANCH-NAME
		# To forcefully delete a local branch. Be careful
		git branch -D BRANCH-NAME

17. Delete a branch on a remote repository

		git push REMOTE-NAME --delete BRANCH-NAME

18. Ignore Git permission changes

		git config core.fileMode false

19. Fix .gitignore

# To create a new .gitignore file
		touch .gitignore# To untrack the unnecessary tracked files in your gitignore which removes everything from its index. Specific filenames can also be used instead of dot(.).
		git rm -r --cached .
		git add .
		git commit -m "gitignore fixed untracked files"
