# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=vim
_vermajor=9
_verminor=1
_verpatch=0764
pkgver="${_vermajor}.${_verminor}.${_verpatch}"
pkgrel=2
pkgdesc='An IMproved version of the vi editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.vim.org'
license=(VIM)
groups=()
depends=(ncurses acl)
optdepends=(
  'python: Python language support'
  'lua: Lua language support'
)
makedepends=(python lua)
options=(emptydirs)
source=("https://github.com/vim/vim/archive/v${pkgver}.tar.gz")
sha256sums=('874be6146792d67ae47dc8d89f9d32558a266df87a81f5f80ad1b9b4cb31c1a1')

build()
{
  cd ${pkgname}-${pkgver}
  # Set the path of the default vimrc file
  echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

  ./configure \
    --prefix=/usr \
    --enable-multibyte \
    --with-tlib=ncursesw \
    --enable-python3interp=dynamic \
    --enable-luainterp=dynamic \
    --with-compiledby="eweOS" \
    --enable-gui=no \
    --without-x \
    --disable-nls
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  # takes too long and fail
  #make test
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  rm -f "${pkgdir}/usr/bin/xxd"
}
