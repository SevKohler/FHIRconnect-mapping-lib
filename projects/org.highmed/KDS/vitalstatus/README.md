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
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Vitalstatus | [`COMPOSITION.report.v1.Observation`](../../../../model/composition/org.openehr/report.v1.Observation.yml) | [`KDS_composition`](KDS_composition.yml) |

## Vitalstatus — EVALUATION.vital_status.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`Observation.performer`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#healthCareFacility "EVALUATION.vital_status.v1#healthCareFacility") | [composition · `context/health_care_facility`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#healthCareFacility "EVALUATION.vital_status.v1#healthCareFacility") | direct |  |
| [`Observation.performer`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#participationFunction "EVALUATION.vital_status.v1#participationFunction") |  | fixed | openEHR function = `performer` |
| [`Observation.performer`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#performer "EVALUATION.vital_status.v1#performer") | [`performer` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#performer "EVALUATION.vital_status.v1#performer") | direct |  |
| [`Observation.performer`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#composer "EVALUATION.vital_status.v1#composer") | [composition · composer](../../../../model/evaluation/org.openehr/vital_status.v1.yml#composer "EVALUATION.vital_status.v1#composer") | direct |  |
| [`Observation.performer`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#performer "EVALUATION.vital_status.v1#performer") | [`perfomer` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#performer "EVALUATION.vital_status.v1#performer") | direct |  |
| [`Observation.effective`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#effective "EVALUATION.vital_status.v1#effective") | [**Zeitpunkt der Feststellung** `at0018`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#effective "EVALUATION.vital_status.v1#effective") | direct |  |
| [`Observation.value`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#vitalStatus "EVALUATION.vital_status.v1#vitalStatus") | [**Vitalstatus** `at0006`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#vitalStatus "EVALUATION.vital_status.v1#vitalStatus") | direct |  |
| [`Observation.note.text`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#note "EVALUATION.vital_status.v1#note") | [**Kommentar** `at0013`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#note "EVALUATION.vital_status.v1#note") | direct |  |
| [`Observation.partOf`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | [`links` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | LINK to the partOf composition |  |
| [`Observation.basedOn`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | [`links` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | LINK to the basedOn composition |  |
| [`Observation.basedOn`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | [`links` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | LINK to the focus composition |  |
| [`Observation.encounter`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | [`links` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | LINK to the case composition |  |
| [`Observation.hasMember`](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | [`links` *(RM attribute)*](../../../../model/evaluation/org.openehr/vital_status.v1.yml#partOfReference "EVALUATION.vital_status.v1#partOfReference") | LINK to the hasMember composition |  |
| [`Observation.meta`](KDS_vitalsigns.yml#metaURL "KDS_vital_status#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus`; openEHR → FHIR only; *KDS_vital_status* |
| [`Observation`](KDS_vitalsigns.yml#compositionMapping "KDS_vital_status#compositionMapping") | [composition](KDS_vitalsigns.yml#compositionMapping "KDS_vital_status#compositionMapping") | → table **COMPOSITION.report.v1.Observation** | *KDS_vital_status* |
| [`Observation.category.coding`](KDS_vitalsigns.yml#manual "KDS_vital_status#manual") |  | fixed | code = `survey`, system = `http://terminology.hl7.org/CodeSystem/observation-category`; *KDS_vital_status* |
| [`Observation.code.coding`](KDS_vitalsigns.yml#manual "KDS_vital_status#manual") |  | fixed | code = `67162-8`, system = `http://loinc.org`; *KDS_vital_status* |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | [**Fall-Kennung** `at0001`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | direct |  |

## KDS_Vitalstatus — COMPOSITION.report.v1.Observation

Resources with `coding.code` = `['entered-in-error', 'amended', 'cancelled', 'unknown']` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….onset (Period)`](../../../../model/composition/org.openehr/report.v1.Observation.yml#onset "COMPOSITION.report.v1.Observation#onset") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Observation.yml#onset "COMPOSITION.report.v1.Observation#onset") | direct |  |
| [`….onset (Period).end`](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetEnd "COMPOSITION.report.v1.Observation#onsetEnd") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetEnd "COMPOSITION.report.v1.Observation#onsetEnd") | direct |  |
| [`….onset (Period).start`](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetStart "COMPOSITION.report.v1.Observation#onsetStart") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetStart "COMPOSITION.report.v1.Observation#onsetStart") | direct |  |
| [`….onset (DateTimeType)`](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetDateTime "COMPOSITION.report.v1.Observation#onsetDateTime") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetDateTime "COMPOSITION.report.v1.Observation#onsetDateTime") | direct |  |
| [`…`](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetStart "COMPOSITION.report.v1.Observation#onsetStart") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Observation.yml#onsetStart "COMPOSITION.report.v1.Observation#onsetStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….asserter`](../../../../model/composition/org.openehr/report.v1.Observation.yml#participationFunction "COMPOSITION.report.v1.Observation#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`….asserter`](../../../../model/composition/org.openehr/report.v1.Observation.yml#performer "COMPOSITION.report.v1.Observation#performer") | [`performer` *(RM attribute)*](../../../../model/composition/org.openehr/report.v1.Observation.yml#performer "COMPOSITION.report.v1.Observation#performer") | direct |  |
| [`….recorder`](../../../../model/composition/org.openehr/report.v1.Observation.yml#composer "COMPOSITION.report.v1.Observation#composer") | [composition · composer](../../../../model/composition/org.openehr/report.v1.Observation.yml#composer "COMPOSITION.report.v1.Observation#composer") | direct |  |
| [`….recorder`](../../../../model/composition/org.openehr/report.v1.Observation.yml#composerEmpty "COMPOSITION.report.v1.Observation#composerEmpty") | [composition · composer](../../../../model/composition/org.openehr/report.v1.Observation.yml#composerEmpty "COMPOSITION.report.v1.Observation#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `recorder` is empty |
| [`….encounter (Reference).identifier`](KDS_composition.yml#encounter "KDS_composition#encounter") | [CLUSTER.case_identification.v0](KDS_composition.yml#encounter "KDS_composition#encounter") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | [*(the referenced resource)*](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | reference → Encounter | *KDS_composition* |
| [`….encounter.identifier`](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | [CLUSTER.case_identification.v0](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | [CLUSTER.case_identification.v0 · `links` *(RM attribute)*](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | LINK to the case composition | *KDS_composition* |
| [`….status`](KDS_composition.yml#status "KDS_composition#status") | [composition · `context/other_context[at0001]/items[at0005]`](KDS_composition.yml#status "KDS_composition#status") | direct | *KDS_composition* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
