#!/bin/sh

if [ "$1" = "dev" ]; then
  echo "dev環境だよ"
  flutter build ipa --release --export-options-plist=ios/ExportOptionsDev.plist --dart-define-from-file=dart_defines/dev.json
  cd ios
  fastlane upload_dev_testflight --env dev
  cd ../
elif [ "$1" = "prod" ]; then
  echo "prodだよ"
  flutter build ipa --release --export-options-plist=ios/ExportOptions.plist --dart-define-from-file=dart_defines/prod.json
  cd ios
  fastlane upload_testflight --env prod
  cd ../
else
  echo "エラー"
fi