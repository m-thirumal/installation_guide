# Git repository migration

Git repository migration,

    git clone --mirror https://codecommit-url/exampleuser/repository-to-mirror.git
    # Make a bare mirrored clone of the repository

    cd repository-to-mirror.git
    git remote set-url --push origin https://codecommit-url/exampleuser/mirrored
    # Set the push location to your mirror

    git push --mirror


It uses :-

    git clone --mirror: to clone every references (commits, tags, branches)

    git push --mirror: to push everything

