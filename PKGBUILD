# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=seatd
pkgver=0.9.3
pkgrel=1
pkgdesc="A minimal seat management daemon, and a universal seat management library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://sr.ht/~kennylevinsen/seatd/"
license=('MIT')
makedepends=('meson' 'ninja' 'scdoc' 'linux-headers')
source=(
  "$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/$pkgname/archive/$pkgver.tar.gz"
  seatd.service
  seatd.sysusers
)
sha256sums=('302564d54d8e28191fadfd734f2675ecb0c9e0615a58011b89ef15dfa4dbaa96'
            'd4c77303b13441280599f87546b3b243cd786cb70452661f6990eb2577dc4257'
            'e833292adf5da25b5258a5209c258f0e4c12e1d6fe81cf228fd0cfb575080d78')

build()
{
  CFLAGS="${CFLAGS} -Wno-sign-compare" \
    ewe-meson $pkgname-$pkgver build \
    -D libseat-logind=disabled \
    -D examples="disabled"
  ninja -C build
}

check()
{
  ninja -C build test
}

package()
{
  DESTDIR="$pkgdir/" meson install -C build
  _dinit_install_services_ $srcdir/seatd.service

  # install seatd as dependency of greetd
  install -d $pkgdir/usr/lib/dinit.d/greetd.d
  ln -s ../seatd $pkgdir/usr/lib/dinit.d/greetd.d/

  _install_sysusers_ $srcdir/seatd.sysusers
  _install_license_ $srcdir/$pkgname-$pkgver/LICENSE
}
