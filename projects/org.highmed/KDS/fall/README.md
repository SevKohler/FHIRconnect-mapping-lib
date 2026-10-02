# KDS/fall

openEHR template **KDS_Fall_einfach** ↔ FHIR profile **KontaktGesundheitseinrichtung** (Encounter), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung>

Both directions unless a row says otherwise. Starts at `ADMIN_ENTRY.episode_institution_local.v0`; context file `KDS_fall_einfach.context.yaml`.

## Resources

- Template: [`KDS_Fall_einfach.opt`](../resources/openehr/templates/KDS_Fall_einfach.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.fall#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.fall#2025.0.0)
- Examples: [`../resources/examples/fall`](../resources/examples/fall): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-EVALUATION.problem_diagnosis.v1` | Problem/Diagnose | [`EVALUATION.problem_diagnosis.v1`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml) | [`KDS_fall_problem_diagnose`](KDS_fall_problem_diagnose.yml) |
| `openEHR-EHR-ADMIN_ENTRY.episode_institution_local.v0` | Institutionsaufenthalt | [`ADMIN_ENTRY.episode_institution_local.v0`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml) | [`KDS_episode_institution_local`](KDS_episode_institution_local.yml) |
| `openEHR-EHR-CLUSTER.kontakttyp.v0` | KontaktTyp | [`CLUSTER.kontakttyp.v0`](../../../../model/cluster/org.highmed/kontaktTyp.yml) | – |
| `openEHR-EHR-CLUSTER.diagnosetyp.v0` | DiagnoseTyp | [`CLUSTER.diagnosetyp.v0`](../../../../model/cluster/org.highmed/diagnoseTyp.yml) | – |
| `openEHR-EHR-CLUSTER.organization.v0` | Organisationseinheit | [`CLUSTER.organization.v0`](../../../../model/cluster/org.highmed/organization.v0.yml) | – |
| `openEHR-EHR-CLUSTER.location.v1` | Standort | [`CLUSTER.location.v1`](../../../../model/cluster/org.openehr/location.v1.yml) | – |
| `openEHR-EHR-CLUSTER.anatomical_location.v1` | Anatomische Lokalisation | [`CLUSTER.anatomical_location.v1`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml) | [`KDS_anatomical_location`](../diagnose/KDS_anatomical_location.yml) |
| `openEHR-EHR-COMPOSITION.fall.v1` | KDS_Fall_einfach | [`COMPOSITION.fall.v1.encounter`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml) | [`KDS_composition`](KDS_composition.yml) |

## Institutionsaufenthalt — ADMIN_ENTRY.episode_institution_local.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Encounter.serviceProvider` | composition · `context/health_care_facility` | direct |  |
| `Encounter.period` | composition · `context` | direct |  |
| `Encounter.period.start` | composition · start time | direct |  |
| `Encounter.period.end` | composition · end time | direct |  |
| `Encounter.location` | CLUSTER.location.v1 | → table **CLUSTER.location.v1** |  |
| `Encounter.period.start` | **Aufnahmedatum** `at0004` | direct |  |
| `Encounter.period.end` | **Entlassungsdatum** `at0002` | direct |  |
| `Encounter.period.location.identifier` | `items[at0024]` *(not in this template)* | direct | only if FHIR `physicalType.coding.code` one of `bd` |
| `Encounter.period.status` | `items[at0028]` *(not in this template)* | direct |  |
| `Encounter` | composition | → table **COMPOSITION.fall.v1.encounter** | *KDS_episode_institution_local* |
| `Encounter.serviceProvider (Organization)` | *(the referenced resource)* | reference → Organization | *KDS_episode_institution_local* |
| `Encounter.serviceProvider (Organization)` | CLUSTER.organisation.v1 | → table **CLUSTER.organisation.v1** | *KDS_episode_institution_local* |
| `Encounter.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/Aufnahmegrund`; *KDS_episode_institution_local* |
| `Encounter.extension.extension` | **Aufnahmegrund - Vierte Stelle** `at0008` | direct | extension `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| `Encounter.extension.extension` | **Aufnahmegrund - Vierte Stelle** `at0008` | fixed | url = `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| `Encounter.extension.extension` | **Aufnahmegrund - Vierte Stelle** `at0008` | direct | extension `DritteStelle`; *KDS_episode_institution_local* |
| `Encounter.extension.extension` | **Aufnahmegrund - Vierte Stelle** `at0008` | fixed | url = `DritteStelle`; *KDS_episode_institution_local* |
| `Encounter.extension.extension` | **Aufnahmegrund - Vierte Stelle** `at0008` | direct | extension `VierteStelle`; *KDS_episode_institution_local* |
| `Encounter.extension.extension` | **Aufnahmegrund - Vierte Stelle** `at0008` | fixed | url = `VierteStelle`; *KDS_episode_institution_local* |
| `Encounter.hospitalization.admitSource.coding` | **Aufnahmekategorie** `at0009` | direct | *KDS_episode_institution_local* |
| `Encounter.hospitalization.dischargeDisposition.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/Entlassungsgrund`; *KDS_episode_institution_local* |
| `Encounter.hospitalization.dischargeDisposition.extension.extension` | **Item tree** `at0001` | direct | extension `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| `Encounter.hospitalization.dischargeDisposition.extension.extension.value (Coding)` | **EntlassungsgrundErsteUndZweiteStelle** `at0006` | direct | *KDS_episode_institution_local* |
| `Encounter.hospitalization.dischargeDisposition.extension.extension` | **Item tree** `at0001` | fixed | url = `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| `Encounter.diagnosis.condition` | *(the referenced resource)* | reference → Condition | *KDS_episode_institution_local* |
| `Encounter.diagnosis.condition` | EVALUATION.problem_diagnosis.v1 | → table **EVALUATION.problem_diagnosis.v1** | *KDS_episode_institution_local* |
| `Encounter.diagnosis.use` | CLUSTER.diagnosetyp.v0 | → table **CLUSTER.diagnosetyp.v0** | *KDS_episode_institution_local* |

## Problem/Diagnose — EVALUATION.problem_diagnosis.v1

Resources with `verificationStatus.coding.code` = `entered-in-error` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….asserter` |  | fixed | openEHR function = `asserter` |
| `….recorder` | composition · composer | direct |  |
| `….recorder` | `provider` *(RM attribute)* | direct |  |
| `….code` | **Name des Problems/ der Diagnose** `at0002` | direct |  |
| `….note.text` | **Kommentar** `at0069` | direct |  |
| `….onset` | **Datum/ Zeitpunkt des Auftretens/ der Erstdiagnose** `at0077` | direct |  |
| `….bodySite` | `data[at0012]` *(not in this template)* | direct |  |
| `….bodySite` | CLUSTER.anatomical_location.v1 | → table **CLUSTER.anatomical_location.v1** |  |
| `….severity` | **Structure** `at0005` | direct |  |

## KontaktTyp — CLUSTER.kontakttyp.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….coding` | **KontaktEbene** `at0001` | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/Kontaktebene` |
| `….coding` | **KontaktEbene** `at0001` | fixed | system = `http://fhir.de/CodeSystem/kontaktebene` |
| `….coding` | **KontaktArt** `at0002` | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/kontaktart-de` |
| `….coding` | **KontaktArt** `at0002` | fixed | system = `http://fhir.de/CodeSystem/kontaktart-de` |

## DiagnoseTyp — CLUSTER.diagnosetyp.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….coding` | **Rolle** `at0003` | direct | only if FHIR `system` one of `http://terminology.hl7.org/CodeSystem/diagnosis-role`; only if openEHR `items[at0003]` is not empty |
| `….coding` | **Rolle** `at0003` | fixed | system = `http://terminology.hl7.org/CodeSystem/diagnosis-role` |
| `….coding` | **Typ** `at0001` | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/DiagnoseTyp`; only if openEHR `items[at0001]` is not empty |
| `….coding` | **Typ** `at0001` | fixed | system = `http://fhir.de/CodeSystem/DiagnoseTyp` |
| `….coding` | **Subtyp** `at0002` | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/Diagnosesubtyp`; only if openEHR `items[at0002]` is not empty |
| `….coding` | **Subtyp** `at0002` | fixed | system = `http://fhir.de/CodeSystem/Diagnosesubtyp` |

## Organisationseinheit — CLUSTER.organization.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….type` | **Typ** `at0051` | direct |  |
| `…` | **Organisationsschlüssel** `at0024` | direct |  |
| `….name` | **Name** `at0052` | direct |  |

## Standort — CLUSTER.location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….location.identifier` | **Station** `at0027` | direct |  |
| `….physicalType.coding` |  | fixed | system = `http://terminology.hl7.org/CodeSystem/location-physical-type`, code = `wa`; only if openEHR `items[at0027]` is not empty |
| `….status` | **Status** `at0046` | direct | only if openEHR `items[at0027]` is not empty |
| `….location.identifier` | **Zimmer** `at0029` | direct |  |
| `….physicalType.coding` |  | fixed | system = `http://terminology.hl7.org/CodeSystem/location-physical-type`, code = `ro`; only if openEHR `items[at0029]` is not empty |
| `….status` | **Status** `at0046` | direct | only if openEHR `items[at0029]` is not empty |
| `….location.identifier` | **Bettstellplatz** `at0034` | direct |  |
| `….physicalType.coding` |  | fixed | system = `http://terminology.hl7.org/CodeSystem/location-physical-type`, code = `bd`; only if openEHR `items[at0034]` is not empty |
| `….status` | **Status** `at0046` | direct | only if openEHR `items[at0034]` is not empty |

## Anatomische Lokalisation — CLUSTER.anatomical_location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….text` | **Name der Körperstelle** `at0001` | direct | only if FHIR `coding` is empty |
| `…` | **Name der Körperstelle** `at0001` | direct | only if openEHR `items[at0001]` type `DV_CODED_TEXT` |
| `….value (Coding)` | **Lateralität** `at0002` | direct | only if FHIR `` type `Extension`; *KDS_anatomical_location* |

## KDS_Fall_einfach — COMPOSITION.fall.v1.encounter

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….serviceProvider` | composition · `context/health_care_facility` | direct |  |
| `….period.start` | composition · start time | direct |  |
| `….period.end` | composition · end time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….serviceProvider` | composition · composer | direct |  |
| `….serviceProvider` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `serviceProvider` is empty |
| `….type` | composition · `context/other_context[at0001]/items[at0005]` | direct | *KDS_composition* |
| `….class` | composition · `context/other_context[at0001]/items[at0004]` | direct | *KDS_composition* |
| `….status` | composition · `context/other_context[at0001]/items[at0010]` | direct | *KDS_composition* |
| `….identifier` | composition · `context/other_context[at0001]/items[at0003]` | direct | only if FHIR `type.coding.code` one of `VN`; *KDS_composition* |
| `….identifier.type.coding` | composition · `context/other_context[at0001]/items[at0003]` | fixed | code = `VN`, system = `http://terminology.hl7.org/CodeSystem/v2-0203`; *KDS_composition* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
