# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fakeroot
pkgver=1.29
pkgrel=1
pkgdesc='Tool for simulating superuser privileges'
arch=('x86_64')
license=('GPL')
url='https://tracker.debian.org/pkg/fakeroot'
groups=('base-devel')
depends=('musl' 'filesystem' 'util-linux')
makedepends=('libcap')
source=("https://deb.debian.org/debian/pool/main/f/$pkgname/${pkgname}_${pkgver}.orig.tar.gz" musl.patch)
sha256sums=('SKIP' 'SKIP')

build() {
  cd $pkgname-$pkgver
  patch -p1 < ${srcdir}/musl.patch
  ./configure --prefix=/usr \
    --libdir=/usr/lib/libfakeroot \
    --disable-static \
    --with-ipc=sysv
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/etc/ld.so.conf.d/"
  echo '/usr/lib/libfakeroot' > "$pkgdir/etc/ld.so.conf.d/fakeroot.conf"
}
