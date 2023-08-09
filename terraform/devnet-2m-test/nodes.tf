# Bootnode
variable "bootnode" {
  default = {
    name            = "bootnode"
    count           = 1
    validator_start = 0
    validator_end   = 0
  }
}

# Lighthouse
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 73
    validator_start = 0
    validator_end   = 240900
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 26
    validator_start = 379500
    validator_end   = 465300
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 42
    validator_start = 240900
    validator_end   = 379500
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
    count           = 93
    validator_start = 465300
    validator_end   = 772200
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 34
    validator_start = 947100
    validator_end   = 1059300
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 53
    validator_start = 772200
    validator_end   = 947100
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
    count           = 2
    validator_start = 1372800
    validator_end   = 1379400
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 1
    validator_start = 1379400
    validator_end   = 1382700
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 1
    validator_start = 1382700
    validator_end   = 1386000
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
    count           = 11
    validator_start = 1303500
    validator_end   = 1339800
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 4
    validator_start = 1359600
    validator_end   = 1372800
  }

}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 6
    validator_start = 1339800
    validator_end   = 1359600
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
    count           = 38
    validator_start = 1059300
    validator_end   = 1184700
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 14
    validator_start = 1257300
    validator_end   = 1303500
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 22
    validator_start = 1184700
    validator_end   = 1257300
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