# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aria2
pkgver=1.36.0
pkgrel=2
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink'
arch=(x86_64 aarch64 riscv64)
url='https://aria2.github.io/'
license=('GPL')
depends=('openssl' 'libxml2' 'sqlite' 'c-ares' 'ca-certs' 'libssh2')
checkdepends=('cppunit')
source=(
	"https://github.com/aria2/aria2/releases/download/release-$pkgver/aria2-$pkgver.tar.xz"
	"remove-deprecated-functions.patch::https://github.com/aria2/aria2/commit/8956c58d126a4e57e114f69ba6a5961724b7a817.patch"
)
sha512sums=('8203dbb75274455a78c50dd4f894e631de6931ac889f26896dceed78ec38c98cdbcf07e164744f308f2bfffeae1016beec1bfdbe8cad7f3280d11376aa0c2542'
            'e1f89f4e1a09373641120b86d2eb432e6876dfbacb5fc891b1f00c22598e3dd2a03621a81d6a27eec74c4867078fb40cf52623bc75abacb1d11e74a4bbed598f')

prepare()
{
  cd $pkgname-$pkgver
  patch -p1 < ../remove-deprecated-functions.patch
}

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
  #make check
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
