# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tomli
pkgver=2.0.2
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3eeea334d6d225590a9e074685c65d052e2f5d5286ca895ff7e9532d7289f0daa31ae67b5076d803e5adad4f20a9831058a0c4599715f049079904934d3d9c25')

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
