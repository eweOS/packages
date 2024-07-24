# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tzlocal
_name=${pkgname#python-}
pkgver=5.2
pkgrel=2
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url=https://github.com/regebro/tzlocal
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-mock' 'tzdata')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$_name"
  # fix symlink, required for test: https://github.com/regebro/tzlocal/issues/53
  cd tests/test_data/symlink_localtime/etc
  ln -sfv ../usr/share/zoneinfo/Africa/Harare localtime
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # docs
  install -vDm 644 {CHANGES.txt,README.rst} \
    -t "$pkgdir/usr/share/doc/$_name"

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
