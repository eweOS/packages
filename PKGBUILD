# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=capstone
pkgname=(capstone python-capstone)
pkgver=5.0.7
pkgrel=2
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
sha512sums=('e09788d7dfca281f8f3773323d72e1157df777878d59ace6a8996495d505dec10051ce002f473fa5ff8aa60d5e6bb4cff5e55faffb074643cae7c4515e324994')

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
