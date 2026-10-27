# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-httplib2
pkgver=0.32.0
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
sha512sums=('b9e1a6b66e274b0eb6bca851d3d83f86ae50b9a8f4c290707bee33cee22c5e5e8a455466357ccc3548f8dbdf14cf8b3a395eb318fd47ac8da1b216234045a6e2'
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
