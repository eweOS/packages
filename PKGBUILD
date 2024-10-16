# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=js128
pkgver=128.3.1
pkgrel=1
pkgdesc="JavaScript interpreter and libraries - Version 128"
url="https://spidermonkey.dev/"
arch=(x86_64 aarch64 riscv64)
license=(MPL-2.0)
depends=(
  readline
  sh
  zlib
  nspr
  icu
)
makedepends=(
  cbindgen
  linux-headers
  python
  rust
  zip
)
_relver=${pkgver}esr
source=(
  https://archive.mozilla.org/pub/firefox/releases/$_relver/source/firefox-$_relver.source.tar.xz
  mozconfig
)
sha256sums=('c1f4052f3a88d96a122551d5025053304007f7649886d5e2fdfd1a11ce3d70a8'
            'a76d1f0802ec486c9212f45541cab02aa1027e05d10ccc3becb68eadd762cc3e')

# Make sure the duplication between bin and lib is found
COMPRESSZST+=(--long)

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

  echo "ac_add_options --target=$CARCH-unknown-linux-musl" >> .mozconfig
  echo "ac_add_options --host=$CARCH-unknown-linux-musl" >> .mozconfig

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

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  ./mach build
}

package() {
  cd firefox-$pkgver/obj
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/*.ajs
  find "$pkgdir"/usr/{lib/pkgconfig,include} -type f -exec chmod -c a-x {} +
}
