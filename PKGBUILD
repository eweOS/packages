# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayfire
pkgver=0.11.0
pkgrel=1
pkgdesc="A modular and extensible wayland compositor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango libjpeg libinput wlroots0.20 wf-config yyjson)
makedepends=(meson ninja wayland-protocols glm cmake mesa doctest git openmp
	     linux-headers wlroots0.20-devel vulkan-icd-loader)
source=(
  "git+https://github.com/WayfireWM/${pkgname}.git#tag=v$pkgver"
  git+https://github.com/WayfireWM/wf-utils.git
  git+https://github.com/WayfireWM/wf-touch.git
  git+https://github.com/WayfireWM/wf-json.git
)
sha256sums=('3ee51acf7243999b866632c4fcd9492bdf3ac49945a9956dbe6634bf14bce13d'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname

  git submodule init
  git config submodule.subprojects/wlroots.update none
  git config submodule.subprojects/wlroots-vkfx.update none
  git config submodule.subprojects/wf-config.update none
  git submodule set-url subprojects/wf-utils "$srcdir/wf-utils"
  git submodule set-url subprojects/wf-touch "$srcdir/wf-touch"
  git submodule set-url subprojects/wf-json "$srcdir/wf-json"
  git -c protocol.file.allow=always submodule update

  sed -i 's|/usr/libexec/xdg-desktop-portal|/usr/lib/xdg-desktop-portal|' wayfire.ini
}

build()
{
  export CFLAGS="${CFLAGS/-O? /-O0 }"
  export CXXFLAGS="${CXXFLAGS/-O? /-O0 }"
  ewe-meson "${pkgname}" build \
    -Duse_system_wlroots=enabled \
    -Duse_system_wfconfig=enabled \
    -Dxwayland=disabled
  ninja -C build
}

check()
{
  meson test -C build
}

package()
{
  DESTDIR="${pkgdir}/" ninja -C build install
  cd "${pkgname}"
  install -Dm644 wayfire.desktop "${pkgdir}/usr/share/wayland-sessions/wayfire.desktop"
  install -Dm644 wayfire.ini "${pkgdir}/usr/share/${pkgname}/wayfire.ini"
  install -Dm645 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
