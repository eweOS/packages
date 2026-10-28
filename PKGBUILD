# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-jaraco.collections
_name="${pkgname#python-}"
pkgver=5.2.1
pkgrel=1
pkgdesc="Models and classes to supplement the stdlib 'collections' module."
arch=('any')
url='https://github.com/jaraco/jaraco.collections'
license=('MIT')
depends=('python' 'python-jaraco.text')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bc8f9f574ed8b2c9f0033608766cbd644d68a8f4b0501e1c4a61430b56da087264ea86dd36ace7cc6dbae68d217163a5c078f71ee9d06b0ac2a858fe7e6cd4b0')

build() {
  cd "$_name"-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

_no_check() {
  local pytest_options=(
    -vv
  )

  cd "$_name"-$pkgver
  python -m pytest "${pytest_options[@]}"
}

package() {
  cd "$_name"-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
