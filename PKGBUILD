# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=firefox
pkgver=132.0.2
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
  fix-venv-activation.patch
  remove-usage-of-pipes.patch
)
sha256sums=('329e1764f4b4e13f11dcf1fd7b3c6d8f80e512e8b7ed5bf65fbe44749c2610e9'
            '7307e32b1b553d43a3f739d5e684d9a32c45f5d7db017860c568984a420f5bb1'
            'b26bb318afbfe42325d81e1c7323541c2558bb151a647c015e72a8d50f0e9bba'
            '18a0f1df76834ac3d4ddb150aa857785df641b54f9fbf0cfb6ffcec64dad72d4'
            'a22ceb0bbf5830d3afbacd656e6893ff0ce455fae5f48c7daa5f836112291ba7'
            '98527320399c5efe4dd0103fa0af3732470700abb515871d28e001edc3e49e7e'
            '8f2d112e8e0e975174396f86ad675fd33da541130f5f1115e27a89322d361c63'
            '9105f3fca96125c52231fc56aad63bf0826c93189392e9743414b2ee4b8db275')
# FIXME: ADD MORE MEMORY!!!
options=(!lto)

prepare() {
  # remove-usage-of-pipes.patch: https://hg.mozilla.org/mozilla-central/rev/7a8dbd4de3c70d6a6ac98469a9b92e4877019e0c
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


