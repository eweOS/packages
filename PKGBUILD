# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pyqt6-sip
pkgver=13.13.1
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
source=(https://pypi.python.org/packages/source/P/PyQt6-sip/pyqt6_sip-$pkgver.tar.gz)
sha256sums=('83c3c9cb93b6c631af7048084fb0f234b610a01edbf9b2b44c4ee4bda4197efe')

build() {
  cd pyqt6_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd pyqt6_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
