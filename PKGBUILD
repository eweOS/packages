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
sha512sums=('8c6bdaacfac600a22d7e92b86f70bfcfe7bf7f56b05ad93c503520adbdb8432ca20c01e93a5c782cf457fe4512b29defffdc94a1316bc7f3d6747f989fff0286'
            '37f3973b9913fb820a355160717cbe881586a00210c76061c436784d240eec0094132d8fb772126f8ab9cd75d3ed2da9ccb5a5c33dbdd007d77e5eca82990d25'
            'd24fe9aa68bc987af953d51c458dd8c7ebc28a0f5867938bc5c9d1c83737c413476b94ca909281b29615933ee29104e61cb5fe83f8f7464bb2a2ecd9617079e5'
            '1386cc0ae04f846e9c01980e9b36fa434bd2380a665d2b11306f269bc98a7db60fa4b56e254862bcf9baa0e673628ff6cbc70256ff82344ca09aaba322f60dab'
            'a8061a91350d61e07c2d736d8708ef9d91d583825b3684d8684ee6ee63874105d008941ab053d7c361911c39f38633b7a3def0869e2bf430c38eb74b8d838aee')

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
