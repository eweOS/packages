# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=sphinxcontrib-jsmath
pkgname=python-sphinxcontrib-jsmath
pkgver=1.0.1
pkgrel=2
pkgdesc='Sphinx extension which renders display math in HTML via JavaScript'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-jsmath
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'jsmath-read_text.patch::https://github.com/sphinx-doc/sphinxcontrib-jsmath/commit/3297b27177ab4862d1b2408a2db66235397fe212.patch')
sha256sums=('a9925e4a4587247ed2191a22df5f6970656cb8ca2bd6284309578f2153e0c4b8'
            '697764efeaa1a6ef234d516a4a6b3fde0c77197a89eaae3246daf8b3ad1f12df')

prepare() {
  cd $_name-$pkgver
  # https://github.com/sphinx-doc/sphinxcontrib-jsmath/pull/10
  patch --forward --strip=1 --input=../jsmath-read_text.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/sphinxcontrib_jsmath-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
