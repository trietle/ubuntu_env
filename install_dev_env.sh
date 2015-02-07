#!/bin/sh
{ "This script requires superuser access to install apt packages."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    # run inside sudo
    sudo sh <<SCRIPT

  echo "Install Git git-gui curl vim"
  apt-get install git git-gui curl vim vim-rails

SCRIPT
}
