# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=composefs
pkgver=1.0.6
pkgrel=1
pkgdesc="A file system for mounting container images"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/containers/composefs"
license=(
  LGPL-2.1-or-later
  'BSD-2-Clause OR GPL-2.0-or-later'
  'GPL-2.0-only OR Apache-2.0'
  GPL-3.0-or-later
)
depends=(openssl)
makedepends=(fuse3 linux-headers)
checkdepends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d54b302d91a2bf3f2fd0538555aed31ee86b05613d41185f744bbb9218cde4be')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --with-fuse
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  # self-depend to check
  PATH=$srcdir/$pkgname-$pkgver/tools:$PATH
  make -k check -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
