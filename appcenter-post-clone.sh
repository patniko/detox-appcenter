echo "Installing Node 8..."
brew install node@8

echo "Installing applesimutils..."
#brew tap wix/brew && brew install wix/brew/applesimutils

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