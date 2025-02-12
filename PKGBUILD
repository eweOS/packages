# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qpdf
pkgver=11.10.0
pkgrel=1
pkgdesc="QPDF: A Content-Preserving PDF Transformation System"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/qpdf/qpdf"
license=('Apache-2.0' 'Artistic-2.0')
makedepends=('libjpeg' 'zlib' 'openssl' 'cmake')
source=(https://github.com/qpdf/qpdf/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6295349aa18049f5f970bf0717aa76904ce326b6b14ce230cf96895f0c679fe3')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -D BUILD_STATIC_LIBS:BOOL=OFF \
    -D ENABLE_QTC:BOOL=ON
  make -C build
}

check() {
  cd ${pkgname}-${pkgver}
  make -C build test
}

package() {
  depends=('libjpeg' 'zlib' 'openssl')

  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install 

  install -Dm644 completions/bash/qpdf "${pkgdir}/usr/share/bash-completion/completions/qpdf"
  install -Dm644 completions/zsh/_qpdf "${pkgdir}/usr/share/zsh/site-functions/_qpdf"

  mkdir -m755 -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 {Artistic-2.0,LICENSE.txt} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
