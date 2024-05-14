# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-dateutil
pkgver=2.9.0
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=(any)
license=(BSD-3-Clause Apache-2.0)
url="https://github.com/dateutil/dateutil"
depends=(python-six tzdata)
makedepends=(python-build
             python-installer
             python-wheel
             python-setuptools-scm
             python-six git)
# FIXME: missing check dependencies
#checkdepends=(python-freezegun
#              python-hypothesis
#              python-pytest)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd dateutil
  # Download the tarball required for running tests
  PYTHONPATH=src python updatezinfo.py
}

build() {
  cd dateutil
  python -m build -wn
}

check() {
  cd dateutil
  # https://github.com/pytest-dev/pytest/issues/5678
  # PYTHONPATH=src pytest -W ignore::pytest.PytestUnknownMarkWarning .
}

package() {
  cd dateutil
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

  # HACK: package_date is not installed via PEP517 while it should
  # https://github.com/dateutil/dateutil/blob/1ae807774053c071acc9e7d3d27778fba0a7773e/setup.cfg#L52
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -Dm0644 -t "$pkgdir/usr/lib/python${python_version}/site-packages/dateutil/zoneinfo/" \
  	"${srcdir}/dateutil/src/dateutil/zoneinfo/dateutil-zoneinfo.tar.gz"
}
