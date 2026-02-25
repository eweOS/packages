# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mozjs
pkgver=140.5.0
pkgrel=2
pkgdesc="JavaScript interpreter and libraries - Version 128"
url="https://spidermonkey.dev/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL-2.0)
depends=(
  llvm-libs
  musl
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
provides=("js${pkgver%%.*}")
_relver=${pkgver}esr
# 0001: downstream workaround, see https://bugzilla.mozilla.org/show_bug.cgi?id=1935621
source=(
  https://archive.mozilla.org/pub/firefox/releases/$_relver/source/firefox-$_relver.source.tar.xz
  mozconfig
  0001-fix-venv-activation.patch
  0001-Bug-1973994-mozjs-140.pc-does-not-contain-DXP_UNIX-o.patch
)
sha256sums=('832b7ef3e5f7a2430e0ba0b9000dab6fdd8f65bccff8bcf7eeb9ed16e6d310e2'
            'a76d1f0802ec486c9212f45541cab02aa1027e05d10ccc3becb68eadd762cc3e'
            '8f2d112e8e0e975174396f86ad675fd33da541130f5f1115e27a89322d361c63'
            'b5178a7b8a603b645cbae61467f3fa1fef6e9f34c90e4a22faf4ea2152a50fba')

# Make sure the duplication between bin and lib is found
COMPRESSZST+=(--long)

_clear_vendor_checksums() {
	sed -i 's/\("files":{\)[^}]*/\1/' third_party/rust/$1/.cargo-checksum.json
}

prepare() {
  mkdir mozbuild
  _patch_ firefox-$pkgver

  cd firefox-$pkgver
  _clear_vendor_checksums libc

  echo "ac_add_options --target=$CARCH-unknown-linux-musl" >> .mozconfig
  echo "ac_add_options --host=$CARCH-unknown-linux-musl" >> .mozconfig

  cp $srcdir/mozconfig .mozconfig
  echo "mk_add_options MOZ_OBJDIR=${PWD@Q}/obj" >> .mozconfig

  # do not pip install glean-sdk
  sed -i '/pypi-optional/d' python/sites/mach.txt
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
