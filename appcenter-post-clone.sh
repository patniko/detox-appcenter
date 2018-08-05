echo "Installing applesimutils"
mkdir simutils
cd simutils
curl https://raw.githubusercontent.com/wix/homebrew-brew/master/AppleSimulatorUtils-0.5.22.tar.gz -o applesimutils.tar.gz
tar xzvf applesimutils.tar.gz
sh buildForBrew.sh
cd ..
export PATH=$PATH:./simutils/build/Build/Products/Release

brew install nvm
source $(brew --prefix nvm)/nvm.sh

echo "Installing Node..."
nvm install 8.11.3
nvm use --delete-prefix 8.11.3
nvm alias default 8.11.3

echo "Detecting applesimutils"
which applesimutils

echo "Figuring out node version..."
node --version

echo "Installing dependencies for detox tests..."
npm install

echo "Building the project..."
npx detox build --configuration ios.sim.release

echo "Executing tests..."
npx detox test --configuration ios.sim.release --cleanup


