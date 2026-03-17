# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest
_name=${pkgname#python-}
pkgver=9.0.2
pkgrel=1
pkgdesc="Simple powerful testing with Python"
arch=('any')
license=('MIT')
url="https://pytest.org/"
depends=('python' 'python-iniconfig' 'python-packaging' 'python-pluggy'
	 'python-pygments')
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
sha256sums=('e09a526578b488743bb7f832f0ec5bb45a14e22caed05bca4fbb9ae85ad23862')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"

  # Currently some dependencies are missing, thus it's not possible to run the
  # full testsuite. Run a simple command to make sure no runtime dependency is
  # missing at least.
  python -m venv testenv --system-site-packages
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m pytest --version
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
