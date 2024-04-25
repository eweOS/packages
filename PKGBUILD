# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=firefox
pkgver=124.0
pkgrel=2
pkgdesc="Standalone web browser from mozilla.org"
url="https://www.mozilla.org/firefox/"
arch=(x86_64 aarch64 riscv64)
license=(MPL-2.0)
depends=(
  dbus
  ffmpeg
  gtk3
  libpulse
  nss
)
makedepends=(
  cbindgen
  clang
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
# https://raw.githubusercontent.com/chimera-linux/cports/1c8c59ac6e9626d6a35cdee714ed0a2f75d0b8b6/contrib/firefox/patches/lolmalloc.patch
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
  mozconfig
  lolmalloc.patch
  res_nquery.patch
  firefox.desktop
  distribution.ini
  visibility.patch
)
sha256sums=('345a1235123ad808cecdb4a9af09ea48bf52ad09d3d380fc704406e3dd13c9d8'
            '3fa5049fe26dba8f18e1d21be70b238f24bca79462ecfa5be348639f8dc9a620'
            '84c490d8314fcc2b37ade636d6ae8467980c07caa351c65d06bf71a65ba01d9d'
            '7a9e1e0b60879983c81148e59a44074e3f5cd805b2c16d1d2211336b3af04e51'
            '18a0f1df76834ac3d4ddb150aa857785df641b54f9fbf0cfb6ffcec64dad72d4'
            'a22ceb0bbf5830d3afbacd656e6893ff0ce455fae5f48c7daa5f836112291ba7'
            '98527320399c5efe4dd0103fa0af3732470700abb515871d28e001edc3e49e7e')
# FIXME: ADD MORE MEMORY!!!
options=(!lto)

prepare() {
  _patch_ firefox-$pkgver

  mkdir mozbuild
  cd firefox-$pkgver

  cp $srcdir/mozconfig .mozconfig
  echo "mk_add_options MOZ_OBJDIR=${PWD@Q}/obj" >> .mozconfig
}

build() {
  cd firefox-$pkgver

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


