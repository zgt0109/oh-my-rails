#!/bin/bash

# initialize
GEM_SOURCES_CHINA=https://gems.ruby-china.org/
GEM_SOURCES_ORIGIN=https://rubygems.org/

secret_key="7bfb99d9751672d3307e0f1214f82aa2ab96bc15f1a9b68c13466b1cd333a42ad0ddc481e30b6b60b772a392c19e2c45572526a1a0df7fac4a3f2105037bc10c"

read -p "Public Key? " rsa_pub_zgt
read -p "Deploy User Name? " user_name
read -p "Application Name? " app_name


# user
CHECK_USER=$(grep $user_name /etc/passwd | wc -l)

if [ ! $CHECK_USER -ge 1 ]; then
  useradd -m -G sudo,adm -s /bin/bash $user_name
  echo "${user_name} ALL=NOPASSWD:ALL" >> /etc/sudoers
su - $user_name  <<EOF
# bundler
bundle config mirror.${GEM_SOURCES_ORIGIN%/} ${GEM_SOURCES_CHINA%/}

# SSH
mkdir ~/.ssh
echo ${rsa_pub_zgt} >> ~/.ssh/authorized_keys
sed  -i "1i # Rails Applicaton Configure\n" ~/.bashrc
sed  -i "1a export RAILS_ENV=production" ~/.bashrc
sed  -i "1a export SECRET_KEY_BASE=${secret_key}" ~/.bashrc
EOF
fi
# app
app_path=/var/www/$app_name
if [ ! -d $app_path ]; then
mkdir -p $app_path
chown -R $user_name:$user_name $app_path

# Postgresql
su - postgres <<EOF
createuser  ${app_name} -P
createdb -O ${app_name} ${app_name}_production -E UTF8 -e
EOF
fi

echo -e "\e[31;43;1m All Done. Have a nice day!   \e[0m "
