# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=installer
pkgname=python-$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc='Low-level library for installing a Python package from a wheel distribution'
arch=('any')
url='https://github.com/pypa/installer'
license=('MIT')
depends=('python')
makedepends=('git' 'python-flit-core' 'python-build')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('8b237594ff4812c4718c72bf1eb1a0ef1cbdb40f601f9ed1df437733bdfcf2fe14fb9a9769aeda3ec8807d21f9d6aa8e6d418dad86d81102fec43f2eb50dba94')

build() {
  cd $_pkgname-$pkgver
  python -m build -wn --skip-dependency-check
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH=src python -m pytest
}

package() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src python -m installer --destdir="$pkgdir" dist/*.whl

  # remove windows entrypoint scripts executables
  rm "$pkgdir"/usr/lib/python*/site-packages/installer/_scripts/*.exe

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
