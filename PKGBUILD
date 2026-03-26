# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glad
pkgver=2.0.8
pkgrel=3
pkgdesc='Multi-Language Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specs'
url='https://github.com/Dav1dde/glad'
arch=('any')
license=('MIT')
depends=('python' 'python-jinja' 'python-lxml' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
# 0001: Under review, try to obtain GL symbols through EGL (eglGetProcAddress)
#	when libGL.so isn't available, allowing GLAD to successfully load GL
#	on Wayland-only systems like eweOS.
#	https://github.com/Dav1dde/glad/pull/536
source=(${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz
	0001-c-Try-loading-OpenGL-through-EGL-if-GLX-isn-t-availa.patch)
sha512sums=('ec964d0080c9714803f0464492b237039d2bede805d21aa9e487f3bf910447fd6440eeca59f3795dc4d5dd3b3df35101714fa21ea19eb29f6a021864a2310acd'
            '3aadad3df98fd8274578fa0f47fcf7323aeb742b7b797da2fdf0685ce922df3d16caa0c8a5e7c67e9169a15baa5923c6d94b2b5d3c04de3cfd8a6b21f220bcac')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

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
