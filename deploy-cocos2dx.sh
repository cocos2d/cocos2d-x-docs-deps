#!/bin/sh
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

cd cocos2d-x-docs/

echo "--------------------------------"
echo "Cocos2d-x -- pulling v3..."
echo "--------------------------------"
git checkout master
git reset --hard origin/master

#if (git pull origin master | grep -q "$git_string"); then
#    echo "*** Cocos2d-x v3 skipped, GitHub repo up to date... ***"
#else
    echo "Building Cocos2d-x v3 docs..."
    #git pull origin master
    cp -rf config/cocos2d-x.org/. ./

    ## make sure gitbook is up to date
    echo "Cocos2d-x-docs v3 -- ensuring GitBook is up to date..."
    gitbook install

    ## build it
    echo "Cocos2d-x-docs v3 -- building GitBook docs...."
    gitbook build

    ## copy some needed files
    echo "Cocos2d-x-docs v3 -- copying needed files..."
    cp redirect.html.en _book/index.html
    cp index.html.en ../documentation/index.html

    ## copy everything to deployment directory
    echo "Cocos2d-x-docs v3 -- copy everything to deployment directory..."

    mv _book/ v3/
    rsync --recursive v3 ../documentation/cocos2d-x
    rm -rf v3/
    #git stash
    git reset --hard origin/master
#fi

echo "--------------------------------"
echo "Cocos2d-x -- pulling v4..."
echo "--------------------------------"
git checkout v4-docs
git reset --hard origin/v4-docs

#if (git pull origin v4-docs | grep -q "$git_string"); then
#    echo "*** Cocos2d-x v4 skipped, GitHub repo up to date... ***"
#else
    echo "Building Cocos2d-x v4 docs..."
    #git pull origin v4-docs
    cp -rf config/cocos2d-x.org/. ./

    ## make sure gitbook is up to date
    echo "Cocos2d-x-docs v4 -- ensuring GitBook is up to date..."
    gitbook install

    ## build it
    echo "Cocos2d-x-docs v4 -- building GitBook docs...."
    gitbook build

    ## copy some needed files
    echo "Cocos2d-x-docs v4 -- copying needed files..."
    cp redirect.html.en _book/index.html
    #cp index.html.en ../documentation/index.html

    ## copy everything to deployment directory
    echo "Cocos2d-x-docs v4 -- copy everything to deployment directory..."

    mv _book/ v4/
    rsync --recursive v4 ../documentation/cocos2d-x
    rm -rf v4/
    #git stash
    git reset --hard origin/v4-docs
#fi

cd ..

echo "---------------------------------"
echo "Deploying to web-server location"
echo "---------------------------------"
echo "Copy to nginx location..."
rsync --recursive documentation /var/www
