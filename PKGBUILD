# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-httplib2
pkgver=0.31.0
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
sha512sums=('3e97ca970b231388c7b29edd1aec7edde4b36266cec1f14c08ab84d6049a075d5cdabccddfc101075c75892db0a042936b298e02f3f8f28079d8a2a28a838f15'
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
