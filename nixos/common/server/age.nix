{
  age.secrets = {
    wireguard_private = {
      file = ../../../secrets/wireguard_private.age;
    };
    porkbun_api = {
      file = ../../../secrets/porkbun_api.age;
    };
  };
}
