# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=wqy-microhei
pkgbase=font-wqy-microhei
pkgname=ttf-wqy-microhei
pkgver=0.2.0_beta
pkgrel=1
pkgdesc="A Sans-Serif style high quality CJK outline font"
arch=('any')
license=('GPL3' 'APACHE' 'custom:"font embedding exception"')
url="https://wenq.org"
source=("https://downloads.sourceforge.net/project/wqy/${_pkgbase}/${pkgver//_/-}/${_pkgbase}-${pkgver//_/-}.tar.gz"
        '44-wqy-microhei.conf')
sha512sums=('c1e09c83f6427f637b3c93c7f89e427bde7fb22cedcfbb806fb036f13a553551f28d985516c7ab4c2602b4159502de36b52e6cc9b41c9b6d6e36778a6de74037'
            '692940f586aef5ea7156938b0ed2e824cea0bb4f3a9e6d3b447c4c798f9e774bdf1a93f0d005822a95e4f1ed647e8d10b650ebb7032626b4382f9a2d7bb7417f')

build() {
  cd ${_pkgbase}
  tail README.txt -n 16|head -n -3>| FONTEXCEPTION
}

package() {
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  install -Dm644 "$srcdir"/44-wqy-microhei.conf "$pkgdir"/usr/share/fontconfig/conf.avail/44-wqy-microhei.conf
  install -Dm644 "$srcdir"/${_pkgbase}/wqy-microhei.ttc "$pkgdir"/usr/share/fonts/wenquanyi/${_pkgbase}/wqy-microhei.ttc
  install -Dm644 "$srcdir"/${_pkgbase}/FONTEXCEPTION "$pkgdir"/usr/share/licenses/$pkgname/FONTEXCEPTION
  ln -s ../conf.avail/44-wqy-microhei.conf "$pkgdir"/usr/share/fontconfig/conf.default/44-wqy-microhei.conf
}
