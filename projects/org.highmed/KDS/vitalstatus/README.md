# KDS/vitalstatus

openEHR template **KDS_Vitalstatus** ↔ FHIR profile **Vitalstatus** (Observation), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus>

Both directions unless a row says otherwise. Starts at `EVALUATION.vital_status.v1`; context file `KDS_Vitalstatus.context.yaml`.

## Resources

- Template: [`KDS_Vitalstatus.opt`](../resources/openehr/templates/KDS_Vitalstatus.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.person#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.person#2025.0.0)
- Examples: [`../resources/examples/vitalstatus`](../resources/examples/vitalstatus): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-EVALUATION.vital_status.v1` | Vitalstatus | [`EVALUATION.vital_status.v1`](../../../../model/evaluation/org.openehr/vital_status.v1.yml) | [`KDS_vital_status`](KDS_vitalsigns.yml) |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Fallidentifikation | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Vitalstatus | [`COMPOSITION.report.v1.Observation`](../../../../model/composition/org.openehr/report.v1.Observation.yml) | – |

## Vitalstatus — EVALUATION.vital_status.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Observation.performer` | composition · `context/health_care_facility` | direct |  |
| `Observation.performer` |  | fixed | openEHR function = `performer` |
| `Observation.performer` | `performer` *(RM attribute)* | direct |  |
| `Observation.performer` | composition · composer | direct |  |
| `Observation.performer` | `perfomer` *(RM attribute)* | direct |  |
| `Observation.effective` | **Zeitpunkt der Feststellung** `at0018` | direct |  |
| `Observation.value` | **Vitalstatus** `at0006` | direct |  |
| `Observation.note.text` | **Kommentar** `at0013` | direct |  |
| `Observation.partOf` | `links` *(RM attribute)* | LINK to the partOf composition |  |
| `Observation.basedOn` | `links` *(RM attribute)* | LINK to the basedOn composition |  |
| `Observation.basedOn` | `links` *(RM attribute)* | LINK to the focus composition |  |
| `Observation.encounter` | `links` *(RM attribute)* | LINK to the case composition |  |
| `Observation.hasMember` | `links` *(RM attribute)* | LINK to the hasMember composition |  |
| `Observation.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus`; openEHR → FHIR only; *KDS_vital_status* |
| `Observation` | composition | → table **COMPOSITION.report.v1.Observation** | *KDS_vital_status* |
| `Observation.category.coding` |  | fixed | code = `survey`, system = `http://terminology.hl7.org/CodeSystem/observation-category`; *KDS_vital_status* |
| `Observation.code.coding` |  | fixed | code = `67162-8`, system = `http://loinc.org`; *KDS_vital_status* |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Fall-Kennung** `at0001` | direct |  |

## KDS_Vitalstatus — COMPOSITION.report.v1.Observation

Resources with `coding.code` = `['entered-in-error', 'amended', 'cancelled', 'unknown']` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….onset (Period)` | *(the referenced resource)* | direct |  |
| `….onset (Period).end` | *(the referenced resource)* | direct |  |
| `….onset (Period).start` | *(the referenced resource)* | direct |  |
| `….onset (DateTimeType)` | composition · start time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….asserter` |  | fixed | openEHR function = `asserter` |
| `….asserter` | `performer` *(RM attribute)* | direct |  |
| `….recorder` | composition · composer | direct |  |
| `….recorder` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `recorder` is empty |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
