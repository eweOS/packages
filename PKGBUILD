# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-iniconfig
pkgver=2.0.0
pkgrel=1
pkgdesc="brain-dead simple config-ini parsing"
url="https://github.com/RonnyPfannschmidt/iniconfig"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd iniconfig
  python -m build -nw
}

check() {
  cd iniconfig
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd iniconfig
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
