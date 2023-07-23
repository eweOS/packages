# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libarchive
pkgver=3.7.0
pkgrel=1
pkgdesc='Multi-format archive and compression library'
url='https://libarchive.org/'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('acl' 'openssl' 'xz' 'zlib' 'libxml2' 'libbz2')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz" "replace-svfs-f_namelen.patch" "use-libeal-port-of-sys-queue-h.patch")
sha256sums=('44729a0cc3b0b0be6742a9873d25e85e240c9318f5f5ebf2cca6bc84d7b91b07'
            '7fb0f5c3405742838c6d3cdd86fe63d182f157989f5b8e82636a9b9974fae0a1'
            '26dc2b71675e7c4c8fdc51c9c7ca88e643ad762bbfbc3fafd8b74756eef355ce')

prepare()
{
  cd "$pkgname-$pkgver"
  # https://github.com/libarchive/libarchive/pull/1924
  patch -p1 < ../replace-svfs-f_namelen.patch
  # https://github.com/libarchive/libarchive/issues/1920
  patch -p1 < ../use-libeal-port-of-sys-queue-h.patch
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  sed -i "s/iconv //" "$pkgdir"/usr/lib/pkgconfig/libarchive.pc
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/libarchive/COPYING"
}
