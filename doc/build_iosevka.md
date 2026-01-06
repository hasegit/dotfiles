```
git clone --depth 1 https://github.com/be5invis/Iosevka.git
cp -p private-build-plans.toml Iosevka/.
cd Iosevka
brew install ttfautohint
npm install
npm run build -- ttf::IosevkaCustom
```
