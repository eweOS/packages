# Maintainer: Yukari CHiba <i@0x7f.cc>

pkgname=python-fs
pkgver=2.4.16
pkgrel=1
pkgdesc="Filesystem abstraction layer"
arch=('any')
license=('MIT')
url="https://github.com/PyFilesystem/pyfilesystem2"
depends=('python-appdirs' 'python-pytz' 'python-setuptools' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('24a50fdbb668916e19ef26b21feb345beb6d734e841435de2bef32672e4f6b8329a44e827b6d3bb878c2522098499dea4915adcfa381b0a3c9e20f8c4f7352bb')

build() {
  cd pyfilesystem2-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd pyfilesystem2-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

