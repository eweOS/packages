# Maintainer: Eric Long <i@hack3r.moe>

pkgname=zed
pkgver=0.186.7
pkgrel=1
_livekit_commit=3119b6ac0ef5e705b3e92630c8e558648f0892ed
_scap_commit=08f0a01417505cc0990b9931a37e5120db92e0d0
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64 aarch64 riscv64)
url='https://zed.dev'
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib curl dbus fontconfig llvm-libs libxkbcommon musl nodejs openssl
  pipewire sqlite vulkan-driver vulkan-icd-loader wayland zlib zstd)
makedepends=(rust clang lld cargo cargo-about cmake git gn ninja protobuf libpulse
  python-httplib2 linux-headers bsd-compat-headers vulkan-headers)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support'
            'org.freedesktop.secrets: to keep you logged into your Zed account')
options=(!lto) # too much memory usage for such a big Rust project
source=("https://github.com/zed-industries/zed/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "git+https://github.com/hack3ric/livekit-rust-sdks.git#commit=$_livekit_commit"
        "git+https://github.com/zed-industries/scap#commit=$_scap_commit"
        livekit-0001-webrtc-eweos-fixes.patch            # downstream
        webrtc-0001-do-not-link-against-libatomic.patch  # could be rewritten and upstreamed
        webrtc-0002-fix-glibcisms.patch                  # downstream, taken from Alpine
        scap-0001-feature-gate-x11.patch                 # upstreamed, https://github.com/zed-industries/scap/pull/1
        0001-disable-x11-everywhere.patch)               # could be rewritten and upstreamed
sha256sums=('5c1edf6ce719651365f0bbc14916ffe0406f65dbbc2f33ca814963c44d79ad81'
            'df044bce7dc5af8adbc3ca29225a62f8cee7a71535d704988abc8b372ea600e7'
            'ae8f7f5512e9a90bf67f013b54c39240395a0ca71e8f9865522f4960bd63b1ea'
            '171fb143fd639da257b2921cba717bb4bf976d94f249b137e50451daceeaaf39'
            'f01d01249e0304f3dc7b8415ad58a9a834a742a7295023f6a730212ddfefc4d3'
            'f808b7cb3f2dfc88d9837b8d88078748e0e3d95564824a2df6eeff5ae1776583'
            'f78daaaec06fb2018fe9027e0a5f5f9d1d1c46c87a4eed44f6da926f33f71b6b'
            '95aa719f2c3dfad82a59c895bb0ed8b2b373140150cb47490565b239cf328869')

_binname=zeditor
_appid=dev.zed.Zed

prepare() {
  pushd livekit-rust-sdks
  cp -t webrtc-sys/libwebrtc/patches \
    ../webrtc-0001-do-not-link-against-libatomic.patch \
    ../webrtc-0002-fix-glibcisms.patch
  patch -Np1 -i ../livekit-0001-webrtc-eweos-fixes.patch
  popd

  patch -d scap -Np1 -i ../scap-0001-feature-gate-x11.patch

  cd $pkgname-$pkgver

  patch -Np1 -i ../0001-disable-x11-everywhere.patch
  echo -e "\n[patch.'https://github.com/zed-industries/scap']\nscap = { path = '$srcdir/scap' }" >>Cargo.toml
  cargo update -p scap
  cargo fetch --locked --target $RUSTHOST

  sed crates/zed/resources/zed.desktop.in \
    -e "s/\\\$DO_STARTUP_NOTIFY/true/g" \
    -e "s/\\\$APP_ICON/zed/g" \
    -e "s/\\\$APP_NAME/Zed/g" \
    -e "s/\\\$APP_CLI/$_binname/g" \
    -e "s/\\\$APP_ARGS/%U/g" \
    > $_appid.desktop
  ./script/generate-licenses
}

_srcenv() {
  cd $pkgname-$pkgver

  export CXXSTDLIB=c++
  # https://github.com/zed-industries/zed/issues/15902
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-z -Clink-arg=nostart-stop-gc"

  export ZED_UPDATE_EXPLANATION='Updates are handled by pacman'
  export RELEASE_VERSION=$pkgver
  export PROTOC=/usr/bin/protoc
  export PROTOC_INCLUDE=/usr/include
}

build() {
  _srcenv

  local _google_arch
  case $CARCH in
  x86_64)
    _google_arch=x64
    ;;
  aarch64)
    _google_arch=arm64
    ;;
  *)
    _google_arch=$CARCH
    ;;
  esac

  pushd "$srcdir/livekit-rust-sdks/webrtc-sys/libwebrtc"
  sed -i '2i set -e' build_linux.sh
  (
    # Some build profiles in webrtc adds +dotprod in aarch64, which would be
    # overridden by our C*FLAGS and lead to compiler error
    export CFLAGS=$(echo $CFLAGS | sed 's/-march=[^ ]*//')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-march=[^ ]*//')
    # This script will clone depot_tools and libwebrtc tree, which is not ideal
    # in build(). Should separate the fetch steps in prepare().
    ./build_linux.sh --arch $_google_arch --toolchain host
  )
  export LK_CUSTOM_WEBRTC="$(pwd)/linux-$_google_arch-release"
  popd

  cargo build --release --frozen --package zed --package cli
}

# Tests assume access to vulkan video drivers, Wayland window creation,
# detecting system keymaps, etc. Until there is something sensical for
# a package to test in the suite, just skip it by default.
check() {
  _srcenv
  # cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/cli "$pkgdir/usr/bin/$_binname"
  install -Dm0755 target/release/zed "$pkgdir/usr/lib/$pkgname/zed-editor"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_appid.desktop"
  install -Dm0644 crates/zed/resources/app-icon.png "$pkgdir/usr/share/icons/$pkgname.png"
}
