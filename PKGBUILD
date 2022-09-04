# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=filesystem
pkgver=1.0.0
pkgrel=1
pkgdesc='The base directory structure and a few core files for the system.'
arch=(x86_64)
url='https://os.ewe.moe'
license=(MIT)
groups=(base)
depends=()
makedepends=()
options=(emptydirs)
source=(
    passwd
    group
    profile
    shells
    services
    protocols
    shadow
    os-release
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

backup=(
    etc/passwd
    etc/group
    etc/profile
    etc/shadow
    etc/shells
    etc/services
    etc/protocols
)

package() {
    install -d "${pkgdir}/boot"
    install -d "${pkgdir}/dev"
    install -d "${pkgdir}/etc/default"
    ln -s /proc/mounts "${pkgdir}/etc/mtab"
    install -d "${pkgdir}/home"
    install -d "${pkgdir}/mnt"
    install -d -m 0555 "${pkgdir}/proc"
    install -d -m 0750 "${pkgdir}/root"
    install -d -m 0755 "${pkgdir}/run"
    install -d -m 0555 "${pkgdir}/sys"
    install -d -m 1777 "${pkgdir}/tmp"
    install -d "${pkgdir}/srv"
    install -d "${pkgdir}/usr/"{bin,include,local/bin,local/sbin,share/man,lib/modules}
    install -d "${pkgdir}/var/"{cache,lock,lib,log,mail,spool}
    ln -s /run "${pkgdir}/var/run"
    ln -s /usr/lib "${pkgdir}/lib"
    ln -s /usr/lib "${pkgdir}/lib64"
    ln -s /usr/lib "${pkgdir}/usr/lib64"
    ln -s /usr/bin "${pkgdir}/bin"
    ln -s /usr/bin "${pkgdir}/usr/sbin"
    ln -s /usr/bin "${pkgdir}/sbin"
    install -d -m 1777 "${pkgdir}/var/tmp"
    install -m0644 passwd    "${pkgdir}/etc/passwd"
    install -m0400 shadow    "${pkgdir}/etc/shadow"
    install -m0644 group     "${pkgdir}/etc/group"
    install -m0644 profile   "${pkgdir}/etc/profile"
    install -m0644 shells    "${pkgdir}/etc/shells"
    install -m0644 services  "${pkgdir}/etc/services"
    install -m0644 protocols "${pkgdir}/etc/protocols"
    install -m0644 os-release "${pkgdir}/etc/os-release"
}
