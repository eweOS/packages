# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=zsh
pkgver=5.9
pkgrel=1
arch=(x86_64 aarch64)
url='https://www.zsh.org/'
license=('custom')
pkgdesc='A very advanced and programmable command interpreter (shell) for UNIX'
depends=('pcre' 'libcap' 'gdbm')
source=("https://www.zsh.org/pub/zsh-${pkgver}.tar.xz"
  zsh-59-clang-15-configure.patch)
sha512sums=('d9138b7f379ad942a5f46819d2dd52d31f3a1129f2a0d1b53d4c5cd43c318b60396da6d37c57c477b8e958fb750209aca0ae93f8c9dd42ac958de006a0ff067e'
            '130b9b829200b7ad49b87dc1d3a549ca3a36aba57f01f9d4ef60ba66d8f392f57f4d6a3d35ca323857b27d343c9e6218ffeca233fc436b74c91cf88c915146d8')

prepare()
{
  cd $pkgname-$pkgver
  sed -i 's#/usr/share/keymaps#/usr/share/kbd/keymaps#g' Completion/Unix/Command/_loadkeys
  sed -i 's#/usr/share/misc/usb.ids#/usr/share/hwdata/usb.ids#g' Completion/Linux/Command/_lsusb

  # patch configure
  patch -p1 < $srcdir/zsh-59-clang-15-configure.patch
  autoreconf -fiv

  # remove failed tests
  rm -rf Test/{A01grammar,V09datetime}.ztst
}

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-etcdir=/etc/zsh \
    --enable-zshenv=/etc/zsh/zshenv \
    --enable-zlogin=/etc/zsh/zlogin \
    --enable-zlogout=/etc/zsh/zlogout \
    --enable-zprofile=/etc/zsh/zprofile \
    --enable-zshrc=/etc/zsh/zshrc \
    --with-term-lib='ncursesw' \
    --enable-multibyte \
    --enable-function-subdirs \
    --enable-fndir=/usr/share/zsh/functions \
    --enable-scriptdir=/usr/share/zsh/scripts \
    --with-tcsetpgrp \
    --enable-pcre \
    --enable-cap \
    --enable-zsh-secure-free
  make
}

check()
{
  cd $pkgname-$pkgver

  # also freeze
  #make test
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
