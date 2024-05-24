# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=capstone
pkgname=(capstone python-capstone)
pkgver=5.0.1
pkgrel=1
pkgdesc='Lightweight multi-platform, multi-architecture disassembly framework'
url='https://www.capstone-engine.org/index.html'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
makedepends=(
  python
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(https://github.com/aquynh/capstone/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('350aba77ce2d96b5c25764913591ba80e4497177ae0a8b2c820c6755ee8310848fbfc54e7ccac27fafc2dbc6778118ad92c53d1b5cb601d4fa146dec7d7e11e5')

build() {
  cd ${pkgbase}-${pkgver}

  CFLAGS+=" ${CPPFLAGS} -ffat-lto-objects"
  make V=1

  cd bindings/python
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_capstone() {
  provides=('libcapstone.so')
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 docs/README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-capstone() {
  depends=('capstone' 'python')
  cd ${pkgbase}-${pkgver}/bindings/python
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ../../LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
