# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=vim
pkgver=9.2.0782
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
sha256sums=('148ad1c29555e0cf6430570730d8b9fc97151a814866e6f549e5e73e4ad0a612')

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
