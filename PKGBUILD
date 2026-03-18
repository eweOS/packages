# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=python-pkgconfig
pkgver=1.6.0
pkgrel=1
pkgdesc='Python module to interface with the pkg-config command line tool'
arch=(any)
url='https://github.com/matze/pkgconfig'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-setuptools)
source=(https://pypi.io/packages/source/p/pkgconfig/pkgconfig-$pkgver.tar.gz)
sha256sums=('4a5a6631ce937fafac457104a40d558785a658bbdca5c49b6295bc3fd651907f')

build() {
  cd pkgconfig-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd pkgconfig-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
