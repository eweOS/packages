# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pyxdg
pkgname=python-pyxdg
pkgver=0.28
pkgrel=1
pkgdesc="Python library to access freedesktop.org standards"
arch=('any')
url="http://freedesktop.org/Software/pyxdg"
license=("LGPL")
depends=('python')
conflicts=('python-xdg')
provides=('python-xdg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('3267bb3074e934df202af2ee0868575484108581e6f3cb006af1da35395e88b4')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

package() {

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
