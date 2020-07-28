provider "aci" {
  username = var.username
  password = var.password
  insecure = true
  url      = var.url
}

resource "aci_tenant" "INT_JAB" {
  name        = var.tenant
  description = "created by Terraform!"
}

resource "aci_vrf" "INT_JAB_VRF" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "INT_JAB_VRF"
}

resource "aci_bridge_domain" "INT_JAB_BD" {
  tenant_dn          = aci_tenant.INT_JAB.id
  relation_fv_rs_ctx = aci_vrf.INT_JAB_VRF.name
  name               = "INT_JAB_BD"
}

resource "aci_subnet" "INT_JAB_SUBNET_1" {
  bridge_domain_dn = aci_bridge_domain.INT_JAB_BD.id
  ip               = var.bd_subnet
}

resource "aci_filter" "allow_https" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "allow_https"
}
resource "aci_filter" "allow_ssh" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "allow_ssh"
}

resource "aci_filter_entry" "https" {
  name        = "https"
  filter_dn   = aci_filter.allow_https.id
  ether_t     = "ipv4"
  prot        = "tcp"
  d_from_port = "443"
  d_to_port   = "443"
  stateful    = "yes"
}

resource "aci_filter_entry" "ssh" {
  name        = "ssh"
  filter_dn   = aci_filter.allow_ssh.id
  ether_t     = "ipv4"
  prot        = "tcp"
  d_from_port = "22"
  d_to_port   = "22"
  stateful    = "yes"
}

resource "aci_contract" "baseline" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "baseline"
}

resource "aci_contract_subject" "baseline_subj" {
  contract_dn                  = aci_contract.baseline.id
  name                         = "baseline_subj"
  relation_vz_rs_subj_filt_att = [aci_filter.allow_https.id, aci_filter.allow_ssh.id]
}

