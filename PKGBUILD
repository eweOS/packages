# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyqt6-sip
pkgver=13.8.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='The sip module support for PyQt6'
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.python.org/packages/source/P/PyQt6-sip/PyQt6_sip-$pkgver.tar.gz)
sha256sums=('2f74cf3d6d9cab5152bd9f49d570b2dfb87553ebb5c4919abfde27f5b9fd69d4')

build() {
  cd PyQt6_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd PyQt6_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
