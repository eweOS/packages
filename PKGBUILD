# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=setuptools
pkgname=python-setuptools
pkgver=69.1.0
pkgrel=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
depends=('python')
url="https://github.com/pypa/$pkgbase"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ee8e1f99380d2ddd2a60bb587e6c9e853ae84509a5176cd35e23de00436abc4')

build() {
  cd $pkgbase-$pkgver
  python setup.py build
}

package() {
  cd $pkgbase-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
}
