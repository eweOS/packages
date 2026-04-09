# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-lua
pkgver=5.0.16
pkgrel=1
pkgdesc="Lua support for Fcitx 5"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-lua"
license=('LGPL-2.1-or-later')
depends=('fcitx5' 'lua')
makedepends=('git' 'extra-cmake-modules' 'ninja')
# 0001: Downstream, fix Lua library resolution on eweOS, where objdump is the
#	llvm variant, and its output format couldn't be recognized by the
#	regex used in CMakeLists.txt for extracting DT_NAME from output of
#	objdump -p (this is really hack!).
#
#	On eweOS, Lua is always shipped as liblua-$LUAVER.so, so let's skip
#	the hack completely.
source=("git+https://github.com/fcitx/fcitx5-lua.git#tag=$pkgver"
        0001-fix-luapath.patch)
sha512sums=('4eb517abad3c0f0d17cb11873d54e6801f2d802900d4c8d7f28e223a3ba767a7785dc7f0d1c885377a6c94312d70faf9555ab1d52623c94b58b59068490dc260'
            '4a3d8d8333ad8e5694f08680438dd62bf3b6ff35db7ca92df1dd1bafd89255342051e13676a7176f5593a8eea5259c854b4ce1f8b0aae5be191824f90844ad55')

prepare() {
  _patch_ $pkgname
}

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

check() {
  cd $pkgname
  ninja test
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
