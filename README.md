# Bottle SDK showcase

This version 2 project imports `BottleGreeting`, a local Aquarius/C library with a text asset and a transitive `BottleNumbers` dependency. The C part uses `<aqua/aqua.h>` and exports only `aqua_library_entry`. The compiled application carries the source modules, asset and needed native library for its target.

```powershell
./build.ps1 -Aqua aqua
./build.ps1 -Aqua aqua -Target web
```

The first command builds the library with the pinned SDK toolchains, refreshes the local snapshot, builds the app and runs it. Linux library binaries must be built in Linux/WSL with `aqua library build libraries/greeting --targets linux-x64` (CMake and Ninja required). Use the current compiler on PATH or pass `-Aqua` explicitly.

Successful execution prints `BOTTLE_SHOWCASE_OK`. English and Traditional Chinese source names share the same functions. The historical `dynamicEcho` function now calls the registered SDK module. There is no DynamicLibrary loader, standalone Wasm library asset or JavaScript implementation.
