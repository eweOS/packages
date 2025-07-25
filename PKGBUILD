# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=poppler
pkgname=('poppler' 'poppler-glib' 'poppler-qt6')
pkgver=25.07.0
# 2025.05.07
_testdata_commit=c79c6839e859dbee6b73ac260788fa2de8618ba4
pkgrel=1
pkgdesc='A PDF rendering library based on the xpdf-3.0 code base'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only'
         'GPL-3.0-or-later'
         'LGPL-2.0-or-later'
         'LGPL-2.1-or-later'
         'MIT'
         'HPND-sell-variant')
makedepends=('libjpeg' 'cairo' 'fontconfig' 'openjpeg2'
             'gtk3' 'pkgconf' 'lcms2' 'gobject-introspection' 'icu'
             'qt6-base' 'git' 'nss' 'gpgme' 'gtk-doc' 'curl' 'poppler-data'
             'cmake' 'python' 'boost' 'glib2'
             'freetype2' 'libpng' 'libtiff' 'nspr')
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
source=(https://poppler.freedesktop.org/${pkgbase}-${pkgver}.tar.xz
        test::git+https://gitlab.freedesktop.org/poppler/test.git#commit=$_testdata_commit
)
sha256sums=('c504a9066dbdfebe377ad53cec641fd971ee96c4e1e8ca74e6c9c03d46d817ae'
            'b33c91e6f5ae8539f55b79a5b0ce27a51702fa45957c0a3a4dd695f7dcc497d7')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=ON \
    -DENABLE_QT5=OFF
  cmake --build build
}

check() {
  LANG=en_US.UTF8 ctest --test-dir build --output-on-failure
}

package_poppler() {
  pkgdesc="PDF rendering library based on xpdf 3.0"
  depends=('libjpeg' 'cairo' 'fontconfig' 
           'openjpeg2' 'lcms2' 'nss' 'curl' 'gpgme'
           'nspr' 'libpng' 'freetype2' 'zlib' 'libtiff')
  optdepends=('poppler-data: highly recommended encoding data to display PDF documents with certain encodings and characters')
  provides=('libpoppler.so' 'libpoppler-cpp.so')

  DESTDIR="$pkgdir" cmake --install build

  # cleanup for splitted build
  rm -vrf "${pkgdir}"/usr/include/poppler/{glib,qt6}
  rm -vf "${pkgdir}"//usr/lib/libpoppler-{glib,qt6}.*
  rm -vf "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt6}.pc
  rm -vrf "${pkgdir}"/usr/{lib,share}/gir*
  rm -vrf "${pkgdir}"/usr/share/gtk-doc

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
}

package_poppler-glib() {
  pkgdesc="Poppler glib bindings"
  depends=("poppler=${pkgver}" 'glib2' 'freetype2' 'cairo')
  provides=('libpoppler-glib.so')

  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -vf "${pkgdir}"/usr/lib/libpoppler.*
  rm -vf "${pkgdir}/usr/bin/poppler-glib-demo"

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgbase}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
}

package_poppler-qt6() {
  pkgdesc="Poppler Qt6 bindings"
  depends=("poppler=${pkgver}" 'qt6-base' 'lcms2' 'freetype2')
  provides=('libpoppler-qt6.so')

  cd build
  make -C qt6 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt6.pc "${pkgdir}/usr/lib/pkgconfig/"

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgbase}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
