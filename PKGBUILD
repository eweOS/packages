# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=libssh2
pkgver=1.11.1
pkgrel=3
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts"
url="https://www.libssh2.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD-3-Clause')
depends=('openssl' 'zlib')
makedepends=('git')
provides=('libssh2.so')
source=(
  "git+https://github.com/libssh2/libssh2.git#tag=${pkgname}-${pkgver}"
  $pkgname-1.11.1-CVE-2025-15661.patch
  $pkgname-1.11.1-CVE-2026-55200.patch
  $pkgname-1.11.1-CVE-2026-58050.patch
  $pkgname-1.11.1-CVE-2026-66032.patch
  $pkgname-1.11.1-CVE-2026-66034.patch
  $pkgname-1.11.1-CVE-2026-66035.patch
)
sha256sums=('3e5321d9cb1b66425325f982a34ad21f75f40bb8d5c09ada1462723de0faeb7d'
            'c4a6c42695118e98481fc9161a1586572b9c93a3506c3169d659dcfddf604530'
            'c4c1b73d874900497043415bcc7048edd62e1db0fe40f1ccf89dd34e21297ad7'
            '5f4716a66d2b95144a0fb6634f3a138a0992f5a4016043202c88a2eeefe8b639'
            '6fc207c5d2d2e289f4a43b2ea0dbba0b7ebc476c69c25578d3533d3c3c6fe6b4'
            'e57daaaeb55664c9d88aeea67189d0b43f015430f130fe85fe01798a5fdbad05'
            '25d69568035705df1d2fb1d46a33dc6027e34116b6179397cf824a9cb0dbb190')

prepare()
{
  cd $pkgname
  patch -Np1 -i ../$pkgname-1.11.1-CVE-2025-15661.patch  # CVE-2025-15661
  git cherry-pick -n 256d04b60d80bf1190e96b0ad1e91b2174d744b1  # CVE-2026-7598
  git cherry-pick -n 17626857d20b3c9a1addfa45979dadcee1cd84a4  # CVE-2026-55199
  patch -Np1 -i ../$pkgname-1.11.1-CVE-2026-55200.patch  # CVE-2026-55200
  git cherry-pick -n a9758da45a52bc8c630ec9493804d0c6ea30b24a  # CVE-2026-58051
  patch -Np1 -i ../$pkgname-1.11.1-CVE-2026-58050.patch  # CVE-2026-58050
  patch -Np1 -i ../$pkgname-1.11.1-CVE-2026-66032.patch  # CVE-2026-66032
  # CVE-2026-66033: https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6
  git cherry-pick -n a2ed82d40964bbc0d64cd717aa0a5a892117d2e6
  patch -Np1 -i ../$pkgname-1.11.1-CVE-2026-66034.patch  # CVE-2026-66034
  patch -Np1 -i ../$pkgname-1.11.1-CVE-2026-66035.patch  # CVE-2026-66035
  # The "_DEV" suffix is only removed from `LIBSSH2_VERSION` for dist tarballs, so we do it here.
  sed 's/_DEV//' --in-place include/libssh2.h
  autoreconf -fiv
}

build()
{
  cd "$pkgname"

  ./configure --prefix=/usr	\
	  --disable-docker-tests
  make
}

check()
{
  make -C "$pkgname" check
}

package()
{
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
