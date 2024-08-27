# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=capstone
pkgname=(capstone python-capstone)
pkgver=5.0.3
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
sha512sums=('2fd3194dd37065e6091d208c7670b12c0ca6872931eef794bd6b2dd624601c843e8ee6c5714eae0372e394e91a9bc1e4de7dfea6b1087542dd461226569101de')

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
