# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=capstone
pkgname=(capstone python-capstone)
pkgver=5.0.8
pkgrel=1
pkgdesc='Lightweight multi-platform, multi-architecture disassembly framework'
url='https://www.capstone-engine.org/index.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
makedepends=(
  python
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(https://github.com/aquynh/capstone/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('f02204de6976bdfa9c356fa81ed6324ac51fcf5337b3e2ee4d4eaa40bf472b5fa048c62451d0ef834e8513c8c29e7577d825492fba39c6c3d10e9525a4154500')

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
