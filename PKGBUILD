# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=toml
pkgname=python-toml
pkgver=0.10.2
pkgrel=1
pkgdesc="A Python library for parsing and creating TOML"
arch=('any')
url="https://github.com/uiri/toml"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
#checkdepends=('python-numpy' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${pkgname}-0.10.1-install_type_hints.patch")
sha256sums=('b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f'
            '7597ca115ba497797cf7c1330f5e93146ff5a924ef3bc331a8e77da12ee880cf')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../"${pkgname}-0.10.1-install_type_hints.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="../build/lib/:${PYTHONPATH}"
  # FIXME: check dependency
  #pytest -v tests -k 'not test_invalid_tests and not test_valid_tests'
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
