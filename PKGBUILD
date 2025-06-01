# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=vim
_vermajor=9
_verminor=1
_verpatch=1420
pkgver="${_vermajor}.${_verminor}.${_verpatch}"
pkgrel=1
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
sha256sums=('bc9842ff1b52d6573befe5f3ce41dbda23f2894b72455b3281b7968edbf80cac')

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
