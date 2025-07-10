# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=firefox
pkgver=140.0.4
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
url="https://www.mozilla.org/firefox/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL-2.0)
depends=(
  dbus
  ffmpeg
  gtk3
  libpulse
  pixman
  libffi
  libjpeg
  libevent
  libvpx
  nss
  libpng
  libwebp
  zlib-ng
)
makedepends=(
  cbindgen
  clang
  linux-headers
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
)
# 0001: Downstream, enable usage of -fvisibility=hidden and
#	-visibility-inlines-hidden with Clang
# 0002: Should be upstreamed, workaround libyuv link failures caused by
#	Clang-20's different behavior when both -mno-lsx and -march=la464 are
#	specified
#	https://github.com/loongson-community/discussions/issues/95
# 0003: Should be upstreamed, fix WebRTC linking failures when X11 is disabled
#	on loongarch64
#	TODO: RISC-V has similar issues in buildscript and should be fixed as
#	as well.
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
  mozconfig
  firefox.desktop
  distribution.ini
  0001-enable-visibility-hidden-for-clang.patch
  0002-media-libyuv-Disable-LSX-LASX-by-defining-feature-ma.patch
  0003-third_party-webrtc-Build-Wayland-Screen-Capturer-on-.patch
)
sha256sums=('4027beb34f43ce4da8c0053a1d740ec6a2e766dc8b700216316aa7adcc59e377'
            '5efe32a0f0d8c7219cd9f58e5fc9aa9f388457dff4e4bfdd372b13456cce3f2b'
            '18a0f1df76834ac3d4ddb150aa857785df641b54f9fbf0cfb6ffcec64dad72d4'
            'a22ceb0bbf5830d3afbacd656e6893ff0ce455fae5f48c7daa5f836112291ba7'
            '98527320399c5efe4dd0103fa0af3732470700abb515871d28e001edc3e49e7e'
            '1f1d66aaaea3ebab5cb28c914dfa13dc8323fb5ba774c1bec059e4d073ae9374'
            '5a535cb838af85677ff6e0623e6611b6c1de4ad9b0aeb22e0b17cb8721ee159b')
# FIXME: ADD MORE MEMORY!!!
options=(!lto)

prepare() {
  _patch_ firefox-$pkgver

  # Make it easier to retry building
  [ -d mozbuild ] || mkdir mozbuild
  cd firefox-$pkgver

  cp $srcdir/mozconfig .mozconfig
  echo "mk_add_options MOZ_OBJDIR=${PWD@Q}/obj" >> .mozconfig

  # do not pip install glean-sdk
  sed -i '/pypi-optional/d' python/sites/mach.txt
}

build() {
  cd firefox-$pkgver

  echo "ac_add_options --target=$CARCH-unknown-linux-musl" >> .mozconfig
  echo "ac_add_options --host=$CARCH-unknown-linux-musl" >> .mozconfig

  # elf-hack does not exists on loongarch64 and riscv64
  ([ $CARCH != "loongarch64" ] && [ $CARCH != "riscv64" ]) || sed -i '/elf-hack/d' .mozconfig

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1
  export CXXSTDLIB=c++

  # set rpath so linker finds the libs
  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/firefox"
  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  ./mach build
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 $srcdir/distribution.ini "$distini"

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/${pkgname//-/}.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sfv "/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"
}


