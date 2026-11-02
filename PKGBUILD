# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-httplib2
pkgver=0.32.1
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
# 0001: Downstream, use system certificates instead of the vendored one as
#	fallback
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  0001-certs-use-system-certificates.patch
)
sha512sums=('c7c95227bd601d1ed9eb247fc7400d6ced7e0caa7a1698da4078c6929c6314aae90895715a9bd7db741713ac97e776409a2e61af11d8ae4b2a33274a09e0417d'
            'b8cc1d5c9677bd2385ddd98f03fde37eadcff50405c745a444829652595c2593e4f05ee069e8ba1180a9143999890f34cd3f93b66e0d24b2c643b7d33e6ff1b4')

prepare() {
  _patch_ "$pkgname"

  cd "$pkgname"
  # Remove vendored certificates
  rm -vf httplib2/cacerts.txt

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
