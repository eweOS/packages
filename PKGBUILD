# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=capstone
pkgname=(capstone python-capstone)
pkgver=5.0.6
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
sha512sums=('d4ed08a2ab4ed8ede51a163e98542129d6441889cf6936ac9e3f8027fb2dfcbb04a7aacba14c2a007e788790bb3939c173b47db3d95f5dd9eafce2f30ff493e1')

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
