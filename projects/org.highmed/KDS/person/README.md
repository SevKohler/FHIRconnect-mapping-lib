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
| [`Patient`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#personData "ADMIN_ENTRY.person_data.v0#personData") | [CLUSTER.person.v1](../../../../model/admin_entry/org.highmed/person_data.v0.yml#personData "ADMIN_ENTRY.person_data.v0#personData") | → table **CLUSTER.person.v1** |  |
| [`Patient`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#death "ADMIN_ENTRY.person_data.v0#death") | [**Angaben zum Tod** `at0024`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#death "ADMIN_ENTRY.person_data.v0#death") | direct |  |
| [`Patient.deceased (Boolean)`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathBoolean "ADMIN_ENTRY.person_data.v0#deathBoolean") | [**Verstorben?** `at0025`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathBoolean "ADMIN_ENTRY.person_data.v0#deathBoolean") | direct | only if openEHR `items[openEHR-EHR-CLUSTER.death_details.v1]/items[at0001]` is empty |
| [`Patient.deceased (DateTime)`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathTime "ADMIN_ENTRY.person_data.v0#deathTime") | [CLUSTER.death_details.v1](../../../../model/admin_entry/org.highmed/person_data.v0.yml#deathTime "ADMIN_ENTRY.person_data.v0#deathTime") | → table **CLUSTER.death_details.v1** |  |
| [`Patient.birthDate`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#personBirthDate "ADMIN_ENTRY.person_data.v0#personBirthDate") | [CLUSTER.person_birth_data_iso.v0](../../../../model/admin_entry/org.highmed/person_data.v0.yml#personBirthDate "ADMIN_ENTRY.person_data.v0#personBirthDate") | → table **CLUSTER.person_birth_data_iso.v0** |  |
| [`Patient.link`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#link "ADMIN_ENTRY.person_data.v0#link") | [*(the referenced resource)*](../../../../model/admin_entry/org.highmed/person_data.v0.yml#link "ADMIN_ENTRY.person_data.v0#link") | direct |  |
| [`Patient.link.other`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#links "ADMIN_ENTRY.person_data.v0#links") | [`links` *(RM attribute)*](../../../../model/admin_entry/org.highmed/person_data.v0.yml#links "ADMIN_ENTRY.person_data.v0#links") | LINK to the partOf composition |  |
| [`Patient.link.other.link.type.value`](../../../../model/admin_entry/org.highmed/person_data.v0.yml#type "ADMIN_ENTRY.person_data.v0#type") | [`links/type` *(RM attribute)*](../../../../model/admin_entry/org.highmed/person_data.v0.yml#type "ADMIN_ENTRY.person_data.v0#type") | direct |  |
| [`Patient`](KDS_admin_entry_person.yml#compositionMapping "KDS_admin_entry_person.v0#compositionMapping") | [composition](KDS_admin_entry_person.yml#compositionMapping "KDS_admin_entry_person.v0#compositionMapping") | → table **COMPOSITION.person.v0** | *KDS_admin_entry_person.v0* |
| [`Patient.identifier`](KDS_admin_entry_person.yml#identifier "KDS_admin_entry_person.v0#identifier") | [*(the referenced resource)*](KDS_admin_entry_person.yml#identifier "KDS_admin_entry_person.v0#identifier") | engine code `ehrStatusAddExternalREF` | *KDS_admin_entry_person.v0* |

## Geschlecht — EVALUATION.gender.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….gender`](../../../../model/evaluation/org.openehr/gender.v1.yml#gender "EVALUATION.gender.v1#gender") | [**Administratives Geschlecht** `at0022`](../../../../model/evaluation/org.openehr/gender.v1.yml#gender "EVALUATION.gender.v1#gender") | direct |  |
| [`….gender.extension`](KDS_gender.yml#staticExtensionUrl "KDS_gender.v1#staticExtensionUrl") |  | fixed | url = `http://fhir.de/StructureDefinition/gender-amtlich-de`; *KDS_gender.v1* |
| [`….gender.extension.value`](KDS_gender.yml#otherAmtlichValueCoding "KDS_gender.v1#otherAmtlichValueCoding") | [**Anderes Geschlecht amtlich** `at0014`](KDS_gender.yml#otherAmtlichValueCoding "KDS_gender.v1#otherAmtlichValueCoding") | direct | *KDS_gender.v1* |
| [`….meta`](KDS_gender.yml#metaURL "KDS_gender.v1#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient`; openEHR → FHIR only; *KDS_gender.v1* |

## Person — CLUSTER.person.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….name`](KDS_cluster_person.yml#name "KDS_cluster_person.v1#name") | [CLUSTER.structured_name.v1 · `]` *(RM attribute)*](KDS_cluster_person.yml#name "KDS_cluster_person.v1#name") | → table **CLUSTER.structured_name.v1** | only if FHIR `use` one of `official`; *KDS_cluster_person.v1* |
| [`….address`](KDS_cluster_person.yml#address "KDS_cluster_person.v1#address") | [CLUSTER.address.v1 · `]` *(RM attribute)*](KDS_cluster_person.yml#address "KDS_cluster_person.v1#address") | → table **CLUSTER.address.v1** | only if FHIR `type` one of `both`; *KDS_cluster_person.v1* |
| [`managingOrganization`](../../../../model/cluster/org.openehr/person.v1.yml#organizationReference "CLUSTER.person.v1#organizationReference") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/person.v1.yml#organizationReference "CLUSTER.person.v1#organizationReference") | reference → Organization |  |
| [`managingOrganization`](../../../../model/cluster/org.openehr/person.v1.yml#organization "CLUSTER.person.v1#organization") | [CLUSTER.organisation.v1](../../../../model/cluster/org.openehr/person.v1.yml#organization "CLUSTER.person.v1#organization") | → table **CLUSTER.organisation.v1** |  |
| [`….name`](KDS_cluster_person.yml#geburtsname "KDS_cluster_person.v1#geburtsname") | [CLUSTER.structured_name.v1 · `]` *(RM attribute)*](KDS_cluster_person.yml#geburtsname "KDS_cluster_person.v1#geburtsname") | → table **CLUSTER.structured_name.v1** | only if FHIR `use` one of `maiden`; *KDS_cluster_person.v1* |
| [`…`](KDS_cluster_person.yml#addressPostfach "KDS_cluster_person.v1#addressPostfach") | [CLUSTER.address.v1 · `]` *(RM attribute)*](KDS_cluster_person.yml#addressPostfach "KDS_cluster_person.v1#addressPostfach") | → table **CLUSTER.address.v1** | only if FHIR `type` one of `postal`; *KDS_cluster_person.v1* |

## Geburtsname — CLUSTER.structured_name.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….use`](../../../../model/cluster/org.openehr/structured_name.v1.yml#typeOfName "CLUSTER.structured_name.v1#typeOfName") | [**Prefix-qualifier** `at0001`](../../../../model/cluster/org.openehr/structured_name.v1.yml#typeOfName "CLUSTER.structured_name.v1#typeOfName") | direct |  |
| [`….given`](../../../../model/cluster/org.openehr/structured_name.v1.yml#firstName "CLUSTER.structured_name.v1#firstName") | [**Vorname** `at0002`](../../../../model/cluster/org.openehr/structured_name.v1.yml#firstName "CLUSTER.structured_name.v1#firstName") | direct |  |
| [`….prefix.extension.value`](KDS_structured_name.v1.person_name-structured_name.yml#prefix "KDS_structured_name.v1.person_name-structured_name#prefix") | [`items[at0006]` *(not in this template)*](KDS_structured_name.v1.person_name-structured_name.yml#prefix "KDS_structured_name.v1.person_name-structured_name#prefix") | direct | extension `iso21090-EN-qualifier`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….prefix.extension.value`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | [`items[at0006]` *(not in this template)*](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | fixed | url = `http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….family`](KDS_structured_name.v1.person_name-structured_name.yml#family "KDS_structured_name.v1.person_name-structured_name#family") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#family "KDS_structured_name.v1.person_name-structured_name#family") | direct | *KDS_structured_name.v1.person_name-structured_name* |
| [`….family.extension`](KDS_structured_name.v1.person_name-structured_name.yml#familiennameZusatz "KDS_structured_name.v1.person_name-structured_name#familiennameZusatz") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#familiennameZusatz "KDS_structured_name.v1.person_name-structured_name#familiennameZusatz") | direct | extension `humanname-namenszusatz`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….family.extension`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | fixed | url = `http://fhir.de/StructureDefinition/humanname-namenszusatz`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….family.extension`](KDS_structured_name.v1.person_name-structured_name.yml#nachnameOhneZusätze "KDS_structured_name.v1.person_name-structured_name#nachnameOhneZusätze") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#nachnameOhneZusätze "KDS_structured_name.v1.person_name-structured_name#nachnameOhneZusätze") | direct | extension `humanname-own-name`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….family.extension`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | fixed | url = `http://hl7.org/fhir/StructureDefinition/humanname-own-name`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….family.extension`](KDS_structured_name.v1.person_name-structured_name.yml#vorsatzwort "KDS_structured_name.v1.person_name-structured_name#vorsatzwort") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#vorsatzwort "KDS_structured_name.v1.person_name-structured_name#vorsatzwort") | direct | extension `humanname-own-prefix`; *KDS_structured_name.v1.person_name-structured_name* |
| [`….family.extension`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | [**Familienname-Vorsatzwort** `at0005`](KDS_structured_name.v1.person_name-structured_name.yml#staticExtensionUrl "KDS_structured_name.v1.person_name-structured_name#staticExtensionUrl") | fixed | url = `http://hl7.org/fhir/StructureDefinition/humanname-own-prefix`; *KDS_structured_name.v1.person_name-structured_name* |

## Postfach — CLUSTER.address.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….city`](KDS_address.yml#city "KDS_address#city") | [**Stadtteil / Stadt / Gemeindeschlüssel** `at0002`](KDS_address.yml#city "KDS_address#city") | direct | *KDS_address* |
| [`….postalCode`](KDS_address.yml#postalCode "KDS_address#postalCode") | [**Postleitzahl** `at0005`](KDS_address.yml#postalCode "KDS_address#postalCode") | direct | *KDS_address* |
| [`….line`](KDS_address.yml#line "KDS_address#line") | [**Adresszeile** `at0001`](KDS_address.yml#line "KDS_address#line") | direct | *KDS_address* |
| [`….type`](KDS_address.yml#type "KDS_address#type") | [**Adresstyp** `at0010`](KDS_address.yml#type "KDS_address#type") | direct | *KDS_address* |
| [`….type`](KDS_address.yml#manual "KDS_address#manual") |  | value table | `physical` ↔ Physical (at0011)<br>`postal` ↔ Postal (at0012)<br>`both` ↔ Both (at0013); *KDS_address* |

## Daten zur Geburt — CLUSTER.person_birth_data_iso.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/person_birth_data_iso.v0.yml#birthdate "CLUSTER.person_birth_data_iso.v0#birthdate") | [**Geburtsdatum** `at0001`](../../../../model/cluster/org.openehr/person_birth_data_iso.v0.yml#birthdate "CLUSTER.person_birth_data_iso.v0#birthdate") | direct |  |

## Angaben zum Tod — CLUSTER.death_details.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/death_details.v1.yml#deathDate "CLUSTER.death_details.v1#deathDate") | [**Sterbedatum** `at0001`](../../../../model/cluster/org.openehr/death_details.v1.yml#deathDate "CLUSTER.death_details.v1#deathDate") | direct |  |

## Person — COMPOSITION.person.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….serviceProvider`](../../../../model/composition/org.highmed/person.v1.Patient.yml#healthcareFacility "COMPOSITION.person.v0#healthcareFacility") | [composition · `context/health_care_facility`](../../../../model/composition/org.highmed/person.v1.Patient.yml#healthcareFacility "COMPOSITION.person.v0#healthcareFacility") | direct |  |
| [`….period.start`](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextStart "COMPOSITION.person.v0#contextStart") | [composition · start time](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextStart "COMPOSITION.person.v0#contextStart") | direct |  |
| [`….period.end`](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextEnd "COMPOSITION.person.v0#contextEnd") | [composition · end time](../../../../model/composition/org.highmed/person.v1.Patient.yml#contextEnd "COMPOSITION.person.v0#contextEnd") | direct |  |
| [`…`](../../../../model/composition/org.highmed/person.v1.Patient.yml#effectiveStart "COMPOSITION.person.v0#effectiveStart") | [composition · start time](../../../../model/composition/org.highmed/person.v1.Patient.yml#effectiveStart "COMPOSITION.person.v0#effectiveStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….serviceProvider`](../../../../model/composition/org.highmed/person.v1.Patient.yml#composer "COMPOSITION.person.v0#composer") | [composition · composer](../../../../model/composition/org.highmed/person.v1.Patient.yml#composer "COMPOSITION.person.v0#composer") | direct |  |
| [`….serviceProvider`](../../../../model/composition/org.highmed/person.v1.Patient.yml#composerEmpty "COMPOSITION.person.v0#composerEmpty") | [composition · composer](../../../../model/composition/org.highmed/person.v1.Patient.yml#composerEmpty "COMPOSITION.person.v0#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `serviceProvider` is empty |
| [`….identifier`](KDS_Composition.yml#pid "KDS_composition_person.v0#pid") | [composition · `context/other_context[at0003]/items[at0004]`](KDS_Composition.yml#pid "KDS_composition_person.v0#pid") | direct | only if FHIR `system` not of `http://fhir.de/sid/gkv/kvid-10`; *KDS_composition_person.v0* |
| [`…`](KDS_Composition.yml#gender "KDS_composition_person.v0#gender") | [EVALUATION.gender.v1](KDS_Composition.yml#gender "KDS_composition_person.v0#gender") | → table **EVALUATION.gender.v1** | *KDS_composition_person.v0* |
| [`….identifier`](KDS_Composition.yml#versicherungsInformationen "KDS_composition_person.v0#versicherungsInformationen") | [ADMIN_ENTRY.versicherungsinformationen.v0](KDS_Composition.yml#versicherungsInformationen "KDS_composition_person.v0#versicherungsInformationen") | → table **ADMIN_ENTRY.versicherungsinformationen.v0** | only if FHIR `system` one of `http://fhir.de/sid/gkv/kvid-10`; *KDS_composition_person.v0* |

## Versicherungsinformationen — ADMIN_ENTRY.versicherungsinformationen.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/admin_entry/org.highmed/versicherungsinformationen.v0.yml#versicherungsId "ADMIN_ENTRY.versicherungsinformationen.v0#versicherungsId") | [**Versicherungsnummer** `at0006`](../../../../model/admin_entry/org.highmed/versicherungsinformationen.v0.yml#versicherungsId "ADMIN_ENTRY.versicherungsinformationen.v0#versicherungsId") | direct | only if FHIR `system` one of `http://fhir.de/sid/gkv/kvid-10` |
| [`…`](../../../../model/admin_entry/org.highmed/versicherungsinformationen.v0.yml#staticUrl "ADMIN_ENTRY.versicherungsinformationen.v0#staticUrl") |  | fixed | system = `http://fhir.de/sid/gkv/kvid-10` |
| [`….type.coding`](../../../../model/admin_entry/org.highmed/versicherungsinformationen.v0.yml#typeCoding "ADMIN_ENTRY.versicherungsinformationen.v0#typeCoding") |  | fixed | system = `http://fhir.de/CodeSystem/identifier-type-de-basis`, code = `KVZ10` |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
