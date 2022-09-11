# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman
pkgver=6.0.1
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
groups=('base-devel')
depends=('bash' 'libarchive' 'curl' 'gettext' 'fakeroot')
# no meson build yet, add depend: ninja, use python pip install as temp meson
makedepends=('python' 'libarchive' 'openssl' 'ninja' 'acl' 'curl' 'xz')
checkdepends=('python')
provides=('libalpm.so')
backup=(etc/pacman.conf
        etc/makepkg.conf)
source=(
	https://sources.archlinux.org/other/pacman/$pkgname-$pkgver.tar.xz
        https://os-repo.ewe.moe/eweos/pacman.conf
        makepkg.conf
        )
sha256sums=(
        'SKIP'
        'SKIP'
        'SKIP'
)

build() {
    pip install meson --user
    export PATH=~/.local/bin:$PATH
    cd "$pkgname-$pkgver"
    sed -i -e 's/EUID == 0/EUID == -1/' scripts/makepkg.sh.in
    sed -i '/bsdtar -xf .*dbfile/s@-C@--no-fflags -C@' scripts/repo-add.sh.in
    mkdir build
    cd build || return
    meson --prefix=/usr ..
    ninja --verbose
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
    install -dm755 "$pkgdir/etc"
    install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
    install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}
