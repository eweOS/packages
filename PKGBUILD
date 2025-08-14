# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-filelock
pkgver=3.19.0
pkgrel=1
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
sha512sums=('30ff39f7db8821835096bac5f6347373c48842387e115f67c49f78958a53e3937530c3a41c7b9b1d9ea9a65608fafaec0cf23f2557eb74dae2b5870cd964d29e')

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
