THIS_NAME='%THIS_NAME%'

fix_default() {
  if [ ! -x /usr/bin/java ]; then
    /usr/bin/eweos-java unset
    echo ""
  else
    /usr/bin/eweos-java get
  fi
}

post_install() {
  default=$(fix_default)
  case ${default} in
    "")
      /usr/bin/eweos-java set ${THIS_NAME}
      ;;
    ${THIS_NAME})
      # Nothing
      ;;
    *)
      echo "Default Java environment is already set to '${default}'"
      echo "See 'eweos-java help' to change it"
      ;;
  esac

  if [ ! -f /etc/ssl/certs/java/cacerts ]; then
    /usr/bin/update-ca-trust
  fi
}

post_upgrade() {
  default=$(fix_default)
  if [ -z "${default}" ]; then
    /usr/bin/eweos-java set ${THIS_NAME}
  fi

  if [ ! -f /etc/ssl/certs/java/cacerts ]; then
    /usr/bin/update-ca-trust
  fi
}

pre_remove() {
  if [ "x$(fix_default)" = "x${THIS_NAME}" ]; then
    # Check JRE is still available
    if [ -x /usr/lib/jvm/${THIS_NAME}/bin/java ]; then
      /usr/bin/eweos-java unset
    fi
  fi
}
