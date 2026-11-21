# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xrdp
pkgver=0.10.6.1
pkgrel=1
pkgdesc="Open source remote desktop protocol server"
url="https://github.com/neutrinolabs/xrdp"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0')
depends=('libjpeg' 'libx264' 'openssl' 'pam' 'pixman')
makedepends=('cmocka' 'nasm')
checkdepends=('check')
backup=('etc/xrdp/sesman.ini'
        'etc/xrdp/xrdp.ini'
        'etc/xrdp/startwm.sh'
        'etc/xrdp/reconnectwm.sh'
        'etc/default/xrdp')
install="${pkgname}.install"
# 0001: Downstream, remove X11-only components and fix the musl build.
source=(
  "https://github.com/neutrinolabs/xrdp/releases/download/v${pkgver}/xrdp-${pkgver}.tar.gz"
  "0001-eweos-port.patch"
  xrdp.service
  xrdp-sesman.service
)
sha256sums=('2f7beb5a3b2529c8d72dc0df9b8cdca31ab0e0c14d1e3421210f5e6ec0ab3b75'
            '50d18fdc724490f3ce8ef732fd82cc183ee59236a1a5b58b007c7d9b796c0012'
            '89f58ae774b564451307450febcd6454c8b94581884f7d22e348570df51d2eb1'
            '8cf74ebbe2444331098751df3064289bde9b4cebfa9757f8b16793b4ac7ca2b2')

prepare() {
  _patch_ "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  ./bootstrap
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --disable-static \
              --with-systemdsystemunitdir=no \
              --enable-tests \
              --enable-jpeg \
              --enable-tjpeg \
              --enable-rfxcodec \
              --enable-pixman \
              --enable-painter \
              --enable-vsock \
              --enable-ipv6 \
              --enable-pam-config=unix \
              --with-imlib2=no \
              --with-freetype2=no \
              --enable-x264
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/etc/xrdp/rsakeys.ini \
        "$pkgdir"/etc/xrdp/cert.pem \
        "$pkgdir"/etc/xrdp/key.pem
  _dinit_install_services_ "$srcdir/xrdp-sesman.service" "$srcdir/xrdp.service"
  _install_license_ COPYING
}
