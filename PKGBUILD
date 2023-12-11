# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Florian Walch <florian+aur@fwalch.com>

pkgname=libtermkey
pkgver=0.22
pkgrel=3
pkgdesc='Library for easy processing of keyboard entry from terminal-based programs'
arch=(x86_64 aarch64 riscv64)
url='http://www.leonerd.org.uk/code/libtermkey'
license=('MIT')
depends=('unibilium' 'libunibilium.so')
provides=('libtermkey.so')
source=(
  "http://www.leonerd.org.uk/code/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  0-fix-ldflags-for-lto.patch
)
sha256sums=('6945bd3c4aaa83da83d80a045c5563da4edd7d0374c62c0d35aec09eb3014600'
            '921170409ecc7caa6b84c0333dabb27b0710a7a725cfe9a50e7cd620afd8c84d')

prepare()
{
  # 0: missing ldflags when linking demo
  _patch_ $pkgname-$pkgver
}

build()
{
  cd "${pkgname}-${pkgver}/"
  make PREFIX=/usr
}

package()
{
  cd "${pkgname}-${pkgver}/"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
