# Maintainer: Yukari Chiba <i@0x7f.cc>
pkgname=wterm
_commit=774bf3c73104c1135a830caaab7b97ee265ca796
pkgver=20260504.${_commit:0:8}
pkgrel=1
epoch=1
pkgdesc="xterm for wayland (simple wayland st suckless terminal)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/majestrate/wterm"
license=('MIT')
depends=('musl' 'wayland' 'freetype2' 'libxkbcommon' 'fontconfig' 'pixman'
         'libdrm')
makedepends=('linux-headers' 'git')
source=("git+https://github.com/majestrate/wterm.git#commit=$_commit")
sha256sums=('5b554ed9d83aac0992727a7494f1ed7414bdd14c7982bd33505b8b3fbd2fd7a7')

prepare() {
  cd $pkgname
  sed -i "/tic -s wterm.info/d" Makefile
}

build() {
  cd $pkgname
  make wld VERSION=$pkgver
  make wterm VERSION=$pkgver
}

package() {
  cd $pkgname
  make BIN_PREFIX="$pkgdir/usr/" SHARE_PREFIX="$pkgdir/usr/" VERSION=$pkgver \
       install
  mkdir -p "$pkgdir/usr/share/terminfo/w/"
  cp wterm.info "$pkgdir/usr/share/terminfo/w/"
  _install_license_ LICENSE
}
