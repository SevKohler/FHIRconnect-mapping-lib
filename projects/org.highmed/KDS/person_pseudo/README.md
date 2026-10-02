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
| `Patient` | CLUSTER.person.v1 | → table **CLUSTER.person.v1** | *KDS_admin_entry_perso_pseudo* |
| `Patient` | **Angaben zum Tod** `at0024` | direct |  |
| `Patient.deceased (Boolean)` | **Verstorben?** `at0025` | direct | only if openEHR `items[openEHR-EHR-CLUSTER.death_details.v1]/items[at0001]` is empty |
| `Patient.deceased (DateTime)` | CLUSTER.death_details.v1 | → table **CLUSTER.death_details.v1** |  |
| `Patient.birthDate` | CLUSTER.person_birth_data_iso.v0 | → table **CLUSTER.person_birth_data_iso.v0** |  |
| `Patient.link` | *(the referenced resource)* | direct |  |
| `Patient.link.other` | `links` *(RM attribute)* | LINK to the partOf composition |  |
| `Patient.link.other.link.type.value` | `links/type` *(RM attribute)* | direct |  |
| `Patient` | composition | → table **COMPOSITION.person.v1** | *KDS_admin_entry_perso_pseudo* |
| `Patient.identifier` | *(the referenced resource)* | engine code `ehrStatusAddExternalREF` | only if FHIR `type.coding.code` one of `PSEUDED, ANONYED`; *KDS_admin_entry_perso_pseudo* |

## Geschlecht — EVALUATION.gender.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….gender` | **Administratives Geschlecht** `at0022` | direct |  |
| `….gender.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/gender-amtlich-de`; *KDS_gender.v1* |
| `….gender.extension.value` | **Anderes Geschlecht amtlich** `at0014` | direct | *KDS_gender.v1* |
| `….meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient`; openEHR → FHIR only; *KDS_gender.v1* |

## Person — CLUSTER.person.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….name` | CLUSTER.structured_name.v1 | → table **CLUSTER.structured_name.v1** |  |
| `….address` | CLUSTER.address.v1 | → table **CLUSTER.address.v1** |  |
| `managingOrganization` | *(the referenced resource)* | reference → Organization |  |
| `managingOrganization` | CLUSTER.organisation.v1 | → table **CLUSTER.organisation.v1** |  |

## Postfach — CLUSTER.address.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….city` | **Stadtteil / Stadt / Gemeindeschlüssel** `at0002` | direct | *KDS_address_pseudo* |
| `….postalCode` | **Postleitzahl** `at0005` | direct | *KDS_address_pseudo* |
| `….line` | **Adresszeile** `at0001` | direct | *KDS_address_pseudo* |
| `….type` | **Adresstyp** `at0010` | direct | *KDS_address_pseudo* |
| `….type` |  | value table | `physical` ↔ Physical (at0011)<br>`postal` ↔ Postal (at0012)<br>`both` ↔ Both (at0013); *KDS_address_pseudo* |

## Daten zur Geburt — CLUSTER.person_birth_data_iso.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Geburtsdatum** `at0001` | direct |  |

## KDS_Person_Pseudonymisiert — COMPOSITION.person.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….serviceProvider` | composition · `context/health_care_facility` | direct |  |
| `….period.start` | composition · start time | direct |  |
| `….period.end` | composition · end time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….serviceProvider` | composition · composer | direct |  |
| `….serviceProvider` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `serviceProvider` is empty |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
