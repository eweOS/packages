# Maintainer: Yukari Chiba <i@0x7f.cc>

# NOTE: this package is fully statically linked to work in containers
pkgname=catatonit
pkgver=0.2.1
pkgrel=1
pkgdesc="A container init that is so simple it's effectively brain-dead."
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/openSUSE/catatonit/"
license=(GPL-2.0-or-later)
source=(
  $pkgname-$pkgver.tar.xz::https://github.com/openSUSE/catatonit/releases/download/v$pkgver/$pkgname.tar.xz
)
sha256sums=('9950425501af862e12f618bdc930ea755c46db6a16072a1462b4fc93b2bd59bc')

prepare(){
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make V=1
}

package() {
  make PREFIX=/usr DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vdm 755 "$pkgdir/usr/lib/podman/"
  ln -sv /usr/bin/$pkgname "$pkgdir/usr/lib/podman/"
}
