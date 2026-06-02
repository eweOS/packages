# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pip
pkgname=python-$_name
pkgver=26.1.2
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=(any)
license=(MIT)
depends=(
  python
  python-attrs
  python-cryptography
  python-filelock
  python-wheel
)
#  python-myst-parser
#  python-sphinx
#  python-sphinx-copybutton
#  python-sphinx-inline-tabs
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-setuptools
)
#checkdepends=(
#  git
#  python-freezegun
#  python-proxy.py
#  python-pytest
#  python-pytest-rerunfailures
#  python-pytest-xdist
#  python-scripttest
#  python-tomli-w
#  python-virtualenv
#  python-werkzeug
#  subversion
#)
source=(https://github.com/pypa/$_name/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('e29c98a7da5e329183b7eef86a66f9d6c3473051f64aa6e762714306148547eb0de4220824484071822a9a62bd01a62a09ab16bba4c26e4b847bfc2609728608')

prepare() {
  # pip is moving towards a separate sphinx config without towncrier https://github.com/pypa/pip/issues/12881
  # since python-sphinxcontrib-towncrier is broken, we remove its use (as it is not needed for manpages)
  sed '/towncrier/d' -i $_name-$pkgver/docs/html/conf.py
}

build() {
  cd $_name-$pkgver

  python -m build --wheel --no-isolation

  #cd docs/
  #PYTHONPATH="$srcdir/$_name-$pkgver/src/" python pip_sphinxext.py
  #PYTHONPATH="$srcdir/$_name-$pkgver/src/" sphinx-build -b man -d build/doctrees/man man build/man -c html
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _deselected=(
    # deselect tests that would require python-pip in checkdepends (may or may not work due to devendored dependencies when python-pip is updated)
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_with_source_dir_obtains_commit_id
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_without_source_dir
    --deselect tests/unit/test_wheel_builder.py::test_should_cache_git_sha
    # disable downloading the internet
    --deselect tests/unit/test_req.py::TestRequirementSet::test_download_info_web_archive
    --deselect tests/unit/test_req.py::TestRequirementSet::test_download_info_vcs
    --deselect tests/unit/test_network_session.py::TestPipSession::test_proxy
  )

  cd $_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  #pytest -vv -m unit "${_deselected[@]}" tests/
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  #install -vDm 644 docs/build/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 {NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"

  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --bash | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --zsh | tail -n+3 | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --fish | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/pip.fish
}
