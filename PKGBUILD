# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=libevdev
pkgname=python-$_name
pkgver=0.13.1
pkgrel=1
pkgdesc='Python wrapper for libevdev'
arch=(any)
url=https://python-libevdev.readthedocs.io
license=(MIT)
depends=(libevdev python)
makedepends=(python-build python-hatchling python-installer)
checkdepends=(python-pytest)
source=(https://gitlab.freedesktop.org/$_name/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=(2eb3688fc52244330c4837f0e446122b9726da777a3f301fe3b0c73f92202036)

build() {
  cd $pkgname-$pkgver
  python -m build -wn
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  local sitepkgs=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -d "$pkgdir"/usr/share/licenses
  ln -s $sitepkgs/$_name-$pkgver.dist-info/licenses/COPYING "$pkgdir"/usr/share/licenses/$pkgname
}
