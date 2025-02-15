# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-filelock
pkgver=3.17.0
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
sha512sums=('852c56156890e5e29df4f265743befd98179c9ef9467cb7082476a3af033140376dad6459fcd3fad492787a5ae8f8abf0958fe22694fdb5fe6ec10c077e850c5')

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
