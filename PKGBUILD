# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=setconf
pkgver=0.7.8
pkgrel=1
pkgdesc='Utility for easily changing settings in configuration files'
arch=(any)
url='https://setconf.roboticoverlords.org/'
license=(GPL2)
depends=(python)
source=("https://setconf.roboticoverlords.org/$pkgname-$pkgver.tar.xz")
sha256sums=('858bdf8fc1d351c2e5c95bc629a6fbc9ef5f89ac906f3f31e7117299e57917be')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
