# Detox on AppCenter React Native Demo Project

## Background

This sample project demonstrates running Detox tests prior to a regular MS [AppCenter](https://appcenter.ms/) build
* On React Native 0.56.0
* With Detox 8
* And Mocha runner, currently

## Requirements

* Make sure you have Xcode installed (tested with Xcode 9.4.1).
* Make sure you have node installed (`brew install node` or via nvm etc, node 8.X and up is required_
* Make sure you have react-native dependencies installed:
   * watchman is installed (`brew install watchman`)

### Step 1: Npm install

* Run `npm install`.

## To test Release build of your app
### Step 2: Build 
* Build the demo project
 
 ```sh
 npx detox build --configuration ios.sim.release
 ```
 
### Step 3: Test 
* Run tests on the demo project
 
 ```sh
 npx detox test --configuration ios.sim.release
 ```
 This action will open a new simulator and run the tests on it.

## To test Debug build of your app
### Step 2: Build 
* Build the demo project
 
 ```sh
 npx detox build --configuration ios.sim.debug
 ```
 
### Step 3: Test 

 * start react-native packager
 
  ```sh
 npm run start
 ```
 * Run tests on the demo project
 
 ```sh
 npx detox test --configuration ios.sim.debug
 ```
 This action will open a new simulator and run the tests on it.
