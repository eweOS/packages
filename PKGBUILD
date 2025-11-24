# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-markupsafe
pkgver=3.0.3
pkgrel=1
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/pallets/markupsafe.git#tag=$pkgver")
sha512sums=('5e44751c237a5829f17ad49b3068486e7d3e24e2d1d88444216ccc1354e195ae9b70292c82af0d88af6b52a747092325541d96c30c2c94684b488e019a07dc1d')

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
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
