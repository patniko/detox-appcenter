echo "Dumping simulators..."
xcrun simctl list | xargs echo

echo "Install xcversion..."
gem install xcode-install

echo "Installing simulator..."
xcversion simulators --install='iOS 9.3'

echo "Installing applesimutils"
mkdir simutils
cd simutils
curl https://raw.githubusercontent.com/wix/homebrew-brew/master/AppleSimulatorUtils-0.5.22.tar.gz -o applesimutils.tar.gz
tar xzvf applesimutils.tar.gz
sh buildForBrew.sh 
cp ./build/Build/Products/Release/apple* ../
#pwd=`pwd`
#export "PATH=${PATH};${pwd}/build/Build/Products/Release"
cd ..

echo "Installing NVM..."
brew install nvm
source $(brew --prefix nvm)/nvm.sh

echo "Installing v8.5..."
nvm install v8.5.0
nvm use --delete-prefix v8.5.0
nvm alias default v8.5.0

echo "Detecting applesimutils"
which applesimutils

echo "Figuring out node version..."
node --version

echo "Installing detox cli..."
npm install -g detox-cli

echo "Installing dependencies for detox tests..."
npm install

echo "Building the project..."
detox build --configuration ios.sim.release

echo "Executing tests..."
detox test --configuration ios.sim.release --cleanup


