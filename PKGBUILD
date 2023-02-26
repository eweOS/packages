# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glm
pkgver=0.9.9.8
pkgrel=2
pkgdesc="C++ mathematics library for graphics software based on the GLSL specifications"
arch=('any')
license=('MIT')
url="http://glm.g-truc.net"
source=(
  "https://github.com/g-truc/glm/releases/download/${pkgver}/glm-${pkgver}.zip"
  glm.pc.in
  glmConfigVersion.cmake.in
  glmConfig.cmake.in
  glmTargets.cmake
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package()
{
  cd $pkgname

  mkdir -p "$pkgdir"/usr/include/
  cp -r glm "$pkgdir"/usr/include/

  mkdir -p "$pkgdir"/usr/share/doc
  cp -r doc "$pkgdir"/usr/share/doc/glm

  # For some stupid reason, glm upstream removed the CMake install target here:
  # https://github.com/g-truc/glm/commit/5f352ecce21bb1ab37fa56fac0f383c779b351a3
  # There is no reasoning for it. Discussion here: https://github.com/g-truc/glm/issues/947
  mkdir -p "$pkgdir"/usr/lib/pkgconfig/
  sed "s/@VERSION@/$pkgver/" "$srcdir"/glm.pc.in > "$pkgdir"/usr/lib/pkgconfig/glm.pc

  mkdir -p "$pkgdir"/usr/lib/cmake/glm/
  sed "s/@VERSION@/$pkgver/" "$srcdir"/glmConfigVersion.cmake.in > "$pkgdir"/usr/lib/cmake/glm/glmConfigVersion.cmake
  sed "s/@VERSION@/$pkgver/" "$srcdir"/glmConfig.cmake.in > "$pkgdir"/usr/lib/cmake/glm/glmConfig.cmake
  install -Dm644 "$srcdir"/glmTargets.cmake "$pkgdir"/usr/lib/cmake/glm/glmTargets.cmake
}
