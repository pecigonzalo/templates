with import <nixpkgs> {};

mkShell {
  buildInputs = [
    jre
    jdk
    maven
    gradle
    kotlin
  ];
}
