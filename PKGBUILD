# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gvfs
pkgname=(
  gvfs
  gvfs-nfs
)
pkgver=1.61.1
pkgrel=1
pkgdesc="Virtual filesystem implementation for GIO"
url="https://gitlab.gnome.org/GNOME/gvfs"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-only)
depends=(
  dconf
  fuse3
  gcr-4
  glib2
  gsettings-desktop-schemas
  libarchive
  libgcrypt
  libsecret
  libsoup3
  libusb
)
makedepends=(
  dbus
  docbook-xsl
  git
  libnfs
  libxml2
  meson
  python
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gvfs.git#tag=$pkgver")
sha256sums=('539df3fb2efd09b32605ec00909207bb9d5b8333fb7b06c7b086db9742deee5f')

build() {
  # admin: polkit
  # dnssd: avahi
  # afc: libimobiledevice libplist
  # udisks2: udisks2
  # gudev: gudev
  # goa: gnome-online-accounts
  # bluray: libbluray
  # google: libgdata
  # onedrive: msgraph
  # gphoto2: libgphoto2 gudev
  # mtp: libmtp gudev
  # smb: smbclient
  # wsdd: wsdd
  # cdda: libcdio-paranoia gudev
  local meson_options=(
    -D man=true
    -D systemduserunitdir="no"
    -D tmpfilesdir="no"
    -D admin=false
    -D dnssd=false
    -D gudev=false
    -D udisks2=false
    -D logind=false
    -D afc=false
    -D goa=false
    -D bluray=false
    -D google=false
    -D onedrive=false
    -D gphoto2=false
    -D mtp=false
    -D smb=false
    -D wsdd=false
    -D cdda=false
  )

  ewe-meson gvfs build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_gvfs() {
  optdepends=(
    'gvfs-afc: AFC support (Apple mobile devices)'
    'gvfs-dnssd: DNS-SD and WebDAV support (macOS file sharing)'
    'gvfs-goa:  Gnome Online Accounts support (e.g. OwnCloud)'
    'gvfs-google: Google Drive support'
    'gvfs-gphoto2: gphoto2 support (PTP camera, MTP media player)'
    'gvfs-mtp: MTP support (Android, media player)'
    'gvfs-nfs: NFS support'
    'gvfs-onedrive: Microsoft OneDrive support'
    'gvfs-smb: SMB/CIFS support (Windows file sharing)'
    'gvfs-wsdd: Web Services Dynamic Discovery support (Windows discovery)'
  )

  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"

    _pick_ nfs \
      usr/lib/gvfsd-nfs \
      usr/share/gvfs/mounts/nfs.mount
  )
}

package_gvfs-nfs() {
  pkgdesc+=" - NFS backend"
  depends=(
    "gvfs=$pkgver"
    glib2
    libnfs
  )

  mv pkgs/nfs/* "$pkgdir"
}
