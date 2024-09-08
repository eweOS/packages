# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glad
pkgver=2.0.7
pkgrel=1
pkgdesc='Multi-Language Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specs'
url='https://github.com/Dav1dde/glad'
arch=('any')
license=('MIT')
depends=('python' 'python-jinja' 'python-lxml' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6aae5e36acd319913f3c313da2a552d3033f7acbfd38fd07da99e737a23eaf250091134d82eceaf106aaa26bdd9f3a95b64dea635d5a82010e4d9a0ba69fc0e1')

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
