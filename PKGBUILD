# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qca
pkgname=(qca-qt6)
pkgver=2.3.9
pkgrel=1
pkgdesc='Qt Cryptographic Architecture'
arch=(x86_64 aarch64 riscv64)
url='https://userbase.kde.org/QCA'
license=(LGPL-2.1-or-later)
depends=(ca-certificates nss)
optdepends=('botan: botan plugin'
            'libgcrypt: gcrypt plugin'
            'libsasl: SASL plugin'
            'openssl: SSL plugin'
            'pkcs11-helper: PKCS-11 plugin')
makedepends=(botan
             cmake
             libgcrypt
             libsasl
             openssl
             pkcs11-helper
             qt6-base
             qt6-5compat)
source=(https://download.kde.org/stable/$pkgbase/$pkgver/$pkgbase-$pkgver.tar.xz)
sha256sums=('c555d5298cdd7b6bafe2b1f96106f30cfa543a23d459d50c8a91eac33c476e4e')

build() {
  cmake -B build-qt6 -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON \
    -DBUILD_TESTS=OFF \
    -DQCA_INSTALL_IN_QT_PREFIX=ON \
    -DQCA_MAN_INSTALL_DIR=/usr/share/man
  cmake --build build-qt6
}

package_qca-qt6() {
  depends+=(qt6-5compat
            qt6-base)

  DESTDIR="$pkgdir" cmake --install build-qt6
}
