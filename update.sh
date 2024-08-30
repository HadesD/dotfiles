git pull origin master
git submodule update --jobs=5 --init --recursive

git submodule foreach "
  git reset HEAD
  git checkout .
  git pull origin \$(basename \$(git symbolic-ref refs/remotes/origin/HEAD --short))
"

