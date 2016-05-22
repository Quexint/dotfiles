#!/bin/bash
pushd "$(pwd)"
for d in ./*/ ; do
  if [ -d "$d/.git" ]; then
    echo "Updating \"$d\"..."
    (cd "$d" && git fetch && git pull 2> $HOME/mbox);
  fi
done
popd
