# Nix configuration for Replit
# Defines the environment packages required to run a Flutter project.
{ pkgs }: {
  deps = [
    pkgs.flutter
    pkgs.dart
    pkgs.clang
    pkgs.cmake
    pkgs.gtk3
  ];
}
