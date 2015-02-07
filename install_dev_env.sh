#!/bin/sh
{ "This script requires superuser access to install apt packages."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    # run inside sudo
    sudo sh <<SCRIPT

  echo "Install Git git-gui curl vim"
  apt-get install git git-gui curl vim vim-rails

  echo "Add postgresql repo"
  add-apt-repository ppa:pitti/postgresql
  echo "Add mongodb repo"
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
  echo "Add sublime-text-3 repository"
  add-apt-repository ppa:webupd8team/sublime-text-3
  echo "Add skype repository"
  apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
  echo "Add chrome repository"
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
  echo "Update repository on the machine"
  apt-get update

  apt-get install -y postgresql-9.3 libpq-dev pgadmin3
  echo "'sudo -u postgres psql' to change password: ALTER USER postgres PASSWORD 'newPassword';"

  echo "install mysql"
  apt-get install mysql-server-5.6
  echo "install mysql"
  mysql_install_db
  mysql_secure_installation
  echo "install libmysql"
  apt-get install libmysqlclient-dev
  echo "install mysql mysql-workbench"
  apt-get install  mysql-workbench

  # install mongo
  echo "install mongodb"
  apt-get install -y mongodb-org
  echo "install redis-server"
  apt-get install redis-server

  echo "Install toolbelt HEROKU"
  # add heroku repository to apt
  echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list

  # install heroku's release key for package verification
  wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -

  # update your sources
  apt-get update

  # install the toolbelt
  apt-get install -y heroku-toolbelt

  echo "install python-software-properties openjdk-7-jre"
  apt-get install python-software-properties openjdk-7-jre -y
  echo "install libmagickwand-dev"
  apt-get install libmagickwand-dev

  echo "install rvm ruby"
  \curl -L https://get.rvm.io | bash -s stable --ruby

  echo "Install more apps"

  echo "Install vlc gimp vim guake"
  apt-get install -y vlc gimp vim vim-rails guake

  echo "Install Sublime text 3"
  apt-get install sublime-text-installer

  echo "Install skype"
  apt-get install skype

  # google chrome
  apt-get install google-chrome-stable

  echo "install dropbox"
  apt-get install nautilus-dropbox

SCRIPT
}
