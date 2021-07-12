# repo-maintain will help repo owners more easily maintain their repo

git clone this repo, cd into it and run `./install.sh`

## Commands
`mr -I` will create a repo in your working directory. It will fail if the directory is not empty

`mr -A` should be run in the root of your repo. It will add packages to the packagelist file (needed for searching)

`mr -T` will test a pacscript in a docker container


## Examples

First I run `mr -I` to make a repo. I have a pacscript in `~` that I want to test before adding it to the repo, so I run `mr -T ~/test.pacscript`. This creates a docker container of ubuntu that will automatically install so you don't have to have an Ubuntu system to test scripts. After I see that the script ran successfully, I move it to `packages/test/test.pacscript`, and run `mr -A` to add it to the packagelist file
