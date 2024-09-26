# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest
_name=${pkgname#python-}
pkgver=8.3.3
pkgrel=1
pkgdesc="Simple powerful testing with Python"
arch=('any')
license=('MIT')
url="https://pytest.org/"
depends=('python' 'python-iniconfig' 'python-packaging' 'python-pluggy')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
#checkdepends=(
#  'python-argcomplete'
#  'python-attrs'
#  'python-hypothesis'
#  'python-nose'
#  'python-pygments'
#  'python-requests'
#  'python-xmlschema'
#  # Unlisted, but actually used. Check again after a while:
#  'lsof'
#  'python-decorator'
#  'python-docutils'
#  'python-exceptiongroup'
#  'python-jinja'
#  'python-numpy'
#  'python-pexpect'
#  'python-pytest-xdist'
#  'python-twisted'
#)
source=("git+https://github.com/$_name-dev/$_name.git#tag=$pkgver")
sha256sums=('ee5c3073528e0793a9f46375b113f6b3714ad96da8041389cc091a8bed801ed7')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # https://github.com/pytest-dev/pytest/issues/10042
  #PYTHONPATH="$PWD/src:$PYTHONPATH" pytest -o xfail_strict=False
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
