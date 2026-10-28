# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.text
# https://github.com/jaraco/jaraco.text/blob/main/NEWS.rst
pkgver=4.3.0
pkgrel=1
pkgdesc='Module for text manipulation'
arch=('any')
url='https://github.com/jaraco/jaraco.text'
license=('MIT')
depends=('python' 'python-more-itertools' 'python-inflect'
         'python-jaraco.context' 'python-jaraco.functools' 'python-autocommand')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm'
             'python-wheel' 'git')
checkdepends=('python-pytest')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('981148ec1676b17fb301840652e46a03eb4717ae7b9c2c065261da00052d0e6854ac1071a9237288462f1afe53414c37454a889ae64cc71086908b7840a7b6de')

build() {
  cd "$srcdir/jaraco.text"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/jaraco.text"
  PYTHONPATH="$PWD" python -m pytest
}

package() {
  cd "$srcdir/jaraco.text"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
