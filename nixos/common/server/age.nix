{
  age.secrets = {
    tls_cert = {
      file = ../../../secrets/tls_cert.age;
    };
    tls_private = {
      file = ../../../secrets/tls_private.age;
    };
    wireguard_private = {
      file = ../../../secrets/wireguard_private.age;
    };
  };
}
