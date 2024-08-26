# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-smartypants
_pkgname=smartypants
pkgver=2.0.1
pkgrel=1
pkgdesc="Python with the SmartyPants"
url="https://github.com/leohemsted/smartypants.py"
license=('BSD-2-Clause')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
sha512sums=('d47a866a5478c3520251f87a93a468a5eea10318b24b2e8d4bc918d533b5a5789aa56d3a8d5fb8ccff9572fb63e5b6f2eafc44f93fb57a19e6621ebef5d64d9d')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leohemsted/${_pkgname}.py/archive/v${pkgver}.tar.gz")

package() {
  cd "$srcdir/${_pkgname}.py-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
