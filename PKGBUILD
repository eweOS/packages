# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-magic
pkgver=0.4.27
pkgrel=4
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
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/ahupp/$pkgname/archive/refs/tags/$pkgver.tar.gz
  545a2a561522efc2869066792062694b59b1b39c.patch
  4ffcd59113fa26d7c2e9d5897b1eef919fd4b457.patch
  file-5.47.patch
)
sha512sums=('a476730a5caa9a2a784187f57743d5cec4b1829a6a76d4d1fb4e0112caf5487888961df293bc38074ef1a5d313b0fc4aed4cc99b980f5336e8a907c44a33e84e'
            'ce7cd8d719c01124a97802e298a9396ece92c4545e336b39bf67bbf821b7bac2adb097294cf705052676992085b0682a2367bf368f0bb70d33b24b5123c9bfb1'
            '3705bcd97252950b249d828501b5d10c0cf4d8ceeb7a091499a47ea681ea896997b08c341ec5a3816c966f88cb57d060953362731efadc153fff65019e8dd432'
            '632c8cb6a6faecaf5a882f796bf2b1b17f73b2b5c7ceb946817a9cff4449a82c851082dd51c080097ff4460dcca3bf7c67a3029a1025151454ac7f7bcabc7c3d')
prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # https://github.com/ahupp/python-magic/issues/340
  local pytest_options=(
    --deselect test/libmagic_test.py::MagicTestCase::test_detect_from_content
    --deselect test/python_magic_test.py::MagicTest::test_descriptions
  )

  cd $pkgname-$pkgver
  LC_ALL=en_US.UTF-8 pytest -vv "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
