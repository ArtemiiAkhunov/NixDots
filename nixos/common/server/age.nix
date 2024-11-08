{
  age.secrets = {
    wireguard_private = {
      file = ../../../secrets/wireguard_private.age;
    };
    porkbun_api = {
      file = ../../../secrets/porkbun_api.age;
    };
    synapse_secrets = {
      file = ../../../secrets/synapse_secrets.age;
    };
  };
}
