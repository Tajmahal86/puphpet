#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

VAGRANT_CORE_FOLDER=$(echo "$1")

OS=$(/bin/bash "${VAGRANT_CORE_FOLDER}/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${VAGRANT_CORE_FOLDER}/shell/os-detect.sh" CODENAME)

if [[ -f '/.puphpet-stuff/install-ruby' ]]; then
    exit 0
fi

echo 'Installing Ruby 1.9.3 using RVM'

curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3
source /usr/local/rvm/scripts/rvm
mv /usr/bin/ruby /usr/bin/ruby-old
ln -s /usr/local/rvm/rubies/ruby-1.9.3-*/bin/ruby /usr/bin/ruby
gem update --system >/dev/null

touch '/.puphpet-stuff/install-ruby'

echo 'Finished install Ruby 1.9.3 using RVM'

