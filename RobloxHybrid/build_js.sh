#!/bin/bash

java -jar ./closure-compiler/compiler.jar \
  --compilation_level WHITESPACE_ONLY \
  --js_output_file RobloxHybrid.js \
  --output_wrapper="(function() { %output% })();" \
  --js src/base.js \
  --js src/common/utils.js \
  --js src/common/events.js \
  --js src/common/bridge.js \
  --js src/common/bridge.ios.js \
  --js src/common/bridge.android.js \
  --js src/modules/social.js \
  --js src/modules/game.js \
  --js src/modules/chat.js \
  --js src/modules/input.js \
  --js src/main.js
#java -jar ./closure-compiler/compiler.jar --js_output_file roblox.js --output_wrapper="(function() { %output% })();" --js src/base.js
# src/modules/analytics.js
# src/modules/camera.js
# src/modules/console.js
# src/modules/dialogs.js
# src/modules/network.js

cp RobloxHybrid.js ../Android/NativeShell/assets/html/