# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=alsa-utils
pkgver=1.2.9
pkgrel=1
pkgdesc="Advanced Linux Sound Architecturei (ALSA) - Utilities"
arch=(x86_64 aarch64 riscv64)
url="https://www.alsa-project.org"
license=(GPL2)
depends=(alsa-lib ncurses)
makedepends=(alsa-lib ncurses)
options=(emptydirs)
source=($url/files/pub/utils/$pkgname-$pkgver.tar.bz2)
sha512sums=('f46e13fd57ed05ee38d3fa655e57b14335ecf0664dbe03275808383d87d28df153a81151e2e9d8786625f09929c567c89e145508a706a70eeb91ac1b11fb2fd4')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --with-udev-rules-dir=/usr/lib/udev/rules.d
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check()
{
  make -k check -C $pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # dir where to save ALSA state
  install -vdm 755 "$pkgdir/var/lib/alsa/"
}
