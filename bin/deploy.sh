#!/bin/bash

# initialize
GEM_SOURCES_CHINA=https://gems.ruby-china.org/
GEM_SOURCES_ORIGIN=https://rubygems.org/

# rsa_pub_guxiaobai="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiAP0QTzqGB4Mqhq+nyx\
# 00grcmLNqDV8ttZnjd/D3yC1Km9speqrWejSOQlpOHfCIARUIiAKpfwjYlFHT1nZ9+5czRKqNljaT\
# 5OKlF+RYyrrlxi9NcmjCzf0h5soAXcCpe1xUSDFaZjSvcTTJFXZyyo9GWRaexAan9jlpH4iZd7ty8\
# rsQX/vHFwujSnyrLbGyOiG7eldVZt7+HoCdJ12SsC2boTFlwy1hYlk0t25Kx3dU9BCupuVQ/nbavf\
# zZpbSx0vqCMqekqj1/r/zlVLRDrCzRau3bKInmsHT3JlMRjmLXC+HvxB2+1LKMINcbCKaWJ/DYD0W\
# 81EjIuPM6thTUT sikuan.gu@gmail.com"

secret_key="c6cf1a911977bd40ffef2a3cee6d062703e0322ef4885534694a50f9c704e2aefa\
8af3c4ed4d4a1fe5900101895da6b54973c7f8490821ded451b28a5305e526"

read -p "Public Key? " rsa_pub_guxiaobai
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
echo ${rsa_pub_guxiaobai} >> ~/.ssh/authorized_keys
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
