# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=poppler
pkgname=('poppler' 'poppler-glib' 'poppler-qt6')
pkgver=24.12.0
pkgrel=1
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
        test::git+https://gitlab.freedesktop.org/poppler/test.git#commit=ff3133cdb6cb496ee1d2c3231bfa35006a5e8410
)
sha256sums=('1cf374c3146f3f685d9257701bf0c2866c61d6c202c14d1f5c01a1f3a089028a'
            '0efc9bd1797f0f0dfa514d4109e82c99d7e98c3e95587c70945508493074fcdf')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=ON \
    -DENABLE_QT5=OFF \
    -DENABLE_LIBOPENJPEG=unmaintained
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
