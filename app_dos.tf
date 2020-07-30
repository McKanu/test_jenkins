resource "aci_application_profile" "APP_NUMERO_DOS" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "APP_NUMERO_DOS"
}

resource "aci_application_epg" "EPG_FE_DOS" {
  application_profile_dn = aci_application_profile.APP_NUMERO_DOS.id
  name                   = "EPG_FE"
  relation_fv_rs_bd      = aci_bridge_domain.INT_JAB_BD.id
  relation_fv_rs_cons    = [aci_contract.baseline.id]
}

resource "aci_application_epg" "EPG_BE_DOS" {
  application_profile_dn = aci_application_profile.APP_NUMERO_DOS.id
  name                   = "EPG_BE"
  relation_fv_rs_bd      = aci_bridge_domain.INT_JAB_BD.id
  relation_fv_rs_prov    = [aci_contract.baseline.id]
}
