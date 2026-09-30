# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=pythran
pkgname=python-$_name
pkgver=0.19.0
pkgrel=1
pkgdesc='An ahead of time compiler for a subset of the Python language, with a focus on scientific computing'
arch=(any)
url=https://pythran.readthedocs.io
license=(BSD-3-Clause)
depends=(boost python python-beniget python-gast python-numpy python-ply python-setuptools xsimd)
makedepends=(python-build python-installer)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/serge-sans-paille/$_name/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(c4a716d775d4cc1821fecd44278df79115a0e2bf140f823b7e4990c700b9e7ae)

prepare() {
  rm -r $_name-$pkgver/$_name/{boost,xsimd}
}

build() {
  cd $_name-$pkgver
  python -m build -wn
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  local sitepkgs=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -d "$pkgdir"/usr/share/licenses
  ln -s $sitepkgs/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
