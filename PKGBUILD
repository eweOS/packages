# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-filelock
pkgver=3.16.1
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
sha512sums=('09195653115069df8d848fb37ff08587aeafc7123f1dd5681bcc9af844e4c5793ca44409d70d3185389219659033f676ac3c57f62dfa36f39f139bce77afec4c')

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
