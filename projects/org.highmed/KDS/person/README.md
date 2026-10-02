# KDS/person

openEHR template **KDS_Person** ↔ FHIR profile **Patient** (Patient), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient>

Both directions unless a row says otherwise. Starts at `ADMIN_ENTRY.person_data.v0`; context file `person.context.yaml`.

## Resources

- Template: [`KDS_Person.opt`](../resources/openehr/templates/KDS_Person.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.person#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.person#2025.0.0)
- Examples: [`../resources/examples/person`](../resources/examples/person): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-EVALUATION.gender.v1` | Geschlecht | [`EVALUATION.gender.v1`](../../../../model/evaluation/org.openehr/gender.v1.yml) | [`KDS_gender.v1`](KDS_gender.yml) |
| `openEHR-EHR-ADMIN_ENTRY.person_data.v0` | Personendaten | [`ADMIN_ENTRY.person_data.v0`](../../../../model/admin_entry/org.highmed/person_data.v0.yml) | [`KDS_admin_entry_person.v0`](KDS_admin_entry_person.yml) |
| `openEHR-EHR-CLUSTER.person.v1` | Person | [`CLUSTER.person.v1`](../../../../model/cluster/org.openehr/person.v1.yml) | [`KDS_cluster_person.v1`](KDS_cluster_person.yml) |
| `openEHR-EHR-CLUSTER.structured_name.v1` | Geburtsname | [`CLUSTER.structured_name.v1`](../../../../model/cluster/org.openehr/structured_name.v1.yml) | [`KDS_structured_name.v1.person_name-structured_name`](KDS_structured_name.v1.person_name-structured_name.yml) |
| `openEHR-EHR-CLUSTER.address.v1` | Postfach | [`CLUSTER.address.v1`](../../../../model/cluster/org.openehr/address.v1.yml) | [`KDS_address`](KDS_address.yml) |
| `openEHR-EHR-CLUSTER.organisation.v1` | *not in template* | [`CLUSTER.organisation.v1`](../../../../model/cluster/org.openehr/organisation.v1.yml) | – |
| `openEHR-EHR-CLUSTER.person_birth_data_iso.v0` | Daten zur Geburt | [`CLUSTER.person_birth_data_iso.v0`](../../../../model/cluster/org.openehr/person_birth_data_iso.v0.yml) | – |
| `openEHR-EHR-CLUSTER.death_details.v1` | Angaben zum Tod | [`CLUSTER.death_details.v1`](../../../../model/cluster/org.openehr/death_details.v1.yml) | – |
| `openEHR-EHR-COMPOSITION.person.v0` | Person | [`COMPOSITION.person.v0`](../../../../model/composition/org.highmed/person.v1.Patient.yml) | [`KDS_composition_person.v0`](KDS_Composition.yml) |
| `openEHR-EHR-ADMIN_ENTRY.versicherungsinformationen.v0` | Versicherungsinformationen | [`ADMIN_ENTRY.versicherungsinformationen.v0`](../../../../model/admin_entry/org.highmed/versicherungsinformationen.v0.yml) | – |

Listed in the context but no such file: `KDS_person_data.v0`

## Personendaten — ADMIN_ENTRY.person_data.v0

Resources with `active` = `false` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Patient` | CLUSTER.person.v1 | → table **CLUSTER.person.v1** |  |
| `Patient` | **Angaben zum Tod** `at0024` | direct |  |
| `Patient.deceased (Boolean)` | **Verstorben?** `at0025` | direct | only if openEHR `items[openEHR-EHR-CLUSTER.death_details.v1]/items[at0001]` is empty |
| `Patient.deceased (DateTime)` | CLUSTER.death_details.v1 | → table **CLUSTER.death_details.v1** |  |
| `Patient.birthDate` | CLUSTER.person_birth_data_iso.v0 | → table **CLUSTER.person_birth_data_iso.v0** |  |
| `Patient.link` | *(the referenced resource)* | direct |  |
| `Patient.link.other` | `links` *(RM attribute)* | LINK to the partOf composition |  |
| `Patient.link.other.link.type.value` | `links/type` *(RM attribute)* | direct |  |
| `Patient` | composition | → table **COMPOSITION.person.v0** | *KDS_admin_entry_person.v0* |
| `Patient.identifier` | *(the referenced resource)* | engine code `ehrStatusAddExternalREF` | *KDS_admin_entry_person.v0* |

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
| `….name` | CLUSTER.structured_name.v1 · `]` *(RM attribute)* | → table **CLUSTER.structured_name.v1** | only if FHIR `use` one of `official`; *KDS_cluster_person.v1* |
| `….address` | CLUSTER.address.v1 · `]` *(RM attribute)* | → table **CLUSTER.address.v1** | only if FHIR `type` one of `both`; *KDS_cluster_person.v1* |
| `managingOrganization` | *(the referenced resource)* | reference → Organization |  |
| `managingOrganization` | CLUSTER.organisation.v1 | → table **CLUSTER.organisation.v1** |  |
| `….name` | CLUSTER.structured_name.v1 · `]` *(RM attribute)* | → table **CLUSTER.structured_name.v1** | only if FHIR `use` one of `maiden`; *KDS_cluster_person.v1* |
| `…` | CLUSTER.address.v1 · `]` *(RM attribute)* | → table **CLUSTER.address.v1** | only if FHIR `type` one of `postal`; *KDS_cluster_person.v1* |

## Geburtsname — CLUSTER.structured_name.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….use` | **Prefix-qualifier** `at0001` | direct |  |
| `….given` | **Vorname** `at0002` | direct |  |
| `….prefix.extension.value` | `items[at0006]` *(not in this template)* | direct | extension `iso21090-EN-qualifier`; *KDS_structured_name.v1.person_name-structured_name* |
| `….prefix.extension.value` | `items[at0006]` *(not in this template)* | fixed | url = `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier`; *KDS_structured_name.v1.person_name-structured_name* |
| `….family` | **Familienname-Vorsatzwort** `at0005` | direct | *KDS_structured_name.v1.person_name-structured_name* |
| `….family.extension` | **Familienname-Vorsatzwort** `at0005` | direct | extension `humanname-namenszusatz`; *KDS_structured_name.v1.person_name-structured_name* |
| `….family.extension` | **Familienname-Vorsatzwort** `at0005` | fixed | url = `http://fhir.de/StructureDefinition/humanname-namenszusatz`; *KDS_structured_name.v1.person_name-structured_name* |
| `….family.extension` | **Familienname-Vorsatzwort** `at0005` | direct | extension `humanname-own-name`; *KDS_structured_name.v1.person_name-structured_name* |
| `….family.extension` | **Familienname-Vorsatzwort** `at0005` | fixed | url = `http://hl7.org/fhir/StructureDefinition/humanname-own-name`; *KDS_structured_name.v1.person_name-structured_name* |
| `….family.extension` | **Familienname-Vorsatzwort** `at0005` | direct | extension `humanname-own-prefix`; *KDS_structured_name.v1.person_name-structured_name* |
| `….family.extension` | **Familienname-Vorsatzwort** `at0005` | fixed | url = `http://hl7.org/fhir/StructureDefinition/humanname-own-prefix`; *KDS_structured_name.v1.person_name-structured_name* |

## Postfach — CLUSTER.address.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….city` | **Stadtteil / Stadt / Gemeindeschlüssel** `at0002` | direct | *KDS_address* |
| `….postalCode` | **Postleitzahl** `at0005` | direct | *KDS_address* |
| `….line` | **Adresszeile** `at0001` | direct | *KDS_address* |
| `….type` | **Adresstyp** `at0010` | direct | *KDS_address* |
| `….type` |  | value table | `physical` ↔ Physical (at0011)<br>`postal` ↔ Postal (at0012)<br>`both` ↔ Both (at0013); *KDS_address* |

## Daten zur Geburt — CLUSTER.person_birth_data_iso.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Geburtsdatum** `at0001` | direct |  |

## Angaben zum Tod — CLUSTER.death_details.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Sterbedatum** `at0001` | direct |  |

## Person — COMPOSITION.person.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….serviceProvider` | composition · `context/health_care_facility` | direct |  |
| `….period.start` | composition · start time | direct |  |
| `….period.end` | composition · end time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….serviceProvider` | composition · composer | direct |  |
| `….serviceProvider` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `serviceProvider` is empty |
| `….identifier` | composition · `context/other_context[at0003]/items[at0004]` | direct | only if FHIR `system` not of `http://fhir.de/sid/gkv/kvid-10`; *KDS_composition_person.v0* |
| `…` | EVALUATION.gender.v1 | → table **EVALUATION.gender.v1** | *KDS_composition_person.v0* |
| `….identifier` | ADMIN_ENTRY.versicherungsinformationen.v0 | → table **ADMIN_ENTRY.versicherungsinformationen.v0** | only if FHIR `system` one of `http://fhir.de/sid/gkv/kvid-10`; *KDS_composition_person.v0* |

## Versicherungsinformationen — ADMIN_ENTRY.versicherungsinformationen.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Versicherungsnummer** `at0006` | direct | only if FHIR `system` one of `http://fhir.de/sid/gkv/kvid-10` |
| `…` |  | fixed | system = `http://fhir.de/sid/gkv/kvid-10` |
| `….type.coding` |  | fixed | system = `http://fhir.de/CodeSystem/identifier-type-de-basis`, code = `KVZ10` |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
