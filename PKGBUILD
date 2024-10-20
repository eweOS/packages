# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.text
# https://github.com/jaraco/jaraco.text/blob/main/NEWS.rst
pkgver=4.0.0
pkgrel=3
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
sha512sums=('a08395ea1fab5aac0bf8fdef8225794b311ca7c8210fccda09a98298501cd695be1834355e31ed7457d1752c59e65da7d29b93ab292f7816d88b04465c561803')

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
