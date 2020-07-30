resource "aci_application_profile" "APP_NUMERO_UNO" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "APP_NUMERO_UNO"
}

resource "aci_application_epg" "EPG_FE_UNO" {
  application_profile_dn = aci_application_profile.APP_NUMERO_UNO.id
  name                   = "EPG_FE"
  relation_fv_rs_bd      = aci_bridge_domain.INT_JAB_BD.id
  relation_fv_rs_cons    = [aci_contract.baseline.id]
}

resource "aci_application_epg" "EPG_BE_UNO" {
  application_profile_dn = aci_application_profile.APP_NUMERO_UNO.id
  name                   = "EPG_BE"
  relation_fv_rs_bd      = aci_bridge_domain.INT_JAB_BD.id
  relation_fv_rs_prov    = [aci_contract.baseline.id]
}
