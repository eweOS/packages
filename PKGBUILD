# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-html5lib
pkgver=1.1
pkgrel=1
arch=('any')
url="https://github.com/html5lib"
license=('MIT')
pkgdesc="A Python HTML parser/tokenizer based on the WHATWG HTML5 spec"
depends=(python-six python-webencodings)
makedepends=('python-setuptools')
_checkdeps=('pytest' 'pytest-expect')
checkdepends=('python-pytest' 'python-pytest-expect' 'python-lxml')
optdepends=('python-lxml: lxml treebuilder'
            'python-genshi: genshi treewalker')
_test_commit=71eebd59772d1d39aced0c0582ae9c09acf3ce6e
source=("$pkgname-$pkgver.tar.gz::https://github.com/html5lib/html5lib-python/archive/${pkgver}.tar.gz"
        "https://github.com/html5lib/html5lib-python/commit/2c19b9899ab3a3e8bd0ca35e5d78544334204169.patch"
        "https://github.com/html5lib/html5lib-tests/archive/${_test_commit}.tar.gz"
        'html5lib_pytest74.patch::https://github.com/html5lib/html5lib-python/pull/570/commits/51cd4b9d331da8b167d0d0a77deb62357b42a1b7.patch'
        'html5lib-mock-stdlib.patch::https://github.com/html5lib/html5lib-python/commit/5ec6e5e614679ee938545704fad958a3491c678b.patch')
sha256sums=('66e9e24a53c10c27abb6be8a3cf2cf55824c6ea1cef8570a633cb223ec46e894'
            '6f37b33667e35ea138279be9842f012792821b1497b81ae4b108a74180cfe249'
            'c866f5e4ae9ef34313e2b61fcb74849b6f8aef970bf8249956b6a5d142197087'
            '12921399944e191a01a93c26f684b780bc17182b8b642f39591446fd52ae5a34'
            '084aeb6fe430a82e482bae01e7f962308f77107d97c42316e512efb7045f7030')

prepare() {
    cd html5lib-python-${pkgver}

    # fix pytest 6 compat
    patch -p1 -i ../2c19b9899ab3a3e8bd0ca35e5d78544334204169.patch

    patch -p1 -i ../html5lib_pytest74.patch
    patch -p1 -i ../html5lib-mock-stdlib.patch

    rmdir html5lib/tests/testdata
    ln -sfT ../../../html5lib-tests-${_test_commit} html5lib/tests/testdata
}

build() {
    cd html5lib-python-${pkgver}

    python setup.py build
}

check() {
    cd html5lib-python-${pkgver}

    pytest
}

package() {
    cd html5lib-python-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
