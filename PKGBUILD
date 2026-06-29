# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vapoursynth
pkgver=R77
pkgrel=2
pkgdesc='A video processing framework with the future in mind'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=http://www.vapoursynth.com/
license=(LGPL-2.1-only OFL-1.1)
depends=(
  musl
  zimg
  python
)
makedepends=(
  cython
  git
  meson-python
  python-build
  python-installer
  symlinks
)
source=(
  https://github.com/vapoursynth/vapoursynth/archive/$pkgver.tar.gz
  vapoursynth.xml
)
sha256sums=('f71653355983fc245ef811a64d2b8f5b0ba131c0bb330b3346d435e1926187e2'
            '71b26d66d42b9176b4f41e2f79685b8afb4d66c61e21b9aa3e84d87d3508567f')

build() {
  cd vapoursynth-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir" vapoursynth-$pkgver/dist/*.whl

  local _sitepkgs
  _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
  ln -s "${pkgdir}${_sitepkgs}/vapoursynth/libvapoursynth.so.4" "${pkgdir}/usr/lib/libvapoursynth.so.4"
  ln -s "${pkgdir}/usr/lib/libvapoursynth.so.4" "${pkgdir}/usr/lib/libvapoursynth.so"
  ln -s "${pkgdir}${_sitepkgs}/vapoursynth/libvsscript.so" "${pkgdir}/usr/lib/libvapoursynth-script.so.0"
  ln -s "${pkgdir}/usr/lib/libvapoursynth-script.so.0" "${pkgdir}/usr/lib/libvapoursynth-script.so"

  install -d -m755 "${pkgdir}/usr"/{include,lib/pkgconfig}
  ln -s "${pkgdir}${_sitepkgs}/vapoursynth/include" "${pkgdir}/usr/include/vapoursynth"
  ln -s "${pkgdir}${_sitepkgs}/vapoursynth/pkgconfig/vapoursynth.pc" "${pkgdir}/usr/lib/pkgconfig/vapoursynth.pc"

  symlinks -rcv "${pkgdir}/usr"

  install -d -m755 "${pkgdir}${_sitepkgs}/vapoursynth/plugins"
  install -Dm 644 vapoursynth-$pkgver/src/core/ter-116n.ofl.txt -t "${pkgdir}/usr/share/licenses/vapoursynth"
  install -Dm 644 vapoursynth.xml -t "${pkgdir}/usr/share/mime/packages"

  local _libvsscript="${_sitepkgs}/vapoursynth/libvsscript.so"
  printf "export VSSCRIPT_PATH='%s'\n" "${_libvsscript}" \
    | install -Dm 644 /dev/stdin "${pkgdir}/etc/profile.d/vapoursynth.sh"
  printf "set --export --global VSSCRIPT_PATH '%s'\n" "${_libvsscript}" \
    | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_conf.d/vapoursynth.fish"
}
