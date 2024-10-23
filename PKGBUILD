# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=linux-firmware
pkgname=(
  $pkgbase
  amd-ucode
  $pkgbase-{nfp,mellanox,marvell,qcom,liquidio,qlogic,bnx2x,iwlwifi,amdgpu,atheros,mediatek,whence}
)
pkgver=20241017
pkgrel=1
pkgdesc="Firmware files for Linux"
url="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('GPL2' 'GPL3' 'custom')
arch=('any')
makedepends=('git' 'rdfind' 'symlinks' 'python')
options=(!strip)
source=("git+https://mirrors.tuna.tsinghua.edu.cn/git/linux-firmware.git#tag=$pkgver" fix-symlink.patch)
#source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git#tag=$pkgver")
sha256sums=('aa1a14007b90e1c8c20ab7ac0224d340db4bc3481d54bf52182a773fd0828fdd'
            '86046b3d56ccf28265aacc8dfdd2e0cad88e3c13139e934cb7f5b7cdd89c8d88')

prepare() {
  _patch_ $pkgbase
  # fix realpath
  sed -i 's|realpath -m -s|realpath|g' $pkgbase/copy-firmware.sh
  sed -i 's|realpath -s|realpath|g' $pkgbase/copy-firmware.sh
}

build() {
  mkdir -p kernel/x86/microcode
  cat $pkgbase/amd-ucode/microcode_amd*.bin > kernel/x86/microcode/AuthenticAMD.bin
  
  echo kernel/x86/microcode/AuthenticAMD.bin |
    bsdtar --uid 0 --gid 0 -cnf - -T - |
    bsdtar --null -cf - --format=newc @- > amd-ucode.img
}

package_linux-firmware-whence() {
  pkgdesc+=" - contains the WHENCE license file which documents the vendor license details"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ${pkgbase}/WHENCE
}


package_linux-firmware() {
  depends=('linux-firmware-whence')

  cd $pkgbase
  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install-zst
  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware dedup
  
  cd "${pkgdir}"
  
  _pick_ nfp usr/lib/firmware/netronome
  _pick_ mellanox usr/lib/firmware/mellanox
  _pick_ marvell usr/lib/firmware/{libertas,mwl8k,mwlwifi,mrvl}
  _pick_ qcom usr/lib/firmware/{qcom,a300_*}
  _pick_ atheros usr/lib/firmware/ath*
  _pick_ liquidio usr/lib/firmware/liquidio
  _pick_ qlogic usr/lib/firmware/{qlogic,qed,ql2???_*,c{b,t,t2}fw-*}
  _pick_ bnx2x usr/lib/firmware/bnx2x*
  _pick_ iwlwifi usr/lib/firmware/iwlwifi*
  _pick_ amdgpu usr/lib/firmware/amdgpu
  _pick_ mediatek usr/lib/firmware/mediatek
}

package_amd-ucode() {
  pkgdesc="Microcode update image for AMD CPUs"
  license=(custom)

  install -Dt "${pkgdir}/boot" -m644 amd-ucode.img
}

package_linux-firmware-nfp() {
  pkgdesc+=" - nfp / Firmware for Netronome Flow Processors"
  depends=('linux-firmware-whence')
  mv -v pkgs/nfp/* "${pkgdir}"
}

package_linux-firmware-mellanox() {
  pkgdesc+=" - mellanox / Firmware for Mellanox Spectrum switches"
  depends=('linux-firmware-whence')
  mv -v pkgs/mellanox/* "${pkgdir}"
}

package_linux-firmware-marvell() {
  pkgdesc+=" - marvell / Firmware for Marvell devices"
  depends=('linux-firmware-whence')
  mv -v pkgs/marvell/* "${pkgdir}"
}

package_linux-firmware-qcom() {
  pkgdesc+=" - qcom / Firmware for Qualcomm SoCs"
  depends=('linux-firmware-whence')
  mv -v pkgs/qcom/* "${pkgdir}"
}

package_linux-firmware-liquidio() {
  pkgdesc+=" - liquidio / Firmware for Cavium LiquidIO server adapters"
  depends=('linux-firmware-whence')
  mv -v pkgs/liquidio/* "${pkgdir}"
}

package_linux-firmware-qlogic() {
  pkgdesc+=" - qlogic / Firmware for QLogic devices"
  depends=('linux-firmware-whence')
  mv -v pkgs/qlogic/* "${pkgdir}"
}

package_linux-firmware-bnx2x() {
  pkgdesc+=" - bnx2x / Firmware for Broadcom NetXtreme II 10Gb ethernet adapters"
  depends=('linux-firmware-whence')
  mv -v pkgs/bnx2x/* "${pkgdir}"
}

package_linux-firmware-iwlwifi() {
  pkgdesc+=" - iwlwifi / Firmware for Intel's current wireless chips"
  depends=('linux-firmware-whence')
  mv -v pkgs/iwlwifi/* "${pkgdir}"
}

package_linux-firmware-amdgpu() {
  pkgdesc+=" - iwlwifi / Firmware for AMD's GPU"
  depends=('linux-firmware-whence')
  mv -v pkgs/amdgpu/* "${pkgdir}"
}

package_linux-firmware-atheros() {
  pkgdesc+=" - atheros / Firmware for Qualcomm Atheros wireless chips"
  depends=('linux-firmware-whence')
  mv -v pkgs/atheros/* "${pkgdir}"
}

package_linux-firmware-mediatek() {
  pkgdesc+=" - atheros / Firmware for mediatek chips"
  depends=('linux-firmware-whence')
  mv -v pkgs/mediatek/* "${pkgdir}"
}
