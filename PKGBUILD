# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glad
pkgver=2.0.6
pkgrel=1
pkgdesc='Multi-Language Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specs'
url='https://github.com/Dav1dde/glad'
arch=('any')
license=('MIT')
depends=('python' 'python-jinja' 'python-lxml' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ad7e0544fdd07ba7e091ed8a985deb27f05affb0a830b8132d7c03d6690b57139b25433303260e3affba7b11c0dad38358fcd4ff5b7b30e7ca193e8beed8db48')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
