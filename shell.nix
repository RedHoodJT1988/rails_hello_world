{ pkgs ? import<nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    gcc
    gnumake
    pkg-config
    libyaml
    zlib
    openssl
    sqlite
  ];
  
  shellHook = ''
    # Sandbox gems into a local directory to prevent version conflicts
    export GEM_HOME="$PWD/.nix-gems"
    export GEM_PATH="$GEM_HOME"
    export PATH="$GEM_HOME/bin:$PATH"
  '';
}
