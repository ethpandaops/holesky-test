////////////////////////////////////////////////////////////////////////////////////////
//                            TERRAFORM PROVIDERS & BACKEND
////////////////////////////////////////////////////////////////////////////////////////
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.28"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1"
    bucket                      = "merge-testnets"
    key                         = "infrastructure/devnet-2m-test/terraform.tfstate"
  }
}

provider "digitalocean" {
  http_retry_max = 20
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        VARIABLES
////////////////////////////////////////////////////////////////////////////////////////
variable "ethereum_network" {
  type    = string
  default = "devnet-2m-test"
}

variable "digitalocean_project_name" {
  type    = string
  default = "Public Testnets"
}

variable "digitalocean_ssh_key_name" {
  type    = string
  default = "shared-devops-eth2"
}

variable "digitalocean_vpcs" {
  type = map
  default = {
    "nyc1" = {
      name = "devnet-2m-test-nyc1"
      ip_range = "10.50.50.0/24"
    }
    "sfo1" = {
      name = "devnet-2m-test-sfo1"
      ip_range = "10.50.51.0/24"
    }
    "nyc2" = {
      name = "devnet-2m-test-nyc2"
      ip_range = "10.50.52.0/24"
    }
    "ams2" = {
      name = "devnet-2m-test-am2"
      ip_range = "10.50.53.0/24"
    }
    "sgp1" = {
      name = "devnet-2m-test-sgp1"
      ip_range = "10.50.54.0/24"
    }
    "lon1" = {
      name = "devnet-2m-test-lon1"
      ip_range = "10.50.55.0/24"
    }
    "nyc3" = {
      name = "devnet-2m-test-nyc3"
      ip_range = "10.50.56.0/24"
    }
    "ams3" = {
      name = "devnet-2m-test-ams3"
      ip_range = "10.50.57.0/24"
    }
    "fra1" = {
      name = "devnet-2m-test-fra1"
      ip_range = "10.50.58.0/24"
    }
    "tor1" = {
      name = "devnet-2m-test-tor1"
      ip_range = "10.50.59.0/24"
    }
    "sfo2" = {
      name = "devnet-2m-test-sfo2"
      ip_range = "10.50.60.0/24"
    }
    "blr1" = {
      name = "devnet-2m-test-blr1"
      ip_range = "10.50.61.0/24"
    }
    "sfo3" = {
      name = "devnet-2m-test-sfo3"
      ip_range = "10.50.62.0/24"
    }
    "syd1" = {
      name = "devnet-2m-test-syd1"
      ip_range = "10.50.63.0/24"
    }
  }
}

variable "digitalocean_vm_groups" {
  type = list(any)
  default = [
    {
      id = "bootnode"
      vms = {
        "1" = {}
      }
    },
    // Lighthouse combos
    {
      "id" = "lighthouse-geth",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=0 validator_end=5000", "region": "nyc1" },
        "2" = { "ansible_vars": "validator_start=5000 validator_end=10000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=10000 validator_end=15000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=15000 validator_end=20000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=20000 validator_end=25000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=25000 validator_end=30000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=30000 validator_end=35000", "region": "ams3" },
        "8" = { "ansible_vars": "validator_start=35000 validator_end=40000", "region": "fra1" },
        "9" = { "ansible_vars": "validator_start=40000 validator_end=45000", "region": "tor1" },
        "10" = { "ansible_vars": "validator_start=45000 validator_end=50000", "region": "sfo2" },
        "11" = { "ansible_vars": "validator_start=50000 validator_end=55000", "region": "nyc3" },
        "12" = { "ansible_vars": "validator_start=55000 validator_end=60000", "region": "sfo3" },
        "13" = { "ansible_vars": "validator_start=60000 validator_end=65000", "region": "syd1" },
        "14" = { "ansible_vars": "validator_start=65000 validator_end=70000", "region": "blr1" },
        "15" = { "ansible_vars": "validator_start=70000 validator_end=75000", "region": "nyc1" },
        "16" = { "ansible_vars": "validator_start=75000 validator_end=80000", "region": "nyc2" },
        "17" = { "ansible_vars": "validator_start=80000 validator_end=85000", "region": "ams2" },
        "18" = { "ansible_vars": "validator_start=85000 validator_end=90000", "region": "sgp1" },
        "19" = { "ansible_vars": "validator_start=90000 validator_end=95000", "region": "lon1" },
        "20" = { "ansible_vars": "validator_start=95000 validator_end=100000", "region": "ams3" },
        "21" = { "ansible_vars": "validator_start=100000 validator_end=105000", "region": "fra1" },
        "22" = { "ansible_vars": "validator_start=105000 validator_end=110000", "region": "tor1" },
        "23" = { "ansible_vars": "validator_start=110000 validator_end=115000", "region": "sfo2" },
        "24" = { "ansible_vars": "validator_start=115000 validator_end=120000", "region": "nyc3" },
        "25" = { "ansible_vars": "validator_start=120000 validator_end=125000", "region": "sfo3" },
        "26" = { "ansible_vars": "validator_start=125000 validator_end=130000", "region": "syd1" },
        "27" = { "ansible_vars": "validator_start=130000 validator_end=135000", "region": "blr1" },
        "28" = { "ansible_vars": "validator_start=135000 validator_end=140000", "region": "nyc1" },
        "29" = { "ansible_vars": "validator_start=140000 validator_end=145000", "region": "nyc2" },
        "30" = { "ansible_vars": "validator_start=145000 validator_end=150000", "region": "ams2" },
        "31" = { "ansible_vars": "validator_start=150000 validator_end=155000", "region": "sgp1" },
        "32" = { "ansible_vars": "validator_start=155000 validator_end=160000", "region": "lon1" },
        "33" = { "ansible_vars": "validator_start=160000 validator_end=165000", "region": "ams3" },
        "34" = { "ansible_vars": "validator_start=165000 validator_end=170000", "region": "fra1" },
        "35" = { "ansible_vars": "validator_start=170000 validator_end=175000", "region": "tor1" },
        "36" = { "ansible_vars": "validator_start=175000 validator_end=180000", "region": "sfo2" },
        "37" = { "ansible_vars": "validator_start=180000 validator_end=185000", "region": "nyc3" },
        "38" = { "ansible_vars": "validator_start=185000 validator_end=190000", "region": "sfo3" },
        "39" = { "ansible_vars": "validator_start=190000 validator_end=195000", "region": "syd1" },
        "40" = { "ansible_vars": "validator_start=195000 validator_end=200000", "region": "blr1" },
        "41" = { "ansible_vars": "validator_start=200000 validator_end=205000", "region": "nyc1" },
        "42" = { "ansible_vars": "validator_start=205000 validator_end=210000", "region": "nyc2" },
        "43" = { "ansible_vars": "validator_start=210000 validator_end=215000", "region": "ams2" },
        "44" = { "ansible_vars": "validator_start=215000 validator_end=220000", "region": "sgp1" },
        "45" = { "ansible_vars": "validator_start=220000 validator_end=225000", "region": "lon1" },
        "46" = { "ansible_vars": "validator_start=225000 validator_end=230000", "region": "ams3" },
        "47" = { "ansible_vars": "validator_start=230000 validator_end=235000", "region": "fra1" },
        "48" = { "ansible_vars": "validator_start=235000 validator_end=240000", "region": "tor1" },
        "49" = { "ansible_vars": "validator_start=240000 validator_end=245000", "region": "sfo2" },
        "50" = { "ansible_vars": "validator_start=245000 validator_end=250000", "region": "nyc3" }
      }
    },
    # lighthouse-besu
    {
      "id" = "lighthouse-besu",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=250000 validator_end=255000", "region": "nyc1" },
        "2" = { "ansible_vars": "validator_start=255000 validator_end=260000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=260000 validator_end=265000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=265000 validator_end=270000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=270000 validator_end=275000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=275000 validator_end=280000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=280000 validator_end=285000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=285000 validator_end=290000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=290000 validator_end=295000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=295000 validator_end=300000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=300000 validator_end=305000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=305000 validator_end=310000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=310000 validator_end=315000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=315000 validator_end=320000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=320000 validator_end=325000", "region": "nyc1" },
        "16" = { "ansible_vars": "validator_start=325000 validator_end=330000", "region": "sfo1" },
        "17" = { "ansible_vars": "validator_start=330000 validator_end=335000", "region": "nyc2" },
        "18" = { "ansible_vars": "validator_start=335000 validator_end=340000", "region": "ams2" },
        "19" = { "ansible_vars": "validator_start=340000 validator_end=345000", "region": "sgp1" },
        "20" = { "ansible_vars": "validator_start=345000 validator_end=350000", "region": "lon1" },
      }
    },
    # lighthouse-nethermind 1-50
     {
       "id" = "lighthouse-nethermind",
       "vms" = {
          "1" = {"ansible_vars": "validator_start=350000 validator_end=355000", "region": "nyc1"},
          "2" = {"ansible_vars": "validator_start=355000 validator_end=360000", "region": "sfo1"},
          "3" = {"ansible_vars": "validator_start=360000 validator_end=365000", "region": "nyc2"},
          "4" = {"ansible_vars": "validator_start=365000 validator_end=370000", "region": "ams2"},
          "5" = {"ansible_vars": "validator_start=370000 validator_end=375000", "region": "sgp1"},
          "6" = {"ansible_vars": "validator_start=375000 validator_end=380000", "region": "lon1"},
          "7" = {"ansible_vars": "validator_start=380000 validator_end=385000", "region": "nyc3"},
          "8" = {"ansible_vars": "validator_start=385000 validator_end=390000", "region": "ams3"},
          "9" = {"ansible_vars": "validator_start=390000 validator_end=395000", "region": "fra1"},
          "10" = {"ansible_vars": "validator_start=395000 validator_end=400000", "region": "tor1"},
          "11" = {"ansible_vars": "validator_start=400000 validator_end=405000", "region": "sfo2"},
          "12" = {"ansible_vars": "validator_start=405000 validator_end=410000", "region": "blr1"},
          "13" = {"ansible_vars": "validator_start=410000 validator_end=415000", "region": "sfo3"},
          "14" = {"ansible_vars": "validator_start=415000 validator_end=420000", "region": "syd1"},
          "15" = {"ansible_vars": "validator_start=420000 validator_end=425000", "region": "nyc1"},
          "16" = {"ansible_vars": "validator_start=425000 validator_end=430000", "region": "sfo1"},
          "17" = {"ansible_vars": "validator_start=430000 validator_end=435000", "region": "nyc2"},
          "18" = {"ansible_vars": "validator_start=435000 validator_end=440000", "region": "ams2"},
          "19" = {"ansible_vars": "validator_start=440000 validator_end=445000", "region": "sgp1"},
          "20" = {"ansible_vars": "validator_start=445000 validator_end=450000", "region": "lon1"},
          "21" = {"ansible_vars": "validator_start=450000 validator_end=455000", "region": "nyc3"},
          "22" = {"ansible_vars": "validator_start=455000 validator_end=460000", "region": "ams3"},
          "23" = {"ansible_vars": "validator_start=460000 validator_end=465000", "region": "fra1"},
          "24" = {"ansible_vars": "validator_start=465000 validator_end=470000", "region": "tor1"},
          "25" = {"ansible_vars": "validator_start=470000 validator_end=475000", "region": "sfo2"},
          "26" = {"ansible_vars": "validator_start=475000 validator_end=480000", "region": "blr1"},
          "27" = {"ansible_vars": "validator_start=480000 validator_end=485000", "region": "sfo3"},
          "28" = {"ansible_vars": "validator_start=485000 validator_end=490000", "region": "syd1"},
          "29" = {"ansible_vars": "validator_start=490000 validator_end=495000", "region": "nyc1"},
          "30" = {"ansible_vars": "validator_start=495000 validator_end=500000", "region": "sfo1"},
          "31" = {"ansible_vars": "validator_start=500000 validator_end=505000", "region": "nyc2"},
          "32" = {"ansible_vars": "validator_start=505000 validator_end=510000", "region": "ams2"},
          "33" = {"ansible_vars": "validator_start=510000 validator_end=515000", "region": "sgp1"},
          "34" = {"ansible_vars": "validator_start=515000 validator_end=520000", "region": "lon1"},
          "35" = {"ansible_vars": "validator_start=520000 validator_end=525000", "region": "nyc3"},
          "36" = {"ansible_vars": "validator_start=525000 validator_end=530000", "region": "ams3"},
          "37" = {"ansible_vars": "validator_start=530000 validator_end=535000", "region": "fra1"},
          "38" = {"ansible_vars": "validator_start=535000 validator_end=540000", "region": "tor1"},
          "39" = {"ansible_vars": "validator_start=540000 validator_end=545000", "region": "sfo2"},
          "40" = {"ansible_vars": "validator_start=545000 validator_end=550000", "region": "blr1"},
          "41" = {"ansible_vars": "validator_start=550000 validator_end=555000", "region": "sfo3"},
          "42" = {"ansible_vars": "validator_start=555000 validator_end=560000", "region": "syd1"},
          "43" = {"ansible_vars": "validator_start=560000 validator_end=565000", "region": "nyc1"},
          "44" = {"ansible_vars": "validator_start=565000 validator_end=570000", "region": "sfo1"},
          "45" = {"ansible_vars": "validator_start=570000 validator_end=575000", "region": "nyc2"},
          "46" = {"ansible_vars": "validator_start=575000 validator_end=580000", "region": "ams2"},
          "47" = {"ansible_vars": "validator_start=580000 validator_end=585000", "region": "sgp1"},
          "48" = {"ansible_vars": "validator_start=585000 validator_end=590000", "region": "lon1"},
          "49" = {"ansible_vars": "validator_start=590000 validator_end=595000", "region": "nyc3"},
          "50" = {"ansible_vars": "validator_start=595000 validator_end=600000", "region": "ams3"}
       }
     },
    // Prysm combos
    {
      "id" = "prysm-geth",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=600000 validator_end=605000", "region": "nyc1" },
        "1" = { "ansible_vars": "validator_start=600000 validator_end=605000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=605000 validator_end=610000", "region": "nyc1" },
        "3" = { "ansible_vars": "validator_start=610000 validator_end=615000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=615000 validator_end=620000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=620000 validator_end=625000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=625000 validator_end=630000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=630000 validator_end=635000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=635000 validator_end=640000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=640000 validator_end=645000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=645000 validator_end=650000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=650000 validator_end=655000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=655000 validator_end=660000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=660000 validator_end=665000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=665000 validator_end=670000", "region": "syd1" }
      }
    },
    {
      "id" = "prysm-besu",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=700000 validator_end=705000", "region": "nyc1" },
        "2" = { "ansible_vars": "validator_start=705000 validator_end=710000", "region": "nyc2" },
        "3" = { "ansible_vars": "validator_start=710000 validator_end=715000", "region": "ams2" },
        "4" = { "ansible_vars": "validator_start=715000 validator_end=720000", "region": "sgp1" },
        "5" = { "ansible_vars": "validator_start=720000 validator_end=725000", "region": "lon1" },
        "6" = { "ansible_vars": "validator_start=725000 validator_end=730000", "region": "ams3" },
        "7" = { "ansible_vars": "validator_start=730000 validator_end=735000", "region": "fra1" },
        "8" = { "ansible_vars": "validator_start=735000 validator_end=740000", "region": "tor1" },
        "9" = { "ansible_vars": "validator_start=740000 validator_end=745000", "region": "sfo2" },
        "10" = { "ansible_vars": "validator_start=745000 validator_end=750000", "region": "nyc3" },
        "11" = { "ansible_vars": "validator_start=750000 validator_end=755000", "region": "sfo3" },
        "12" = { "ansible_vars": "validator_start=755000 validator_end=760000", "region": "syd1" },
        "13" = { "ansible_vars": "validator_start=760000 validator_end=765000", "region": "blr1" },
        "14" = { "ansible_vars": "validator_start=765000 validator_end=770000", "region": "nyc1" },
        "15" = { "ansible_vars": "validator_start=770000 validator_end=775000", "region": "nyc2" },
        "16" = { "ansible_vars": "validator_start=775000 validator_end=780000", "region": "ams2" },
        "17" = { "ansible_vars": "validator_start=780000 validator_end=785000", "region": "sgp1" },
        "18" = { "ansible_vars": "validator_start=785000 validator_end=790000", "region": "lon1" },
        "19" = { "ansible_vars": "validator_start=790000 validator_end=795000", "region": "ams3" },
        "20" = { "ansible_vars": "validator_start=795000 validator_end=800000", "region": "fra1" }
      }
    },
    {
      "id" = "prysm-nethermind",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=800000 validator_end=805000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=805000 validator_end=810000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=810000 validator_end=815000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=815000 validator_end=820000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=820000 validator_end=825000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=825000 validator_end=830000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=830000 validator_end=835000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=835000 validator_end=840000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=840000 validator_end=845000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=845000 validator_end=850000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=850000 validator_end=855000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=855000 validator_end=860000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=860000 validator_end=865000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=865000 validator_end=870000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=870000 validator_end=875000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=875000 validator_end=880000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=880000 validator_end=885000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=885000 validator_end=890000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=890000 validator_end=895000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=895000 validator_end=900000", "region": "sfo2" }
      }
    },

    // Lodestar combos
    {
      "id" = "lodestar-geth",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=900000 validator_end=905000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=905000 validator_end=910000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=910000 validator_end=915000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=915000 validator_end=920000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=920000 validator_end=925000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=925000 validator_end=930000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=930000 validator_end=935000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=935000 validator_end=940000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=940000 validator_end=945000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=945000 validator_end=950000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=950000 validator_end=955000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=955000 validator_end=960000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=960000 validator_end=965000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=965000 validator_end=970000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=970000 validator_end=975000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=975000 validator_end=980000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=980000 validator_end=985000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=985000 validator_end=990000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=990000 validator_end=995000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=995000 validator_end=1000000", "region": "sfo2" }
      }
    },
    {
      "id" = "lodestar-nethermind",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1000000 validator_end=1005000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1005000 validator_end=1010000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1010000 validator_end=1015000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1015000 validator_end=1020000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1020000 validator_end=1025000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1025000 validator_end=1030000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1030000 validator_end=1035000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1035000 validator_end=1040000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1040000 validator_end=1045000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1045000 validator_end=1050000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1050000 validator_end=1055000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1055000 validator_end=1060000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1060000 validator_end=1065000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1065000 validator_end=1070000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1070000 validator_end=1075000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1075000 validator_end=1080000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1080000 validator_end=1085000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1085000 validator_end=1090000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1090000 validator_end=1095000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1095000 validator_end=1100000", "region": "sfo2" }
      }
    },
    {
      "id" = "lodestar-besu",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1100000 validator_end=1105000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1105000 validator_end=1110000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1110000 validator_end=1115000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1115000 validator_end=1120000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1120000 validator_end=1125000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1125000 validator_end=1130000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1130000 validator_end=1135000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1135000 validator_end=1140000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1140000 validator_end=1145000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1145000 validator_end=1150000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1150000 validator_end=1155000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1155000 validator_end=1160000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1160000 validator_end=1165000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1165000 validator_end=1170000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1170000 validator_end=1175000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1175000 validator_end=1180000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1180000 validator_end=1185000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1185000 validator_end=1190000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1190000 validator_end=1195000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1195000 validator_end=1200000", "region": "sfo2" }
      }
    },
    // Nimbus combos
    {
      "id" = "nimbus-geth",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1200000 validator_end=1205000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1205000 validator_end=1210000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1210000 validator_end=1215000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1215000 validator_end=1220000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1220000 validator_end=1225000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1225000 validator_end=1230000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1230000 validator_end=1235000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1235000 validator_end=1240000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1240000 validator_end=1245000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1245000 validator_end=1250000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1250000 validator_end=1255000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1255000 validator_end=1260000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1260000 validator_end=1265000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1265000 validator_end=1270000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1270000 validator_end=1275000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1275000 validator_end=1280000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1280000 validator_end=1285000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1285000 validator_end=1290000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1290000 validator_end=1295000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1295000 validator_end=1300000", "region": "sfo2" }
      }
    },
    {
      "id" = "nimbus-besu",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1300000 validator_end=1305000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1305000 validator_end=1310000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1310000 validator_end=1315000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1315000 validator_end=1320000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1320000 validator_end=1325000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1325000 validator_end=1330000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1330000 validator_end=1335000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1335000 validator_end=1340000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1340000 validator_end=1345000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1345000 validator_end=1350000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1350000 validator_end=1355000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1355000 validator_end=1360000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1360000 validator_end=1365000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1365000 validator_end=1370000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1370000 validator_end=1375000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1375000 validator_end=1380000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1380000 validator_end=1385000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1385000 validator_end=1390000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1390000 validator_end=1395000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1395000 validator_end=1400000", "region": "sfo2" }
      }
    },
    {
      "id" = "nimbus-nethermind",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1400000 validator_end=1405000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1405000 validator_end=1410000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1410000 validator_end=1415000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1415000 validator_end=1420000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1420000 validator_end=1425000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1425000 validator_end=1430000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1430000 validator_end=1435000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1435000 validator_end=1440000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1440000 validator_end=1445000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1445000 validator_end=1450000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1450000 validator_end=1455000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1455000 validator_end=1460000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1460000 validator_end=1465000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1465000 validator_end=1470000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1470000 validator_end=1475000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1475000 validator_end=1480000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1480000 validator_end=1485000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1485000 validator_end=1490000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1490000 validator_end=1495000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1495000 validator_end=1500000", "region": "sfo2" }
      }
    },

    // Teku combos
    {
      "id" = "teku-geth",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1500000 validator_end=1505000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1505000 validator_end=1510000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1510000 validator_end=1515000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1515000 validator_end=1520000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1520000 validator_end=1525000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1525000 validator_end=1530000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1530000 validator_end=1535000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1535000 validator_end=1540000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1540000 validator_end=1545000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1545000 validator_end=1550000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1550000 validator_end=1555000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1555000 validator_end=1560000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1560000 validator_end=1565000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1565000 validator_end=1570000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1570000 validator_end=1575000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1575000 validator_end=1580000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1580000 validator_end=1585000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1585000 validator_end=1590000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1590000 validator_end=1595000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1595000 validator_end=1600000", "region": "sfo2" },
        "21" = { "ansible_vars": "validator_start=1600000 validator_end=1605000", "region": "nyc3" },
        "22" = { "ansible_vars": "validator_start=1605000 validator_end=1610000", "region": "ams3" },
        "23" = { "ansible_vars": "validator_start=1610000 validator_end=1615000", "region": "fra1" },
        "24" = { "ansible_vars": "validator_start=1615000 validator_end=1620000", "region": "tor1" },
        "25" = { "ansible_vars": "validator_start=1620000 validator_end=1625000", "region": "sfo2" },
        "26" = { "ansible_vars": "validator_start=1625000 validator_end=1630000", "region": "nyc3" },
        "27" = { "ansible_vars": "validator_start=1630000 validator_end=1635000", "region": "ams3" },
        "28" = { "ansible_vars": "validator_start=1635000 validator_end=1640000", "region": "fra1" },
        "29" = { "ansible_vars": "validator_start=1640000 validator_end=1645000", "region": "tor1" },
        "30" = { "ansible_vars": "validator_start=1645000 validator_end=1650000", "region": "sfo2" },
        "31" = { "ansible_vars": "validator_start=1650000 validator_end=1655000", "region": "nyc3" },
        "32" = { "ansible_vars": "validator_start=1655000 validator_end=1660000", "region": "ams3" },
        "33" = { "ansible_vars": "validator_start=1660000 validator_end=1665000", "region": "fra1" },
        "34" = { "ansible_vars": "validator_start=1665000 validator_end=1670000", "region": "tor1" },
        "35" = { "ansible_vars": "validator_start=1670000 validator_end=1675000", "region": "sfo2" },
        "36" = { "ansible_vars": "validator_start=1675000 validator_end=1680000", "region": "nyc3" },
        "37" = { "ansible_vars": "validator_start=1680000 validator_end=1685000", "region": "ams3" },
        "38" = { "ansible_vars": "validator_start=1685000 validator_end=1690000", "region": "fra1" },
        "39" = { "ansible_vars": "validator_start=1690000 validator_end=1695000", "region": "tor1" },
        "40" = { "ansible_vars": "validator_start=1695000 validator_end=1700000", "region": "sfo2" },
        "41" = { "ansible_vars": "validator_start=1700000 validator_end=1705000", "region": "nyc3" },
        "42" = { "ansible_vars": "validator_start=1705000 validator_end=1710000", "region": "ams3" },
        "43" = { "ansible_vars": "validator_start=1710000 validator_end=1715000", "region": "fra1" },
        "44" = { "ansible_vars": "validator_start=1715000 validator_end=1720000", "region": "tor1" },
        "45" = { "ansible_vars": "validator_start=1720000 validator_end=1725000", "region": "sfo2" },
        "46" = { "ansible_vars": "validator_start=1725000 validator_end=1730000", "region": "nyc3" },
        "47" = { "ansible_vars": "validator_start=1730000 validator_end=1735000", "region": "ams3" },
        "48" = { "ansible_vars": "validator_start=1735000 validator_end=1740000", "region": "fra1" },
        "49" = { "ansible_vars": "validator_start=1740000 validator_end=1745000", "region": "tor1" },
        "50" = { "ansible_vars": "validator_start=1745000 validator_end=1750000", "region": "sfo2" }
      }
    },
    {
      "id" = "teku-besu",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1750000 validator_end=1755000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1755000 validator_end=1760000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1760000 validator_end=1765000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1765000 validator_end=1770000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1770000 validator_end=1775000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1775000 validator_end=1780000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1780000 validator_end=1785000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1785000 validator_end=1790000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1790000 validator_end=1795000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1795000 validator_end=1800000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1800000 validator_end=1805000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1805000 validator_end=1810000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1810000 validator_end=1815000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1815000 validator_end=1820000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1820000 validator_end=1825000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1825000 validator_end=1830000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1830000 validator_end=1835000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1835000 validator_end=1840000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1840000 validator_end=1845000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1845000 validator_end=1850000", "region": "sfo2" }
      }
    },
    {
      "id" = "teku-nethermind",
      "vms" = {
        "1" = { "ansible_vars": "validator_start=1850000 validator_end=1855000", "region": "blr1" },
        "2" = { "ansible_vars": "validator_start=1855000 validator_end=1860000", "region": "sfo1" },
        "3" = { "ansible_vars": "validator_start=1860000 validator_end=1865000", "region": "nyc2" },
        "4" = { "ansible_vars": "validator_start=1865000 validator_end=1870000", "region": "ams2" },
        "5" = { "ansible_vars": "validator_start=1870000 validator_end=1875000", "region": "sgp1" },
        "6" = { "ansible_vars": "validator_start=1875000 validator_end=1880000", "region": "lon1" },
        "7" = { "ansible_vars": "validator_start=1880000 validator_end=1885000", "region": "nyc3" },
        "8" = { "ansible_vars": "validator_start=1885000 validator_end=1890000", "region": "ams3" },
        "9" = { "ansible_vars": "validator_start=1890000 validator_end=1895000", "region": "fra1" },
        "10" = { "ansible_vars": "validator_start=1895000 validator_end=1900000", "region": "tor1" },
        "11" = { "ansible_vars": "validator_start=1900000 validator_end=1905000", "region": "sfo2" },
        "12" = { "ansible_vars": "validator_start=1905000 validator_end=1910000", "region": "blr1" },
        "13" = { "ansible_vars": "validator_start=1910000 validator_end=1915000", "region": "sfo3" },
        "14" = { "ansible_vars": "validator_start=1915000 validator_end=1920000", "region": "syd1" },
        "15" = { "ansible_vars": "validator_start=1920000 validator_end=1925000", "region": "blr1" },
        "16" = { "ansible_vars": "validator_start=1925000 validator_end=1930000", "region": "nyc3" },
        "17" = { "ansible_vars": "validator_start=1930000 validator_end=1935000", "region": "ams3" },
        "18" = { "ansible_vars": "validator_start=1935000 validator_end=1940000", "region": "fra1" },
        "19" = { "ansible_vars": "validator_start=1940000 validator_end=1945000", "region": "tor1" },
        "20" = { "ansible_vars": "validator_start=1945000 validator_end=1950000", "region": "sfo2" },
        "21" = { "ansible_vars": "validator_start=1950000 validator_end=1955000", "region": "nyc3" },
        "22" = { "ansible_vars": "validator_start=1955000 validator_end=1960000", "region": "ams3" },
        "23" = { "ansible_vars": "validator_start=1960000 validator_end=1965000", "region": "fra1" },
        "24" = { "ansible_vars": "validator_start=1965000 validator_end=1970000", "region": "tor1" },
        "25" = { "ansible_vars": "validator_start=1970000 validator_end=1975000", "region": "sfo2" },
        "26" = { "ansible_vars": "validator_start=1975000 validator_end=1980000", "region": "nyc3" },
        "27" = { "ansible_vars": "validator_start=1980000 validator_end=1985000", "region": "ams3" },
        "28" = { "ansible_vars": "validator_start=1985000 validator_end=1990000", "region": "fra1" },
        "29" = { "ansible_vars": "validator_start=1990000 validator_end=1995000", "region": "tor1" },
        "30" = { "ansible_vars": "validator_start=1995000 validator_end=2000000", "region": "sfo2" },
        "31" = { "ansible_vars": "validator_start=2000000 validator_end=2005000", "region": "nyc3" },
        "32" = { "ansible_vars": "validator_start=2005000 validator_end=2010000", "region": "ams3" },
        "33" = { "ansible_vars": "validator_start=2010000 validator_end=2015000", "region": "fra1" },
        "34" = { "ansible_vars": "validator_start=2015000 validator_end=2020000", "region": "tor1" },
        "35" = { "ansible_vars": "validator_start=2020000 validator_end=2025000", "region": "sfo2" },
        "36" = { "ansible_vars": "validator_start=2025000 validator_end=2030000", "region": "nyc3" },
        "37" = { "ansible_vars": "validator_start=2030000 validator_end=2035000", "region": "ams3" },
        "38" = { "ansible_vars": "validator_start=2035000 validator_end=2040000", "region": "fra1" },
        "39" = { "ansible_vars": "validator_start=2040000 validator_end=2045000", "region": "tor1" },
        "40" = { "ansible_vars": "validator_start=2045000 validator_end=2050000", "region": "sfo2" },
        "41" = { "ansible_vars": "validator_start=2050000 validator_end=2055000", "region": "nyc3" },
        "42" = { "ansible_vars": "validator_start=2055000 validator_end=2060000", "region": "ams3" },
        "43" = { "ansible_vars": "validator_start=2060000 validator_end=2065000", "region": "fra1" },
        "44" = { "ansible_vars": "validator_start=2065000 validator_end=2070000", "region": "tor1" },
        "45" = { "ansible_vars": "validator_start=2070000 validator_end=2075000", "region": "sfo2" },
        "46" = { "ansible_vars": "validator_start=2075000 validator_end=2080000", "region": "nyc3" },
        "47" = { "ansible_vars": "validator_start=2080000 validator_end=2085000", "region": "ams3" },
        "48" = { "ansible_vars": "validator_start=2085000 validator_end=2090000", "region": "fra1" },
        "49" = { "ansible_vars": "validator_start=2090000 validator_end=2095000", "region": "tor1" },
        "50"= { "ansible_vars": "validator_start=2095000 validator_end=2100000", "region": "sfo2" }
      }
    },
  ]
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////


