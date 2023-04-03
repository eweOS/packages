pkgname=shellcheck-bin
pkgver=0.7.2
pkgrel=1
pkgdesc='A static analysis tool for shell scripts'
arch=(x86_64 aarch64)
url='https://github.com/koalaman/shellcheck'
license=(GPL3)
provides=('shellcheck')
conflicts=('shellcheck')
source=("https://github.com/koalaman/shellcheck/releases/download/v${pkgver}/shellcheck-v${pkgver}.linux.x86_64.tar.xz")
sha256sums=('70423609f27b504d6c0c47e340f33652aea975e45f312324f2dbf91c95a3b188')

package()
{
  cd shellcheck-v${pkgver}
  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/licenses/${pkgname}
  install -m0755 shellcheck ${pkgdir}/usr/bin/
  install -m0644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
