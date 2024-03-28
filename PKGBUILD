# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=intltool
pkgver=0.51.0
pkgrel=1
pkgdesc="The internationalization tool collection"
arch=('any')
url="https://launchpad.net/intltool"
license=('GPL')
depends=('perl-xml-parser')
source=(https://launchpad.net/intltool/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz
        intltool-0.51.0-perl-5.26.patch
        intltool-merge-Create-cache-file-atomically.patch
        intltool_distcheck-fix.patch
        intltool-fixrace.patch)
sha256sums=('67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd'
            '458f5d53ac358810879080f69b11649901babcacc14471c243eb850e9436d546'
            '13bd6deb65dc94933f132919d4eea4c24354d7c1c1c9e5930cb6e70c75703763'
            '58cb7d60796bc69c7d0865f106feb589d0271619e62f8741bff6f5ce1a2615ff'
            '5c453ccb8bfe6e0b05d7a55e66dcfa793ea81d9bbe9fdc41f668326ba9310deb')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../intltool-0.51.0-perl-5.26.patch
  patch -Np1 -i ../intltool-merge-Create-cache-file-atomically.patch
  patch -Np1 -i ../intltool_distcheck-fix.patch
  patch -Np1 -i ../intltool-fixrace.patch # https://bugs.launchpad.net/intltool/+bug/1687644
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 doc/I18N-HOWTO "${pkgdir}/usr/share/doc/${pkgname}/I18N-HOWTO"
}
