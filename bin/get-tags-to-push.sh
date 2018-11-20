#!/bin/bash

# https://regex101.com/r/sxGQtU/2
if [[ $RELEASE_VERSION =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)(-RC[0-9]*)?$ ]] ;
then
  all=${BASH_REMATCH[0]}
  major=${BASH_REMATCH[1]}
  minor=${BASH_REMATCH[2]}
  patch=${BASH_REMATCH[3]}
  rc=${BASH_REMATCH[4]}

  # echo '3.2.1-RC' if RC
  if [ ${#rc} -ne 0 ] ;
  then
    echo ${all}
    exit
  fi

  # echo '3.2.1, 3.2, 3'
  echo ${major}.${minor}.${patch}, ${major}.${minor}, ${major}
fi
