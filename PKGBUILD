# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=u-msgpack-python
pkgname='python-u-msgpack'
pkgver=2.8.0
pkgrel=1
arch=('any')
url="https://github.com/vsergeev/${_pkgname}"
license=('MIT')
pkgdesc="portable, lightweight MessagePack serializer and deserializer for Python"
depends=('python')
makedepends=('python' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

check() {
    cd ${_pkgname}-${pkgver}
    pytest
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
