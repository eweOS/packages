# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-typing_extensions
_name=${pkgname#python-}
pkgver=4.13.2
pkgrel=1
pkgdesc='Backported and Experimental Type Hints for Python 3.8+'
arch=(any)
url=https://github.com/python/typing_extensions
license=(Python-2.0.1)
depends=(python)
makedepends=(git python-build python-flit-core python-installer)
checkdepends=(python-tests python-typing_extensions)
provides=(python-typing-extensions)
conflicts=(python-typing-extensions)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('783f27e6fb45e8e72d6204800f8f094b95dbc07eaadc372d17e3f90f544a38bb')

build() {
  cd "${_name}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}"
  python -m unittest discover src
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s "${site_packages}"/"${_name}"-${pkgver}.dist-info/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
