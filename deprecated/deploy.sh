#!/bin/sh

# This script builds: Cocos2d-x-docs, Cocos Creator Manual, Cocos Creator API-Ref.

convert_to_integer() {
 echo "$@" | awk -F "." '{ printf("%03d%03d%03d\n", $1,$2,$3); }';
}

echo "**********************"
echo "Building Cocos Docs..."
echo "**********************"
echo "Hosekeeping..."
git_legacy=0
gitv1=2.7.4
git_string=0

git_version="$(git --version)"
git_version=${git_version#"git version "}
echo "Git version: "$git_version

if [ "$(convert_to_integer $git_version)" -gt "$(convert_to_integer $gitv1)" ];then
    #echo "$git_version is greater than or equal to $gitv1"
    git_legacy=0
    git_string="Already up to date"
    echo "Git version: modern"
else
    git_legacy=1
    git_string="Already up-to-date"
    echo "Git version: legacy"
fi

mkdir -p documentation/
mkdir -p documentation/creator/
mkdir -p documentation/cocos2d-x/

echo "-----------------------------------------------"
echo "Cocos2d-x-docs "
echo "-----------------------------------------------"
./deploy-cocos2dx.sh

echo "-----------------------------------------------"
echo "Creator docs "
echo "-----------------------------------------------"
./deploy-creator-docs.sh

echo "-----------------------------------------------"
echo "Creator API Docsdocs "
echo "-----------------------------------------------"
./deploy-creator-api.sh

echo "---------------------------------"
echo "Deploying to web-server location"
echo "---------------------------------"
echo "Copy to nginx..."
rsync --recursive documentation /var/www

echo "---------------------------------"
echo "Restarting web-server..."
echo "---------------------------------"
sudo /usr/sbin/nginx -s stop
sudo /usr/sbin/nginx

echo "---------------------------------"
echo "Deployment done!"
echo "---------------------------------"
