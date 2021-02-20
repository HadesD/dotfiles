git pull origin master
git submodule update --init --recursive

git submodule foreach "
  git reset HEAD
  git checkout .
  git pull origin master
"

