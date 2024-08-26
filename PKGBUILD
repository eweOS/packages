# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-magic
pkgver=0.4.27
pkgrel=1
pkgdesc="A python wrapper for libmagic"
arch=(any)
url="https://github.com/ahupp/python-magic"
depends=(
  file
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
license=(MIT)
# tests not in pypi sdist tarball
# source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://github.com/ahupp/$pkgname/archive/refs/tags/$pkgver.tar.gz 545a2a561522efc2869066792062694b59b1b39c.patch)
sha512sums=('a476730a5caa9a2a784187f57743d5cec4b1829a6a76d4d1fb4e0112caf5487888961df293bc38074ef1a5d313b0fc4aed4cc99b980f5336e8a907c44a33e84e'
            'ce7cd8d719c01124a97802e298a9396ece92c4545e336b39bf67bbf821b7bac2adb097294cf705052676992085b0682a2367bf368f0bb70d33b24b5123c9bfb1')
prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../545a2a561522efc2869066792062694b59b1b39c.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    --deselect test/python_magic_test.py::MagicTest::test_extension
  )

  cd $pkgname-$pkgver
  LC_ALL=en_US.UTF-8 pytest -vv "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
