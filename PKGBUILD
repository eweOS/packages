# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-smartypants
_pkgname=smartypants
pkgver=2.0.2
pkgrel=1
pkgdesc="Python with the SmartyPants"
url="https://github.com/leohemsted/smartypants.py"
license=('BSD-2-Clause')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
sha512sums=('6cdb1574145f4c15984550c2b10bc95b7a86baf067f6465d53e60696347a650e6afb978f623f2344d82e03281ecb28a1f94cdb759fd2db613dc13fada1b25485')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leohemsted/${_pkgname}.py/archive/v${pkgver}.tar.gz")

package() {
  cd "$srcdir/${_pkgname}.py-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
