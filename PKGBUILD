# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-typogrify
_pyname=typogrify
pkgver=2.0.7
pkgrel=1
pkgdesc='filters to make caring about typography on the web a bit easier'
arch=('any')
url='https://github.com/mintchaos/typogrify'
license=('BSD')
depends=('python' 'python-smartypants')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        jinja-3.1.patch)
sha256sums=('8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38'
            'bda1b57207e46d3d399b830e603493505bcbc1414342b823d81345a4ac8a4cfb')

prepare() {
  _patch_ "${_pyname}-${pkgver}"
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}
