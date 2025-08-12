# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(
  otf-noto-cjk
  otf-noto-cjk-variable
)
pkgbase=font-noto-cjk
pkgver=20230817
_commit=4efc595762d1f4b4fa504bccfe8e59de91fda063
pkgrel=2
pkgdesc='Google Noto CJK fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:SIL)
makedepends=(git)
source=(git+https://github.com/googlefonts/noto-cjk.git#commit=$_commit
        70-noto-cjk.conf)
sha256sums=('SKIP'
            '2417ac0e6720fe8da55ee59f16e36cfe96737bc21432460a322bb0f395e3a521')

package_otf-noto-cjk() {
  cd noto-cjk
  install -Dm644 ./{Sans,Serif}/OTC/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 ./Sans/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/70-noto-cjk.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}

package_otf-noto-cjk-variable() {
  pkgdesc+=" - variable font"
  provides=(otf-noto-cjk)
  conflicts=(otf-noto-cjk)
  cd noto-cjk
  install -Dm644 ./{Sans,Serif}/Variable/OTC/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 ./Sans/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/70-noto-cjk.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}
