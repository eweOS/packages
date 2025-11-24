# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tomli
pkgver=2.3.0
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bd39f9ef09bf43dc48787541ef96781459f66899fab12f72b24e57ef13a8975e135b6a90b0ed7f44c0c3171a4b3afbe0c8a2a8ffeace4255771a0f331288835e')

build() {
  cd tomli-$pkgver
  python -m build -wn --skip-dependency-check
}

check() {
  cd tomli-$pkgver
  PYTHONPATH="$PWD"/src python -m unittest
}

package() {
  cd tomli-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
