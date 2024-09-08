# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.text
# https://github.com/jaraco/jaraco.text/blob/main/NEWS.rst
pkgver=4.0.0
pkgrel=1
pkgdesc='Module for text manipulation'
arch=('any')
url='https://github.com/jaraco/jaraco.text'
license=('MIT')
depends=('python' 'python-more-itertools' 'python-inflect' 'python-jaraco.context' 'python-jaraco.functools' 'python-autocommand')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("https://github.com/jaraco/jaraco.text/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b818731b5e74f8d1a2feacee87ba20ca401f9a3aab74e6d642e3ac224b6b80aee541de064cf79cac7334fb7c13505b9b8aa08afa5e7f3697973505a2f3a8b664')

build() {
  cd "$srcdir/jaraco.text-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/jaraco.text-$pkgver"
  PYTHONPATH="$PWD" python -m pytest
}

package() {
  cd "$srcdir/jaraco.text-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
