resource "aci_application_profile" "AP_HID100004123" {
  tenant_dn = aci_tenant.INT_JAB.id
  name      = "AP_HID100004123"
}

resource "aci_application_epg" "EPG_FE_DOS" {
  application_profile_dn = aci_application_profile.AP_HID100004123.id
  name                   = "EPG_HID100004123_FE"
  relation_fv_rs_bd      = aci_bridge_domain.INT_JAB_BD.id
  relation_fv_rs_cons    = [aci_contract.baseline.id]
}

resource "aci_application_epg" "EPG_BE_DOS" {
  application_profile_dn = aci_application_profile.AP_HID100004123.id
  name                   = "EPG_HID100004123_BE"
  relation_fv_rs_bd      = aci_bridge_domain.INT_JAB_BD.id
  relation_fv_rs_prov    = [aci_contract.baseline.id]
}
