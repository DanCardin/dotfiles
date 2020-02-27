* For things which require xcode, transiently

Run
```bash
nix-store --add-fixed --recursive sha256 /Applications/Xcode.app
```
once, then per project:

add `darwin.xcode` as a dependency, 
