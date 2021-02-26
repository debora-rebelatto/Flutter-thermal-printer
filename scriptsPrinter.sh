#!/bin/bash

GREEN=`tput setaf 2`
reset=`tput sgr0`

PS3='Please enter your choice: '
options=(
  "Build Apk"
  "Build web"
  "Build web Skia"
  "Splash Screen"
  "Launcher Icon"
  "Clean"
  "Quit"
)

select opt in "${options[@]}"
do
  case $opt in
    "Build Apk")
      echo "${GREEN}https://flutter.dev/docs/deployment/android ${reset}"
      echo "${GREEN}Release Apk can be found at ~/build/app/outputs/flutter-apk ${reset}"
      flutter build apk --release
      echo "${GREEN}Done!"
      break
      ;;
    "Build web")
      echo "${GREEN}https://flutter.dev/docs/deployment/web ${reset}"
      flutter build web --release
      echo "${GREEN}Done!"
      break
      ;;
    "Build web Skia")
      flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
      echo "${GREEN}Done!"
      break
      ;;
    "Splash Screen")
      echo "${GREEN}More https://pub.dev/packages/flutter_native_splash ${reset}"
      flutter pub pub run flutter_native_splash:create
      break
      ;;
    "Launcher Icon")
      echo "${GREEN}https://pub.dev/packages/flutter_launcher_icons ${reset}"
      flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml
      break
      ;;
    "Clean")
      flutter clean
      break
      ;;
    "Quit")
      break
      ;;
    *) echo "invalid option $REPLY";;
  esac
done