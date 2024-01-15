#!/bin/sh

if [ "$1" = "dev" ]; then
  echo "dev環境だよ"
  flutter build ipa --release --export-options-plist=ios/ExportOptionsDev.plist --dart-define-from-file=dart_defines/dev.json
  cd ios
  fastlane upload_dev_testflight --env dev
  cd ../
else
  echo "エラー"
fi