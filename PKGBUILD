# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=firefox
pkgver=128.0
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
# https://raw.githubusercontent.com/chimera-linux/cports/1c8c59ac6e9626d6a35cdee714ed0a2f75d0b8b6/contrib/firefox/patches/lolmalloc.patch
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
  mozconfig
  lolmalloc.patch
  firefox.desktop
  distribution.ini
  visibility.patch
)
sha256sums=('65271ffefb235ea1e162a081f2074a0f06fce27b2f613f573c126ba8eef95172'
            '7307e32b1b553d43a3f739d5e684d9a32c45f5d7db017860c568984a420f5bb1'
            '84c490d8314fcc2b37ade636d6ae8467980c07caa351c65d06bf71a65ba01d9d'
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

  echo "ac_add_options --target=$CARCH-unknown-linux-musl" >> .mozconfig
  echo "ac_add_options --host=$CARCH-unknown-linux-musl" >> .mozconfig

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


