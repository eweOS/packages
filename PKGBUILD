# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-filelock
pkgver=3.20.0
pkgrel=2
pkgdesc="A platform independent file lock"
url="https://github.com/benediktschmitt/py-filelock"
license=('custom:Unlicense')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
#checkdepends=(
#  'python-pytest'
#  'python-pytest-timeout'
#  'python-pytest-mock'
#  'python-pytest-asyncio'
#  'python-virtualenv'
#)
source=("git+https://github.com/benediktschmitt/py-filelock.git#tag=$pkgver")
sha512sums=('dd13674fcd51353d549462435a023347f898d53392efbc064fce3fcc8720af9f2e36c8a2e9eeaa8582f7bc6410537aca258dc9ea9c432d0eba127eb9e6b2216c')

build() {
  cd py-filelock
  python -m build --wheel --no-isolation
}

#FIXME: missing python-virtualenv
#check() {
#  cd py-filelock
#  PYTHONPATH=src pytest tests
#}

package() {
  cd py-filelock
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
