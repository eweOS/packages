# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-markupsafe
pkgver=2.1.5
pkgrel=1
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=(x86_64 aarch64 riscv64)
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/pallets/markupsafe.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd markupsafe
  python -m build --wheel --no-isolation
}

check() {
  cd markupsafe
  PYTHONPATH=src pytest
}

package() {
  cd markupsafe
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
}
