# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qwt
pkgname=(qwt qwt-docs)
pkgver=6.3.0
pkgrel=1
pkgdesc='Qt Widgets for Technical Applications'
url='https://qwt.sourceforge.io/'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
depends=('qt6-base' 'qt6-svg')
optdepends=('qt6-tools: For Designer plugin')
makedepends=('qt6-tools')
provides=('qwtpolar')
replaces=('qwtpolar')
license=("custom:${pkgbase}")
source=(https://downloads.sourceforge.net/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2)
sha512sums=('fa90686058f5008f6d0365d24a74481bd642e9126d82291f27a5218b684bdcf008ef5e9293b52c5c7d85e9b42027459527be373726e8376a3f707ec85e483064')

prepare() {
  cd ${pkgbase}-${pkgver}

  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i qwtconfig.pri

  sed -i 's/Qt5/Qt6/g' src/src.pro
}

build() {
  cd ${pkgbase}-${pkgver}
  if check_option lto y; then
    qmake6 -config ltcg qwt.pro
  else
    qmake6 qwt.pro
  fi
  make
}

package_qwt() {
  cd ${pkgbase}-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd $srcdir
  mkdir -p doc/usr/share
  mv {$pkgdir,doc}/usr/share/doc
}

package_qwt-docs() {
  mv doc/* "$pkgdir"
}
