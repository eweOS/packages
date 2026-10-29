# Maintainer: Eric Long <i@hack3r.moe>

pkgname=zed
pkgver=1.25.3
pkgrel=1
_livekit_commit=0a1c519cfce9b365229026b55de9b9dbdb6fed3c
_scap_commit=4afea48c3b002197176fb19cd0f9b180dd36eaac
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64 aarch64)
url='https://zed.dev'
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib curl dbus fontconfig git glib llvm-libs libxkbcommon musl nodejs
         openssl pipewire sqlite vulkan-driver vulkan-icd-loader wayland zlib zstd)
makedepends=(rust clang lld cargo cargo-about cmake git gn ninja protobuf libpulse
             python-httplib2 linux-headers bsd-compat-headers vulkan-headers)
optdepends=('npm: improved JSON language support (needed to run json-language-server)'
            'clangd: improved C/C++ language support'
            'rust-analyzer: improved Rust language support'
            'org.freedesktop.secrets: to keep you logged into your Zed account')
options=(!lto) # too much memory usage for such a big Rust project
# livekit-0001: Downstream, build libwebrtc with the host LLVM toolchain and without
# X11.
# webrtc-0001: Downstream, avoid linking GNU libatomic when using LLVM.
# webrtc-0002: Downstream, taken from Alpine, fix glibc-specific assumptions in
# WebRTC.
# https://github.com/alpinelinux/aports/blob/11163576edc8df724000096fdb82eeb30df58fb0/community/firefox-esr/fix-webrtc-glibcisms.patch
# webrtc-0003: Downstream, use the system GN and Python instead of depot_tools
# wrappers.
# webrtc-0004: Downstream, use opengl.pc because eweOS libglvnd is built without
# GLX.
# webrtc-0005: Downstream, use the eweOS clang runtime library layout.
# webrtc-0006: Downstream, include the SPA pod iterator declarations required by
# the current PipeWire headers.
# 0001: Downstream, build Zed without X11 dependencies on Wayland-only eweOS.
# 0002: Downstream, use the packaged cargo-about and accept its advisory warnings.
# 0003: Downstream, avoid the unstable Path::is_empty API with the eweOS Rust version.
source=("https://github.com/zed-industries/zed/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "git+https://github.com/zed-industries/livekit-rust-sdks.git#commit=$_livekit_commit"
        "git+https://github.com/zed-industries/scap#commit=$_scap_commit"
        livekit-0001-webrtc-eweos-fixes.patch
        webrtc-0001-do-not-link-against-libatomic.patch
        webrtc-0002-fix-glibcisms.patch
        webrtc-0003-use-system-build-tools.patch
        webrtc-0004-use-opengl-pkg-config.patch
        webrtc-0005-use-eweos-clang-runtime-layout.patch
        webrtc-0006-include-spa-pod-iter.patch
        0001-disable-x11-everywhere.patch
        0002-use-packaged-cargo-about.patch
        0003-use-stable-path-empty-check.patch)
sha256sums=('59139825acbb7b22b60ba075bf15915051e330b5c55efc13a66e6dfa8f429dcf'
            '82439498056e8c98254abc6eb6f490b5e65b56c936524dc6117b11e6900a7b17'
            '8cd50e118ee2e7b2aed8af011a7de588908eb55816336ce650f28cc452c19b33'
            '4149937ef8b53f4e273e0fa6f680b2cd585ff957c23bc78e97f263e7e3880a89'
            'f01d01249e0304f3dc7b8415ad58a9a834a742a7295023f6a730212ddfefc4d3'
            'f808b7cb3f2dfc88d9837b8d88078748e0e3d95564824a2df6eeff5ae1776583'
            '075b2115140f3f84d86f8abffc95a1c786be15379e84950a6528a46a726561c3'
            '068e5f8c4ad79917b5499e5a8a2042b4b88d75ded97b8b41c4117cee0c120167'
            'a3ccaf5a4e12906758cc2bd9b8cd4f9f901facf40f56a8a2cdcf371b48be76a4'
            'e61ea4b4a6f2669c9f81fa5b5dfb3632cee9ffd41f3b92f9a8b14eb1d02c5a1c'
            '6fe11fcd7279c001fdafc3c03ae02ee474d73f9f0ae5e4523a2046bd1e8a2a3c'
            'fd90534e310e884ffdeb9c8454513ed646a12bf63479e56cc27385c2470103d1'
            '3ca0b3961f7c3d42eee4ffba4805834b02f9973ec6eb08c91c3f3d85d22703a1')

_binname=zeditor
_appid=dev.zed.Zed

prepare() {
  pushd livekit-rust-sdks
  cp -t webrtc-sys/libwebrtc/patches \
    ../webrtc-0001-do-not-link-against-libatomic.patch \
    ../webrtc-0002-fix-glibcisms.patch \
    ../webrtc-0003-use-system-build-tools.patch \
    ../webrtc-0004-use-opengl-pkg-config.patch \
    ../webrtc-0005-use-eweos-clang-runtime-layout.patch \
    ../webrtc-0006-include-spa-pod-iter.patch
  patch -Np1 -i ../livekit-0001-webrtc-eweos-fixes.patch
  popd

  cd $pkgname-$pkgver

  patch -Np1 -i ../0001-disable-x11-everywhere.patch
  patch -Np1 -i ../0002-use-packaged-cargo-about.patch
  patch -Np1 -i ../0003-use-stable-path-empty-check.patch
  echo -e "\n[patch.'https://github.com/zed-industries/scap']\nzed-scap = { path = '$srcdir/scap' }" >>Cargo.toml
  cargo update -p zed-scap
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

  # `release-fast` profile disables LTO
  cargo build --profile release-fast --frozen --package zed --package cli
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
  install -Dm0755 target/release-fast/cli "$pkgdir/usr/bin/$_binname"
  install -Dm0755 target/release-fast/zed "$pkgdir/usr/lib/$pkgname/zed-editor"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_appid.desktop"
  install -Dm0644 crates/zed/resources/app-icon.png "$pkgdir/usr/share/icons/$pkgname.png"
}
