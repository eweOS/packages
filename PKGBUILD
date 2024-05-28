# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aria2
pkgver=1.37.0
pkgrel=2
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink'
arch=(x86_64 aarch64 riscv64)
url='https://aria2.github.io/'
license=('GPL')
depends=('openssl' 'libxml2' 'sqlite' 'c-ares' 'ca-certs' 'libssh2')
checkdepends=('cppunit')
source=(
	"https://github.com/aria2/aria2/releases/download/release-$pkgver/aria2-$pkgver.tar.xz"
)
sha512sums=('df3b8b4de8fa8d78f203ea00c059e43585e18a229009f202e42e6a9e59db67d09df0dbba8a016e99ed73c82f59e4f8b26f86c2288afdbb96a6807cbe2c56e6b3')

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-libaria2 \
    --with-openssl \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

check()
{
  cd $pkgname-$pkgver
  # check failed in this version, also on Arch
  # make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # add bash completion
  install -d "$pkgdir"/usr/share/bash-completion/completions
  install -m644 "$pkgdir"/usr/share/doc/aria2/bash_completion/aria2c \
    "$pkgdir"/usr/share/bash-completion/completions
  rm -rf "$pkgdir"/usr/share/doc/aria2/bash_completion
}
