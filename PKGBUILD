# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-httplib2
pkgver=0.22.0
pkgrel=1
pkgdesc='Comprehensive HTTP client library, supporting many features'
arch=('any')
url='https://github.com/httplib2/httplib2'
license=('MIT')
depends=(
  'ca-certificates'
  'python'
  'python-pyparsing'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
#checkdepends=(
#  'flake8'
#  'python-pytest-cov'
#  'python-pytest-forked'
#  'python-pytest-timeout'
#  'python-pytest-xdist'
#  'python-pytest-randomly'
#  'python-future'
#  'python-cryptography'
#  'python-six'
#)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  'use-system-certificates.patch'
)
sha512sums=('19c5ad43141c9e042cf81ee84ac5c6ee8f57a89656042708e86f8b098456df1752bdcddf0830b3514871cf9a488ebd374d3742cc21621169f1ea15c881b2a4ad'
            '012c74d59e3138b88824abe0bb62ad1b6b9a9b98e001913c2be8a36eaa9191213f768635a9165b2a8eb76726dcbc6c6bae0f18dccb969ff29364e16304a22ed5')

prepare() {
  cd "$pkgname"

  # use system ca certificates
  patch -p1 -i "$srcdir/use-system-certificates.patch"
  rm -vf python{2,3}/httplib2/cacerts.txt

  # patch requirements to allow newer versions of checkdepends
  sed -e 's/==/>=/' -i requirements-test.txt
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
