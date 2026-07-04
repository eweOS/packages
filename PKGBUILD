# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=firefox
pkgver=149.0.2
pkgrel=3
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
#	-visibility-inlines-hidden with Clang, or linking fails with libc++
# 0002: Should be upstreamed, fix WebRTC linking failures when X11 is disabled
#	on loongarch64
#	TODO: RISC-V has similar issues in buildscript and should be fixed as
#	as well.
# 0003: Backport, fix unsupported code model in vendored brotli source on
#	loongarch64.
#	See also https://github.com/google/brotli/pull/1368
# 0004: Under review in libwebrtc upstream. Don't include kernel header
#	(asm/prctl.h) when corresponding libc header (sys/prctl.h) is already
#	included since they may ship conflicting definitions.
#	See also https://webrtc-review.googlesource.com/c/src/+/436140
# 0005: Should be upstreamed to libwebrtc, fix compilation errors about unknown
#	type "pid_t" caused by missing header inclusion.
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
  mozconfig
  firefox.desktop
  distribution.ini
  0001-enable-visibility-hidden-for-clang.patch
  0002-third_party-webrtc-Build-Wayland-Screen-Capturer-on-.patch
  0003-disable-BROTLI_MODEL-macro-for-some-targets.patch
  0004-musl-linux-Don-t-import-conflicting-libc.patch
  0005-libwebrtc-desktop_capture-Add-missing-include-to-sys.patch
)
sha256sums=('6a931a2cf087164c689099c3856b3091a7e156a7b94fab8ab5712affe87870ce'
            '5efe32a0f0d8c7219cd9f58e5fc9aa9f388457dff4e4bfdd372b13456cce3f2b'
            '18a0f1df76834ac3d4ddb150aa857785df641b54f9fbf0cfb6ffcec64dad72d4'
            'a22ceb0bbf5830d3afbacd656e6893ff0ce455fae5f48c7daa5f836112291ba7'
            'c8b1597c550a54b7739f73f53683cf338d41ffaa4b3c95960d295d2efd8e0591'
            'e25999a4a3dd9aa27e3378b76faa11a62d47e2887af781608ec4c4dd8e0a812d'
            '3a71579eb02030502a6fd474018762a7b2b51128c388021c5e391fda780aaee0'
            '170bf42a464f85343b6da3c9aecca5f429311111f4bbad6e27a43947f25722cd'
            '6363d9d9000a69589b98a265cdab9de8d57680e60a624fe62259af80e323953e')
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
  # firefox 147.0 or later requires C++ 20 to build
  CXXFLAGS="$CXXFLAGS -std=gnu++20"

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


