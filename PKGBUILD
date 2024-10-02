# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glad
pkgver=2.0.8
pkgrel=1
pkgdesc='Multi-Language Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specs'
url='https://github.com/Dav1dde/glad'
arch=('any')
license=('MIT')
depends=('python' 'python-jinja' 'python-lxml' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ec964d0080c9714803f0464492b237039d2bede805d21aa9e487f3bf910447fd6440eeca59f3795dc4d5dd3b3df35101714fa21ea19eb29f6a021864a2310acd')

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
