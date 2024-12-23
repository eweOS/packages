# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qscintilla
pkgname=(qscintilla-qt6 python-qscintilla-qt6)
pkgver=2.14.1
pkgrel=1
license=(GPL)
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.riverbankcomputing.com/software/qscintilla/intro'
makedepends=(python-pyqt6 qt6-tools sip pyqt-builder)
source=(https://www.riverbankcomputing.com/static/Downloads/QScintilla/$pkgver/QScintilla_src-$pkgver.tar.gz)
sha256sums=('dfe13c6acc9d85dfcba76ccc8061e71a223957a6c02f3c343b30a9d43a4cdd4d')

build() {
  if check_option lto y; then
     _LTO_OPTIONS="-config ltcg"
     _SIP_LTO_OPTIONS="--qmake-setting CONFIG+=ltcg"
  else
    _LTO_OPTIONS=""
    _SIP_LTO_OPTIONS=""
  fi
      
  cd QScintilla_src-$pkgver/src
  export QMAKEFEATURES=$PWD/features/
  qmake6 ${_LTO_OPTIONS}
  make

  cd ../designer
  qmake6 ${_LTO_OPTIONS} INCLUDEPATH+=../src QMAKE_LIBDIR+=../src
  make

  cd ../Python
  mv pyproject{-qt6,}.toml
  LD_LIBRARY_PATH=$PWD/../src sip-build \
    --no-make \
    --qsci-features-dir ../src/features \
    --qsci-include-dir ../src \
    --qsci-library-dir ../src \
    --qmake=/usr/bin/qmake6 \
    --verbose \
    ${_SIP_LTO_OPTIONS}
  cd build
  make
}

package_qscintilla-qt6() {
  pkgdesc="A port to Qt6 of Neil Hodgson's Scintilla C++ editor class"
  depends=(qt6-base)

  cd QScintilla_src-$pkgver/src
  make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install

  cd ../designer
  make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}

package_python-qscintilla-qt6() {
  pkgdesc='Python bindings for QScintilla2'
  depends=(qscintilla-qt6 python-pyqt6)

  cd QScintilla_src-$pkgver/Python/build
  make INSTALL_ROOT="$pkgdir" install
}
