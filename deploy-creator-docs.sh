#!/bin/sh

cd creator-docs/
rm -rf node_modules/

## pulling v1.9
echo "--------------------------------"
echo "Cocos Creator -- pulling v1.9..."
echo "--------------------------------"
git checkout v1.9

if (git pull origin v1.9 | grep -q "$git_string"); then
    echo "*** Cocos Creator v1.9 skipped, GitHub repo up to date... ***"
else
    #git pull origin v1.9
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator v1.9 -- building GitBook docs...."
    echo "If this is your first time build this repo, please stop this process and run:"
    echo "npm install gulp -g"
    echo "npm install"
    echo "DO NOT COMMIT: package-lock.json"
    npm install gulp -g
    npm install
    echo "Cocos Creator v1.9 -- ensuring GitBook is up to date..."
    gitbook install
    npm run build
    echo "Cocos Creator v1.9 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ manual/
    rsync --recursive manual ../documentation/creator/1.9
    rm -rf manual/
    git stash
fi

echo "---------------------------------"
echo "Cocos Creator -- v1.9 done"
echo "---------------------------------"

## pulling v1.10
echo "---------------------------------"
echo "Cocos Creator -- pulling v1.10..."
echo "---------------------------------"
git checkout v1.10

if (git pull origin v1.10 | grep -q "$git_string"); then
    echo "*** Cocos Creator v1.10 skipped, GitHub repo up to date... ***"
else
    #git pull origin v1.10
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator v1.10 -- building GitBook docs...."
    echo "If this is your first time build this repo, please stop this process and run:"
    echo "npm install gulp -g"
    echo "npm install"
    echo "DO NOT COMMIT: package-lock.json"
    npm install gulp -g
    npm install
    echo "Cocos Creator v1.10 -- ensuring GitBook is up to date..."
    gitbook install
    npm run build
    echo "Cocos Creator v1.10 -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ manual/
    rsync --recursive manual ../documentation/creator/1.10
    rm -rf manual/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator -- v1.10 done"
echo "---------------------------------"

## pulling 2.0.x version
echo "---------------------------------"
echo "Cocos Creator -- pulling v2.0.x.."
echo "---------------------------------"
git checkout v2.0

if (git pull origin v2.0 | grep -q "$git_string"); then
    echo "*** Cocos Creator v2.x skipped, GitHub repo up to date... ***"
else
    #git pull origin v2.0
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator v2.x-- building GitBook docs...."
    echo "If this is your first time build this repo, please stop this process and run:"
    echo "npm install gulp -g"
    echo "npm install"
    echo "DO NOT COMMIT: package-lock.json"
    npm install gulp -g
    npm install
    echo "Cocos Creator v2.x -- ensuring GitBook is up to date..."
    gitbook install
    npm run build
    echo "Cocos Creator v2.x -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ manual/
    rsync --recursive manual ../documentation/creator/2.0
    rsync --recursive manual ../documentation/creator/
    rm -rf manual/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator - v2.0.x done"
echo "---------------------------------"

## pulling 2.10 version
echo "---------------------------------"
echo "Cocos Creator -- pulling v2.1...."
echo "---------------------------------"
git checkout v2.1

if (git pull origin v2.1 | grep -q "$git_string"); then
    echo "*** Cocos Creator v2.1.x skipped, GitHub repo up to date... ***"
else
    #git pull origin v2.1
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator v2.1.x -- building GitBook docs...."
    echo "If this is your first time build this repo, please stop this process and run:"
    echo "npm install gulp -g"
    echo "npm install"
    echo "DO NOT COMMIT: package-lock.json"
    npm install gulp -g
    npm install
    echo "Cocos Creator v2.1.x -- ensuring GitBook is up to date..."
    gitbook install
    npm run build
    echo "Cocos Creator v2.1.x -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ manual/
    rsync --recursive manual ../documentation/creator/2.1
    rm -rf manual/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator - v2.1 done"
echo "---------------------------------"

## pulling 2.2 version
echo "---------------------------------"
echo "Cocos Creator -- pulling v2.2...."
echo "---------------------------------"
git checkout v2.2

if (git pull origin v2.2 | grep -q "$git_string"); then
    echo "*** Cocos Creator v2.2 skipped, GitHub repo up to date... ***"
else
    #git pull origin v2.2
    cp -rf config/cocos2d-x.org/. ./
    echo "Cocos Creator v2.2.x -- building GitBook docs...."
    echo "If this is your first time build this repo, please stop this process and run:"
    echo "npm install gulp -g"
    echo "npm install"
    echo "DO NOT COMMIT: package-lock.json"
    npm install gulp -g
    npm install
    echo "Cocos Creator v2.2.x -- ensuring GitBook is up to date..."
    gitbook install
    npm run build
    echo "Cocos Creator v2.2.x -- copy everything to deployment directory..."
    cp ../cocos2d-x-docs/redirect.html.en _book/index.html
    mv _book/ manual/
    rsync --recursive manual ../documentation/creator/2.2
    rm -rf manual/
    git stash
fi
echo "---------------------------------"
echo "Cocos Creator - v2.2 done"
echo "---------------------------------"

cd ..
