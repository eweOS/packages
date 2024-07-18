pkgname=shellcheck-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A static analysis tool for shell scripts'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/koalaman/shellcheck'
license=(GPL-3.0-or-later)
provides=('shellcheck')
conflicts=('shellcheck')
source=("https://github.com/koalaman/shellcheck/releases/download/v${pkgver}/shellcheck-v${pkgver}.linux.x86_64.tar.xz")
sha256sums=('6c881ab0698e4e6ea235245f22832860544f17ba386442fe7e9d629f8cbedf87')

package()
{
  cd shellcheck-v${pkgver}
  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/licenses/${pkgname}
  install -m0755 shellcheck ${pkgdir}/usr/bin/
  install -m0644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
