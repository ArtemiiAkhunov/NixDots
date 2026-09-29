{
  age.secrets = {
    oracle_wireguard_private = {
      file = ../../../secrets/oracle_wireguard_private.age;
    };
    porkbun_api = {
      file = ../../../secrets/porkbun_api.age;
    };
    nut_admin_password = {
      file = ../../../secrets/nut_admin_password.age;
    };
    nut_observer_password = {
      file = ../../../secrets/nut_observer_password.age;
    };
    hydra_secret = {
      file = ../../../secrets/hydra_secret.age;
      mode = "770";
      owner = "hydra";
      group = "hydra";
    };
  };
}
