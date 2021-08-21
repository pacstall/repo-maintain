# repo-maintain tools

`mr` helps repo owners to easily maintain their repos

## Install

```console
$ git clone https://github.com/pacstall/repo-maintain/
$ cd repo-maintain
$ ./install.sh
```

## Commands
All these commands need to be run in the directory of your repo

`mr -I` creates a repo in your working directory. It will fail if the directory is not empty.

`mr -A` moves a pacscript to your working directory if it's a repo.

`mr -U` updates packageslist file in your working directory if it's a repo. This file is used for searching and installing with pacstall.

`mr -T` will test a pacscript in a docker container. Can be run in any directory


## Examples

First we create a repo.
```console
$ mkdir my-repo && cd my-repo
$ mr -I
```

After that, we test if the script works. This is done with a docker container of ubuntu.
```console
$ mr -T ~/test.pacscript        #tests pacscript inside a docker container
```

After we see that the script ran successfully, we can add it to the repo.

```console
$ cd my-repo
$ mr -A ~/test.pacscript        # adds test.pacscript to the repo
$ mr -U                         # updates packagelist
```

Finally, we can add a remote to the git repo and push the changes.

```console
$ git remote add origin https://github.com/my-username/my-repo/ 
$ git push
```
