# Bootnode
variable "bootnode" {
  default = {
    name  = "bootnode"
    count = 1
    validator_start = 0
    validator_end   = 0
  }
}

# Lighthouse
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 50
    validator_start = 0
    validator_end   = 250000
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 20
    validator_start = 250000
    validator_end   = 350000
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 50
    validator_start = 350000
    validator_end   = 600000
  }
}

variable "lighthouse_ethereumjs" {
  default = {
    name            = "lighthouse-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Prysm
variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 20
    validator_start = 600000
    validator_end   = 700000
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 20
    validator_start = 700000
    validator_end   = 800000
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 20
    validator_start = 800000
    validator_end   = 900000
  }
}

variable "prysm_ethereumjs" {
  default = {
    name            = "prysm-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Lodestar
variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 20
    validator_start = 900000
    validator_end   = 1000000
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 20
    validator_start = 1000000
    validator_end   = 1100000
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 20
    validator_start = 1100000
    validator_end   = 1200000
  }
}

variable "lodestar_ethereumjs" {
  default = {
    name            = "lodestar-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_erigon" {
  default = {
    name            = "lodestar-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Nimbus
variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 20
    validator_start = 1200000
    validator_end   = 1300000
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 20
    validator_start = 1300000
    validator_end   = 1400000
  }

}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 20
    validator_start = 1400000
    validator_end   = 1500000
  }
}

variable "nimbus_ethereumjs" {
  default = {
    name            = "nimbus-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_erigon" {
  default = {
    name            = "nimbus-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Teku
variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 50
    validator_start = 1500000
    validator_end   = 1750000
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 20
    validator_start = 1750000
    validator_end   = 1850000
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 50
    validator_start = 1850000
    validator_end   = 2100000
  }
}

variable "teku_ethereumjs" {
  default = {
    name            = "teku-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}