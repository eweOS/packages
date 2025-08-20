# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=modemmanager
pkgname=(
  modemmanager
  libmm-glib
  modemmanager-docs
)
pkgver=1.24.2
pkgrel=1
pkgdesc="Mobile broadband modem management service"
url="https://www.freedesktop.org/wiki/Software/ModemManager/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(
  bash
  dbus
  llvm-libs
  glib2
  musl
  hicolor-icon-theme
  mobile-broadband-provider-info
)
makedepends=(
  bash-completion
  git
  gobject-introspection
  gtk-doc
  linux-headers
  meson
  vala
)
checkdepends=(
  python-dbus
  python-gobject
)
source=(
  "git+https://gitlab.freedesktop.org/mobile-broadband/ModemManager.git#tag=${pkgver/[a-z]/-&}"
)
sha256sums=('8afe494c388c82d02ff2b9b3ddab6f10393f0b74998e2e3244d11242c8848cfd')

prepare() {
  cd ModemManager

  # Fix gtk-doc build
  git cherry-pick -n 1ec2b86239c3686e22034baae0068bd5d52779ae

  # Fix for Fibocom modems
  # https://gitlab.archlinux.org/archlinux/packaging/packages/modemmanager/-/issues/1
  git cherry-pick -n 018e44084825ab294ad2b5d5b301d2b9e2577eb1
}

build() {
  local meson_options=(
    -D dbus_policy_dir=/usr/share/dbus-1/system.d
    -D dist_version="\"$pkgver-$pkgrel\""
    -D gtk_doc=true
    -D udev=false
    -D vapi=true
    -D polkit=no
    -D mbim=false
    -D qmi=false
    -D qrtr=false
    -D udevdir="/usr/lib/udev/rules.d/"
    -D systemdsystemunitdir="no"
    -D systemd_suspend_resume=false
    -D systemd_journal=false
  )

  local plugins_options=(
    -Dplugin_generic=disabled
    -Dplugin_altair_lte=disabled
    -Dplugin_anydata=disabled
    -Dplugin_broadmobi=disabled
    -Dplugin_cellient=disabled
    -Dplugin_cinterion=disabled
    -Dplugin_dell=disabled
    -Dplugin_dlink=disabled
    -Dplugin_fibocom=disabled
    -Dplugin_foxconn=disabled
    -Dplugin_gosuncn=disabled
    -Dplugin_haier=disabled
    -Dplugin_huawei=disabled
    -Dplugin_intel=disabled
    -Dplugin_iridium=disabled
    -Dplugin_linktop=disabled
    -Dplugin_longcheer=disabled
    -Dplugin_mbm=disabled
    -Dplugin_motorola=disabled
    -Dplugin_mtk_legacy=disabled
    -Dplugin_mtk=disabled
    -Dplugin_netprisma=disabled
    -Dplugin_nokia=disabled
    -Dplugin_nokia_icera=disabled
    -Dplugin_novatel=disabled
    -Dplugin_novatel_lte=disabled
    -Dplugin_option=disabled
    -Dplugin_option_hso=disabled
    -Dplugin_pantech=disabled
    -Dplugin_qcom_soc=disabled
    -Dplugin_quectel=disabled
    -Dplugin_rolling=disabled
    -Dplugin_samsung=disabled
    -Dplugin_sierra_legacy=disabled
    -Dplugin_sierra=disabled
    -Dplugin_simtech=disabled
    -Dplugin_telit=disabled
    -Dplugin_thuraya=disabled
    -Dplugin_tplink=disabled
    -Dplugin_ublox=disabled
    -Dplugin_via=disabled
    -Dplugin_wavecom=disabled
    -Dplugin_x22x=disabled
    -Dplugin_zte=disabled
  )

  ewe-meson ModemManager build "${meson_options[@]}" "${plugins_options[@]}"
  meson compile -C build
}

package_modemmanager() {
  license=(GPL-2.0-or-later)
  depends+=(libmm-glib=$pkgver-$pkgrel glib2)
  optdepends=(
    'usb_modeswitch: install if your modem shows up as a storage drive'
  )

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"
  _pick_ libmm usr/include
  _pick_ libmm usr/lib/girepository-1.0
  _pick_ libmm usr/lib/libmm-glib.so*
  _pick_ libmm usr/lib/pkgconfig
  _pick_ libmm usr/share/gir-1.0
  _pick_ libmm usr/share/vala
  _pick_ docs usr/share/gtk-doc
}

package_libmm-glib() {
  pkgdesc="ModemManager library"
  license=(LGPL-2.1-or-later)
  depends=(llvm-libs glib2 musl)
  provides=(libmm-glib.so)

  mv pkgs/libmm/* "$pkgdir"
}

package_modemmanager-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv pkgs/docs/* "$pkgdir"
}
