# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinx
_name=${pkgname#python-}
pkgver=8.1.3
pkgrel=1
pkgdesc='Python documentation generator'
arch=(any)
url=http://www.sphinx-doc.org/
license=(BSD-2-Clause)
# python-sphinxcontrib-{{apple,dev,html}help,jsmath,qthelp,serializinghtml}
depends=(
  python-babel
  python-docutils
  python-imagesize
  python-jinja
  python-packaging
  python-pygments
  python-requests
  python-snowballstemmer
  python-sphinx-alabaster-theme
  python-sphinxcontrib-applehelp
  python-sphinxcontrib-devhelp
  python-sphinxcontrib-htmlhelp
  python-sphinxcontrib-jsmath
  python-sphinxcontrib-qthelp
  python-sphinxcontrib-serializinghtml
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
# texlive-{fontsextra,fontsrecommended,latexextra,luatex,xetex}
checkdepends=(
  cython
  imagemagick
  libzip
  librsvg
  python-defusedxml
  python-pytest
  python-setuptools
  python-typing_extensions
  texlive-fontsextra
  texlive-fontsrecommended
  texlive-latexextra
  texlive-luatex
  texlive-xetex
)
optdepends=(
  'imagemagick: for ext.imgconverter'
  'texlive-fontsextra: for the default admonition title icons in PDF output'
  'texlive-latexextra: for generation of PDF documentation'
)
source=("git+https://github.com/$_name-doc/$_name.git#tag=v$pkgver")
sha256sums=('c057319b0bb3414853fea864d762cd99da10d5b0322c4fc73943816d63871c61')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation

  mkdir -p tempinstall
  bsdtar -xf dist/*.whl -C tempinstall
  PYTHONPATH="$PWD/tempinstall" make -C doc man
}

check() {
  cd "$_name"
  python -X dev -X warn_default_encoding -m pytest -vx
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE.rst \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dt "$pkgdir"/usr/share/man/man1 doc/_build/man/"$_name"-*.1
}
