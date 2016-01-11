#!/bin/sh

PROJECT_PATH=$(pwd)
BUNDLER_VERSION=$(awk -F "\'|\"" '/bundler/{print $(NF-1)}' Gemfile)
RBENV_FOLDER="$HOME/.rbenv"
DOTFILE="$HOME/.profile"

command_exists () {
  type "$1" &> /dev/null ;
}

if !command_exists rbenv ; then
  read -p "Enter your profile dotfile path: [$DOTFILE] " -i $DOTFILE DOTFILE
  read -p "Enter rbenv install path: [$RBENV_FOLDER] " -i $RBENV_FOLDER RBENV_FOLDER
  echo "Installing rbenv in $RBENV_FOLDER..."
  git clone https://github.com/rbenv/rbenv.git $RBENV_FOLDER
  echo 'Done installing rbenv!'

  while true; do
    read -p "Do you want to compile the dynamic bash extension to speed up rbenv? [Yn] " -i "Y" yn
    case $yn in
      [Yy]* )
        echo 'Trying to compile dynamic bash extension...';
        cd $RBENV_FOLDER && src/configure && make -C src;
        echo 'Done compiling! (this can fail. Please check)';;
      [Nn]* ) echo 'Skipping dynamic bash extension compilation';;
      * ) echo "Please answer with Y/y/N/n";;
    esac
  done

  echo 'Adding rbenv shims to your PATH and rbenv init in your profile dotfile...'
  echo "export PATH="$RBENV_FOLDER/bin:'$PATH'"" >> $DOTFILE
  echo 'eval "$(rbenv init -)"' >> $DOTFILE
  echo 'Done updating PATH and dotfile!'

  echo 'Restarting your shell so that PATH changes take effect...'
  source $DOTFILE
  echo 'Done restarting your shell!'

  echo 'Installing ruby-build as a plugin to rbenv (adds rbenv install command)...'
  git clone https://github.com/rbenv/ruby-build.git $RBENV_FOLDER/plugins/ruby-build
  echo 'Done installing ruby-build!'
fi

echo 'Installing the required ruby version for your project...'
cd $PROJECT_PATH
rbenv install
rbenv rehash
echo 'Done installing ruby!'

echo 'Installing the required bundler version for your project...'
gem install bundler -v $BUNDLER_VERSION
echo 'Done installing bundler!'

echo "Installing your project's dependencies..."
bundle install
echo 'Done installing project dependencies!'

echo "You're ready to run the server with 'jekyll serve'"
