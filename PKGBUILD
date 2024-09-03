# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=p7zip
pkgver=17.05
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/p7zip-project/p7zip"
license=('LGPL' 'custom:unRAR')
depends=('sh' 'musl')
source=(https://github.com/p7zip-project/p7zip/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
        oemcp-iconv.patch::https://github.com/p7zip-project/p7zip/commit/c104127e6a93.patch
        oemcp-cygwin.patch::https://github.com/p7zip-project/p7zip/commit/0e0a1a8316b6.patch
        oemcp-apple.patch::https://github.com/p7zip-project/p7zip/commit/334a01e3f8bc.patch
        do-not-gzip-man-pages.patch
	fix-uintxx_t-redefined.patch)
sha256sums=('d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6'
            'b5f56b592f2e090a1871953438d4496a8082731e3eb2fcec0caad4834a1d38a9'
            '789789216ca46e5ea9b6780e353f964a1f46e9a2bcaa6b16413adcf9a89eb374'
            'dfe1a625f80078c3ec68038f0aae8ba3a82ea96d0aeb97cb3586dc7fb3ef9650'
            'ad07f981fb8de13cf8fc28518b1d81a2db5098cad206385e209f0912f776a180'
            '6f676f111606d12b58c3f1750629db80d412c4c7e7d94ad50856f5684189d7f7')

prepare() {
    cd "$pkgname-$pkgver"

    # Leave man page compression to makepkg to maintain reproducibility
    patch -Np1 -i ../do-not-gzip-man-pages.patch

    # https://github.com/p7zip-project/p7zip/issues/112
    patch -Rp1 -i ../oemcp-apple.patch
    patch -Rp1 -i ../oemcp-cygwin.patch
    patch -Rp1 -i ../oemcp-iconv.patch

    patch -p1 < ../fix-uintxx_t-redefined.patch
}

build() {
  cd $pkgname-$pkgver
  make OPTFLAGS="$CPPFLAGS $CFLAGS" 7z 7zr 7za
}

package() {
  cd $pkgname-$pkgver

  make install \
    DEST_DIR="$pkgdir" \
    DEST_HOME=/usr \
    DEST_MAN=/usr/share/man

  # Remove documentation for the GUI file manager
  rm -r "$pkgdir/usr/share/doc/p7zip/DOC/MANUAL/fm"

  install -d "${pkgdir}"/usr/share/licenses/p7zip
  mv "$pkgdir"/usr/share/doc/p7zip/DOC/{License,unRarLicense}.txt \
  	"$pkgdir"/usr/share/licenses/p7zip/
}
