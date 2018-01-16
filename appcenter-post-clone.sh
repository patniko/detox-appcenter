echo "Installing NVM..."
brew update
brew install nvm
source $(brew --prefix nvm)/nvm.sh

echo "Installing v8.5..."
nvm install v8.5
nvm use --delete-prefix v8.5

echo "Adding applesimutils tap..."
brew tap wix/brew --verbose --debug

echo "Updating brew..."
brew update --verbose --debug

echp "Installing applesimutils"
brew install wix/brew/applesimutils --verbose --debug

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