#!/bin/bash

# Script to automates Drupal site installation.

if [ $# -lt 1 ]
then
  echo ""
  echo "USAGE: $0 [Site-name]"
  echo "Site-Name is machine name of the site. Use letters and '_' (underscore) chars."
  echo ""
  exit
fi

SITENAME=$1

if [[ $SITENAME =~ ^[A-Za-z_]+$ ]]; then
  echo "Valid Site-name"  
else
  echo ""
  echo "ERROR: Unvalid site-name. Remember to use letters and '_' (underscore) chars for site-name."
  echo ""
  exit
fi

echo ""
echo "**************************************************"
echo "**************************************************"
echo " WARNING: Did you setup the Env & Site variables? "
echo "**************************************************"
echo "**************************************************"
echo ""
read ANSWER1
if [ "$ANSWER1" == 'y' ] || [ "$ANSWER1" == 'Y' ]; then
  echo "Cool! Lets continue with the installation."
else
  echo "Please, setup variables and start again."
  exit
fi


# Directories
##########################################################
ROOTDIR="src" 

 
# Site
##########################################################
SITESLOGAN=""
SITELOCALE="es"

 
# Environment Database settings
##########################################################
ENVDBHOST="localhost"
ENVDBUSER="root"
ENVDBPASSWORD="root"


# Drupal Database settings
##########################################################
DBHOST="localhost"
DBNAME="codigociudadano"
DBUSER="codigociudadano"
DBPASSWORD="codigociudadano"

 
# Admin
##########################################################
ADMINUSERNAME="root"
ADMINPASSWORD="123"
ADMINEMAIL="$ADMINUSERNAME@$SITENAME.com"


# DB Setup
##########################################################
echo ""
echo "Setting up site database..."

RESULT=`mysqlshow -u$ENVDBUSER -p$ENVDBPASSWORD $DBNAME| grep -v Wildcard | grep -o $DBNAME`
if [ "$RESULT" == $DBNAME ]; then
 echo "ERROR: The chosen DB already exists. Please check the settings."
 echo "Exiting."
 exit
else
  mysql -u$DBUSER -p$DBPASSWORD -e"CREATE DATABASE $DBNAME"
fi

echo "Creating db user for $DBNAME"
mysql -u$ENVDBUSER -p$ENVDBPASSWORD -e"GRANT ALL ON $DBNAME.* TO '$DBUSER'@'$DBHOST' IDENTIFIED BY '$DBPASSWORD'"


# Download Core
##########################################################
echo "Making Drupal based on profile..."

drush make initial-site.make ../$ROOTDIR --prepare-install
drush cc all 


# File changes
##########################################################
DFLTFOLDERPATH="$ROOTDIR/sites/default"

chmod -R 775 ../$ROOTDIR

cp modules_enabled.txt ../$DFLTFOLDERPATH
cp modules_disabled.txt ../$DFLTFOLDERPATH
cp adjust-db-to-site.sh $ROOTDIR/script
cd ../$ROOTDIR;
 

# Install core
##########################################################
echo "Installing Drupal core..."
drush site-install -y standard --account-mail=$ADMINEMAIL --account-name=$ADMINUSERNAME --account-pass=$ADMINPASSWORD --site-name=$SITENAME --site-mail=$ADMINEMAIL --locale=$SITELOCALE --db-url=mysql://$DBUSER:$DBPASSWORD@$DBHOST/$DBNAME;
drush cc all 


# Enabling modules
##########################################################

echo ""
echo "Updating modules enabled ..."
cd ../$DFLTFOLDERPATH
drush cc all
drush dis `cat modules_disabled.txt` -y
drush en `cat modules_enabled.txt` -y
drush cc all

echo ""
echo "Applying database updates ..."
drush updb -y
drush fra -y
drush cc all

# Pre configure settings
##########################################################
echo ""
echo "Pre configure settings ..."

drush vset site_slogan "$SITESLOGAN"

drush vset file_public_path "sites/$SITENAME/files"
drush vset file_private_path "sites/$SITENAME/private"
drush vset file_temporary_path "sites/$SITENAME/files"
drush vset preprocess_css 0
drush vset preprocres_js 0
 
echo -e "////////////////////////////////////////////////////"
echo -e "// Install Completed"
echo -e "////////////////////////////////////////////////////"