locals {
  digitalocean_default_region = "ams3"
  digitalocean_default_size   = "c-16"
  digitalocean_default_image  = "debian-11-x64"
  digitalocean_global_tags = [
    "Owner:Devops",
    "EthNetwork:${var.ethereum_network}"
  ]

  # flatten vm_groups so that we can use it with for_each()
  digitalocean_vms = flatten([
    for group in var.digitalocean_vm_groups : [
      for vm_key, vm in group.vms : {
        id        = "${group.id}.${vm_key}"
        group_key = group.id
        vm_key    = vm_key

        name        = try(vm.name, "${group.id}-${vm_key}")
        ssh_keys    = try(vm.ssh_keys, [data.digitalocean_ssh_key.main.fingerprint])
        region      = try(vm.region, try(group.region, local.digitalocean_default_region))
        image       = try(vm.image, local.digitalocean_default_image)
        size        = try(vm.size, local.digitalocean_default_size)
        resize_disk = try(vm.resize_disk, true)
        monitoring  = try(vm.monitoring, true)
        backups     = try(vm.backups, false)
        ipv6        = try(vm.ipv6, false)
        vpc_uuid = try(vm.vpc_uuid, try(
          digitalocean_vpc.main[vm.region].id,
          digitalocean_vpc.main[try(group.region, local.digitalocean_default_region)].id
        ))

        tags = concat(local.digitalocean_global_tags, try(split(",", group.tags), []), try(split(",", vm.tags), []))
      }
    ]
  ])

}

