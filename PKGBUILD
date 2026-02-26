# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-sphinx
_name=${pkgname#python-}
pkgver=8.2.3
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
  python-roman-numerals-py
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
sha256sums=('85166aac61db14a8c44b05946387d9fcb5780041fe479f71eac03fd7dfd2ae3f')

prepare() {
  sed -e 's|,<0.22||' -i $_name/pyproject.toml # Remove docutils version constraint
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation

  mkdir -p tempinstall
  bsdtar -xf dist/*.whl -C tempinstall
  PYTHONPATH="$PWD/tempinstall" make -C doc man
}

check() {
  cd "$_name"
  python -X dev -X warn_default_encoding -m pytest -vx \
    -k "not test_latex_labels \
    and not test_autodoc_special_members \
    and not test_sphinx_directive_parse_content_to_nodes \
    and not test_sphinx_directive_parse_text_to_nodes \
    and not test_autosummary_generate_content_for_module_imported_members \
    and not test_is_invalid_builtin_class"
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
