# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=scikit-build-core
pkgname=python-$_name
pkgver=1.0.3
pkgrel=1
pkgdesc='A next generation Python CMake adaptor and Python API for plugins'
arch=(any)
url=https://scikit-build-core.readthedocs.io
license=(Apache-2.0)
depends=(cmake ninja python python-packaging python-pathspec)
makedepends=(python-build python-hatch-vcs python-installer)
source=($pkgname-$pkgver.tar.gz::https://github.com/scikit-build/$_name/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(32954222ccaaac8b02a0490eecb9eba38cca2b850f365b576666b2bcae66ce84)

build() {
  cd $_name-$pkgver
  python -m build -wn
}

package() {
  cd $_name-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  local sitepkgs=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -d "$pkgdir"/usr/share/licenses
  ln -s $sitepkgs/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
