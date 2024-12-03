# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pambase
pkgver=20241203
pkgrel=1
pkgdesc="Base PAM configuration for services"
arch=(any)
url="https://os.ewe.moe"
license=(GPL-3.0-or-later)
backup=(
  etc/pam.d/system-auth
  etc/pam.d/system-local-login
  etc/pam.d/system-login
  etc/pam.d/system-remote-login
  etc/pam.d/system-services
  etc/pam.d/other
)
source=(
  system-auth
  system-local-login
  system-login
  system-remote-login
  system-services
  other
)
sha512sums=('afcca27d03a3fd1cc5daeb960ff0b317284cfec005683e39bda6ff16a371121ebae59decfe7739c0ee90c04490940a60dfee64f637acaf8a2cb0f153b8bfc845'
            '83cc3d84ef5afded9afd4d347132901b9adcbd8b21be45b80d010370a2082e8388a713eb78d052944bc47b07fd7383edf18e2674d9d0545215cc45e14a2e14b1'
            'ffbedda2cfa2c68d42b0ea54f9d30069353a59460d070ac9894815add6a111d51f7f0914b70391347c280b7a601589208f0c1f33b22f0bd0ddda058ff6eddba9'
            '83cc3d84ef5afded9afd4d347132901b9adcbd8b21be45b80d010370a2082e8388a713eb78d052944bc47b07fd7383edf18e2674d9d0545215cc45e14a2e14b1'
            '5c2947f8644803783d19cc97ddc19fdaa234dac41a939edd32c9452e78bb2a4751bceeb4737d0791fb122ca932b8b941aab869b6dec3146bf90e94517d31724a'
            'df554f70f017dd3f6023a3c62b95d19123eaf41c08deaac0c4bc343fcce6eeefcf468910f7cb9ba58ee2846abb88091d18d718eb0228e38f6ce26ebced94c407')

package() {
  install -vDm 644 "${source[@]}" -t "$pkgdir/etc/pam.d/"
}
