#!/bin/sh

cd creator-api-docs/
rm -rf node_modules/

echo "---------------------------------"
echo "Cocos Creator API - v1.9...      "
echo "---------------------------------"
git checkout v1.9

if (git pull origin v1.9 | grep -q "$git_string"); then
    echo "*** Cocos Creator API v1.9 skipped, GitHub repo up to date... ***"
else
    #git pull origin v1.9
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator API v1.9 -- ensuring GitBook is up to date..."
    gitbook install
    echo "Cocos Creator API v1.9 -- building GitBook docs...."
    gitbook build
    echo "Cocos Creator API v1.9 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ v1.9/
    rsync --recursive v1.9 ../documentation/api-ref/creator
    mv v1.9/ api/
    rsync --recursive api ../documentation/creator/1.9
    rm -rf api/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator API - v1.9 done"
echo "---------------------------------"

echo "---------------------------------"
echo "Cocos Creator API - v1.10..."
echo "---------------------------------"
git checkout v1.10

if (git pull origin v1.10 | grep -q "$git_string"); then
    echo "*** Cocos Creator API v1.10 skipped, GitHub repo up to date... ***"
else
    #git pull origin v1.10
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator API v1.10 -- ensuring GitBook is up to date..."
    gitbook install
    echo "Cocos Creator API v1.10 -- building GitBook docs...."
    gitbook build
    echo "Cocos Creator API v1.10 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ v1.10/
    rsync --recursive v1.10 ../documentation/api-ref/creator
    mv v1.10/ api/
    rsync --recursive api ../documentation/creator/1.10
    rm -rf api/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator API - v1.10 done"
echo "---------------------------------"

echo "---------------------------------"
echo "Cocos Creator API - v2.0.x..."
echo "---------------------------------"
git checkout v2.0

if (git pull origin v2.0 | grep -q "$git_string"); then
    echo "*** Cocos Creator API v2.0 skipped, GitHub repo up to date... ***"
else
    #git pull origin v2.0
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator API v2.0 -- ensuring GitBook is up to date..."
    gitbook install
    echo "Cocos Creator API v2.0 -- building GitBook docs...."
    gitbook build
    echo "Cocos Creator API v2.0 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ api/
    rsync --recursive api ../documentation/creator/
    rsync --recursive api ../documentation/creator/2.0/
    mv api/ v2.0/
    rsync --recursive v2.0 ../documentation/api-ref/creator
    rm -rf v2.0/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator API - v2.0.x"
echo "---------------------------------"

echo "---------------------------------"
echo "Cocos Creator API - v2.1..."
echo "---------------------------------"
git checkout v2.1

if (git pull origin v2.1 | grep -q "$git_string"); then
    echo "*** Cocos Creator API v2.1 skipped, GitHub repo up to date... ***"
else
    #git pull origin v2.1
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator API v2.1 -- ensuring GitBook is up to date..."
    gitbook install
    echo "Cocos Creator API v2.1 -- building GitBook docs...."
    gitbook build
    echo "Cocos Creator API v2.1 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ v2.1/
    rsync --recursive v2.1 ../documentation/api-ref/creator
    mv v2.1/ api/
    rsync --recursive api ../documentation/creator/2.1
    rm -rf api/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator API - v2.1 done"
echo "---------------------------------"

echo "---------------------------------"
echo "Cocos Creator API - v2.2..."
echo "---------------------------------"
git checkout v2.2

if (git pull origin v2.2 | grep -q "$git_string"); then
    echo "*** Cocos Creator API v2.2 skipped, GitHub repo up to date... ***"
else
    #git pull origin v2.2
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator API v2.2 -- ensuring GitBook is up to date..."
    gitbook install
    echo "Cocos Creator API v2.2 -- building GitBook docs...."
    gitbook build
    echo "Cocos Creator API v2.2 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ v2.2/
    rsync --recursive v2.2 ../documentation/api-ref/creator
    mv v2.2/ api/
    rsync --recursive api ../documentation/creator/2.2
    rm -rf api/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator API - v2.2 done"
echo "---------------------------------"

cd ..
