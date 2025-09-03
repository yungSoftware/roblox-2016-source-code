@echo off
REM RobloxHybrid Build Script (CMD)

REM Source files to compile
set SRC_FILES=src/base.js src/common/utils.js src/common/events.js src/common/bridge.js src/common/bridge.ios.js src/common/bridge.android.js src/modules/social.js src/modules/game.js src/modules/chat.js src/modules/input.js src/main.js

REM Build command
java -jar .\closure-compiler\compiler.jar ^
  --compilation_level WHITESPACE_ONLY ^
  --js_output_file RobloxHybrid.js ^
  --output_wrapper "(function() { %%output%% })();" ^
  --js src\base.js ^
  --js src\common\utils.js ^
  --js src\common\events.js ^
  --js src\common\bridge.js ^
  --js src\common\bridge.ios.js ^
  --js src\common\bridge.android.js ^
  --js src\modules\social.js ^
  --js src\modules\game.js ^
  --js src\modules\chat.js ^
  --js src\modules\input.js ^
  --js src\main.js

REM Copy to Android assets
if not exist "..\Android\NativeShell\assets\html\" mkdir "..\Android\NativeShell\assets\html"
xcopy /Y "RobloxHybrid.js" "..\Android\NativeShell\assets\html\*"