////////////////////////////////////////////////////////////////////////////////////////
//                                  DIGITALOCEAN RESOURCES
////////////////////////////////////////////////////////////////////////////////////////
data "digitalocean_project" "main" {
  name = var.digitalocean_project_name
}

data "digitalocean_ssh_key" "main" {
  name = var.digitalocean_ssh_key_name
}

resource "digitalocean_vpc" "main" {
  for_each = var.digitalocean_vpcs
  name     = try(each.value.name, "${var.ethereum_network}-${each.key}")
  region   = each.key
  ip_range = each.value.ip_range
}

resource "digitalocean_droplet" "main" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  name        = each.value.name
  region      = each.value.region
  ssh_keys    = each.value.ssh_keys
  image       = each.value.image
  size        = each.value.size
  resize_disk = each.value.resize_disk
  monitoring  = each.value.monitoring
  backups     = each.value.backups
  ipv6        = each.value.ipv6
  vpc_uuid    = each.value.vpc_uuid
  tags        = each.value.tags
}

resource "digitalocean_project_resources" "droplets" {
  for_each  = digitalocean_droplet.main
  project   = data.digitalocean_project.main.id
  resources = [each.value.urn]
}

resource "digitalocean_firewall" "main" {
  name = "${var.ethereum_network}-nodes"
  // Tags are used to select which droplets should
  // be assigned to this firewall.
  tags = [
    "EthNetwork:${var.ethereum_network}"
  ]

  // SSH
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Nginx / Web
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Consensus layer p2p port
  inbound_rule {
    protocol         = "tcp"
    port_range       = "9000-9001"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "udp"
    port_range       = "9000-9001"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Execution layer p2p Port
  inbound_rule {
    protocol         = "tcp"
    port_range       = "30303"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "udp"
    port_range       = "30303"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Allow all outbound traffic
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

////////////////////////////////////////////////////////////////////////////////////////
//                                   DNS NAMES
////////////////////////////////////////////////////////////////////////////////////////

data "cloudflare_zone" "default" {
  name = "ethpandaops.io"
}

resource "cloudflare_record" "server_record" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.cloudflare_zone.default.id
  name    = "${each.value.name}.srv.${var.ethereum_network}"
  type    = "A"
  value   = digitalocean_droplet.main[each.value.id].ipv4_address
  proxied = false
  ttl     = 120
}

resource "cloudflare_record" "server_record_rpc" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.cloudflare_zone.default.id
  name    = "rpc.${each.value.name}.srv.${var.ethereum_network}"
  type    = "A"
  value   = digitalocean_droplet.main[each.value.id].ipv4_address
  proxied = false
  ttl     = 120
}

resource "cloudflare_record" "server_record_beacon" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.cloudflare_zone.default.id
  name    = "bn.${each.value.name}.srv.${var.ethereum_network}"
  type    = "A"
  value   = digitalocean_droplet.main[each.value.id].ipv4_address
  proxied = false
  ttl     = 120
}

////////////////////////////////////////////////////////////////////////////////////////
//                          GENERATED FILES AND OUTPUTS
////////////////////////////////////////////////////////////////////////////////////////

resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tmpl",
    {
      ethereum_network_name              = "${var.ethereum_network}"
      groups = merge(
        { for group in var.digitalocean_vm_groups : "${group.id}" => true },
      )
      hosts = merge(
        {
          for key, server in digitalocean_droplet.main : "do.${key}" => {
            ip       = "${server.ipv4_address}"
            group    = split(".", key)[0]
            tags     = "${server.tags}"
            hostname = "${split(".", key)[0]}-${split(".", key)[1]}"
            cloud    = "digitalocean"
            region   = "${server.region}"
            ansible_vars = try(
              var.digitalocean_vm_groups[
                index([for v in var.digitalocean_vm_groups : v.id], split(".", key)[0])
              ].vms[split(".", key)[1]].ansible_vars
            , null)
          }
        }
      )
    }
  )
  filename = "../../ansible/inventories/devnet-2m-test/inventory.ini"
}