# Maintainer: Yukari Chiba <i@0x7f.cc>
pkgname=wterm
pkgver=20220907
pkgrel=1
epoch=1
pkgdesc="xterm for wayland (simple wayland st suckless terminal)"
arch=(x86_64 aarch64)
url="https://github.com/majestrate/wterm"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'pixman' 'libdrm')
source=("https://github.com/majestrate/wterm/archive/refs/heads/master.tar.gz")
md5sums=("SKIP")

prepare()
{
  cd $pkgname-master
  sed -i "/tic -s wterm.info/d" Makefile
  sed -i "s/gcc/cc/g" src/wld/config.mk
}

build()
{
  cd $pkgname-master
  CC=cc make wld
  CC=cc make wterm
}

package()
{
  cd $pkgname-master
  make BIN_PREFIX="$pkgdir/usr/" SHARE_PREFIX="$pkgdir/usr/" install
  mkdir -p "$pkgdir/usr/share/terminfo/w/"
  cp wterm.info "$pkgdir/usr/share/terminfo/w/"
}
