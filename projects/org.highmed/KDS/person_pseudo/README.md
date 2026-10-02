# KDS/person_pseudo

openEHR template **KDS_Person_Pseudonymisiert** ↔ FHIR profile **PatientPseudonymisiert** (Patient), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/PatientPseudonymisiert>

Both directions unless a row says otherwise. Starts at `ADMIN_ENTRY.person_data.v0`; context file `pseudo_person.context.yaml`.

## Resources

- Template: [`KDS_Person_Pseudonymisiert.opt`](../resources/openehr/templates/KDS_Person_Pseudonymisiert.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.person#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.person#2025.0.0)

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-EVALUATION.gender.v1` | Geschlecht | [`EVALUATION.gender.v1`](../../../../model/evaluation/org.openehr/gender.v1.yml) | [`KDS_gender.v1`](../person/KDS_gender.yml) |
| `openEHR-EHR-ADMIN_ENTRY.person_data.v0` | Personendaten | [`ADMIN_ENTRY.person_data.v0`](../../../../model/admin_entry/org.highmed/person_data.v0.yml) | [`KDS_admin_entry_perso_pseudo`](KDS_pseudo_admin_person.yml) |
| `openEHR-EHR-CLUSTER.person.v1` | Person | [`CLUSTER.person.v1`](../../../../model/cluster/org.openehr/person.v1.yml) | – |
| `openEHR-EHR-CLUSTER.address.v1` | Postfach | [`CLUSTER.address.v1`](../../../../model/cluster/org.openehr/address.v1.yml) | [`KDS_address_pseudo`](KDS_address.yml) |
| `openEHR-EHR-CLUSTER.person_birth_data_iso.v0` | Daten zur Geburt | [`CLUSTER.person_birth_data_iso.v0`](../../../../model/cluster/org.openehr/person_birth_data_iso.v0.yml) | – |
| `openEHR-EHR-COMPOSITION.person.v0` | KDS_Person_Pseudonymisiert | [`COMPOSITION.person.v0`](../../../../model/composition/org.highmed/person.v1.Patient.yml) | – |

Listed in the context but no such file: `KDS_person_pseudo_cluster.v1`

## Personendaten — ADMIN_ENTRY.person_data.v0

Resources with `active` = `false` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`Patient`](KDS_pseudo_admin_person.yml#personData "KDS_admin_entry_perso_pseudo#personData") | [CLUSTER.person.v1](KDS_pseudo_admin_person.yml#personData "KDS_admin_entry_perso_pseudo#personData") | → table **CLUSTER.person.v1** | *KDS_admin_entry_perso_pseudo* |
| [`Patient`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#death "ADMIN_ENTRY.person_data.v0#death") | [**Angaben zum Tod** `at0024`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#death "ADMIN_ENTRY.person_data.v0#death") | direct |  |
| [`Patient.deceased (Boolean)`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathBoolean "ADMIN_ENTRY.person_data.v0#deathBoolean") | [**Verstorben?** `at0025`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathBoolean "ADMIN_ENTRY.person_data.v0#deathBoolean") | direct | only if openEHR `items[openEHR-EHR-CLUSTER.death_details.v1]/items[at0001]` is empty |
| [`Patient.deceased (DateTime)`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathTime "ADMIN_ENTRY.person_data.v0#deathTime") | [CLUSTER.death_details.v1](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathTime "ADMIN_ENTRY.person_data.v0#deathTime") | → table **CLUSTER.death_details.v1** |  |
| [`Patient.birthDate`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#personBirthDate "ADMIN_ENTRY.person_data.v0#personBirthDate") | [CLUSTER.person_birth_data_iso.v0](../../../../model/admin_entry/org.highmed/person_data.v0.yml#personBirthDate "ADMIN_ENTRY.person_data.v0#personBirthDate") | → table **CLUSTER.person_birth_data_iso.v0** |  |
| [`Patient.link`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#link "ADMIN_ENTRY.person_data.v0#link") | [*(the referenced resource)*](../../../../model/admin_entry/org.highmed/person_data.v0.yml#link "ADMIN_ENTRY.person_data.v0#link") | direct |  |
| [`Patient.link.other`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#links "ADMIN_ENTRY.person_data.v0#links") | [`links` *(RM attribute)*](../../../../model/admin_entry/org.highmed/person_data.v0.yml#links "ADMIN_ENTRY.person_data.v0#links") | LINK to the partOf composition |  |
| [`Patient.link.other.link.type.value`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#type "ADMIN_ENTRY.person_data.v0#type") | [`links/type` *(RM attribute)*](../../../../model/admin_entry/org.highmed/person_data.v0.yml#type "ADMIN_ENTRY.person_data.v0#type") | direct |  |
| [`Patient`](KDS_pseudo_admin_person.yml#compositionMapping "KDS_admin_entry_perso_pseudo#compositionMapping") | [composition](KDS_pseudo_admin_person.yml#compositionMapping "KDS_admin_entry_perso_pseudo#compositionMapping") | → table **COMPOSITION.person.v1** | *KDS_admin_entry_perso_pseudo* |
| [`Patient.identifier`](KDS_pseudo_admin_person.yml#identifier "KDS_admin_entry_perso_pseudo#identifier") | [*(the referenced resource)*](KDS_pseudo_admin_person.yml#identifier "KDS_admin_entry_perso_pseudo#identifier") | engine code `ehrStatusAddExternalREF` | only if FHIR `type.coding.code` one of `PSEUDED, ANONYED`; *KDS_admin_entry_perso_pseudo* |

## Geschlecht — EVALUATION.gender.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….gender`](../../../../model/evaluation/org.openehr/gender.v1.yml#gender "EVALUATION.gender.v1#gender") | [**Administratives Geschlecht** `at0022`](../../../../model/evaluation/org.openehr/gender.v1.yml#gender "EVALUATION.gender.v1#gender") | direct |  |
| [`….gender.extension`](../person/KDS_gender.yml#staticExtensionUrl "KDS_gender.v1#staticExtensionUrl") |  | fixed | url = `http://fhir.de/StructureDefinition/gender-amtlich-de`; *KDS_gender.v1* |
| [`….gender.extension.value`](../person/KDS_gender.yml#otherAmtlichValueCoding "KDS_gender.v1#otherAmtlichValueCoding") | [**Anderes Geschlecht amtlich** `at0014`](../person/KDS_gender.yml#otherAmtlichValueCoding "KDS_gender.v1#otherAmtlichValueCoding") | direct | *KDS_gender.v1* |
| [`….meta`](../person/KDS_gender.yml#metaURL "KDS_gender.v1#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient`; openEHR → FHIR only; *KDS_gender.v1* |

## Person — CLUSTER.person.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….name`](../../../../model/cluster/org.openehr/person.v1.yml#name "CLUSTER.person.v1#name") | [CLUSTER.structured_name.v1](../../../../model/cluster/org.openehr/person.v1.yml#name "CLUSTER.person.v1#name") | → table **CLUSTER.structured_name.v1** |  |
| [`….address`](../../../../model/cluster/org.openehr/person.v1.yml#address "CLUSTER.person.v1#address") | [CLUSTER.address.v1](../../../../model/cluster/org.openehr/person.v1.yml#address "CLUSTER.person.v1#address") | → table **CLUSTER.address.v1** |  |
| [`managingOrganization`](../../../../model/cluster/org.openehr/person.v1.yml#organizationReference "CLUSTER.person.v1#organizationReference") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/person.v1.yml#organizationReference "CLUSTER.person.v1#organizationReference") | reference → Organization |  |
| [`managingOrganization`](../../../../model/cluster/org.openehr/person.v1.yml#organization "CLUSTER.person.v1#organization") | [CLUSTER.organisation.v1](../../../../model/cluster/org.openehr/person.v1.yml#organization "CLUSTER.person.v1#organization") | → table **CLUSTER.organisation.v1** |  |

## Postfach — CLUSTER.address.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….city`](KDS_address.yml#city "KDS_address_pseudo#city") | [**Stadtteil / Stadt / Gemeindeschlüssel** `at0002`](KDS_address.yml#city "KDS_address_pseudo#city") | direct | *KDS_address_pseudo* |
| [`….postalCode`](KDS_address.yml#postalCode "KDS_address_pseudo#postalCode") | [**Postleitzahl** `at0005`](KDS_address.yml#postalCode "KDS_address_pseudo#postalCode") | direct | *KDS_address_pseudo* |
| [`….line`](KDS_address.yml#line "KDS_address_pseudo#line") | [**Adresszeile** `at0001`](KDS_address.yml#line "KDS_address_pseudo#line") | direct | *KDS_address_pseudo* |
| [`….type`](KDS_address.yml#type "KDS_address_pseudo#type") | [**Adresstyp** `at0010`](KDS_address.yml#type "KDS_address_pseudo#type") | direct | *KDS_address_pseudo* |
| [`….type`](KDS_address.yml#manual "KDS_address_pseudo#manual") |  | value table | `physical` ↔ Physical (at0011)<br>`postal` ↔ Postal (at0012)<br>`both` ↔ Both (at0013); *KDS_address_pseudo* |

## Daten zur Geburt — CLUSTER.person_birth_data_iso.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/person_birth_data_iso.v0.yml#birthdate "CLUSTER.person_birth_data_iso.v0#birthdate") | [**Geburtsdatum** `at0001`](../../../../model/cluster/org.openehr/person_birth_data_iso.v0.yml#birthdate "CLUSTER.person_birth_data_iso.v0#birthdate") | direct |  |

## KDS_Person_Pseudonymisiert — COMPOSITION.person.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….serviceProvider`](../../../../model/composition/org.highmed/person.v1.Patient.yml#healthcareFacility "COMPOSITION.person.v0#healthcareFacility") | [composition · `context/health_care_facility`](../../../../model/composition/org.highmed/person.v1.Patient.yml#healthcareFacility "COMPOSITION.person.v0#healthcareFacility") | direct |  |
| [`….period.start`](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextStart "COMPOSITION.person.v0#contextStart") | [composition · start time](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextStart "COMPOSITION.person.v0#contextStart") | direct |  |
| [`….period.end`](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextEnd "COMPOSITION.person.v0#contextEnd") | [composition · end time](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextEnd "COMPOSITION.person.v0#contextEnd") | direct |  |
| [`…`](../../../../model/composition/org.highmed/person.v1.Patient.yml#effectiveStart "COMPOSITION.person.v0#effectiveStart") | [composition · start time](../../../../model/composition/org.highmed/person.v1.Patient.yml#effectiveStart "COMPOSITION.person.v0#effectiveStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….serviceProvider`](../../../../model/composition/org.highmed/person.v1.Patient.yml#composer "COMPOSITION.person.v0#composer") | [composition · composer](../../../../model/composition/org.highmed/person.v1.Patient.yml#composer "COMPOSITION.person.v0#composer") | direct |  |
| [`….serviceProvider`](../../../../model/composition/org.highmed/person.v1.Patient.yml#composerEmpty "COMPOSITION.person.v0#composerEmpty") | [composition · composer](../../../../model/composition/org.highmed/person.v1.Patient.yml#composerEmpty "COMPOSITION.person.v0#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `serviceProvider` is empty |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
