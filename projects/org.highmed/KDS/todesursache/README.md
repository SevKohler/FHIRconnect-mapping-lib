# KDS/todesursache

openEHR template **KDS_Todesursache** ↔ FHIR profile **Todesursache** (Condition), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache>

Both directions unless a row says otherwise. Starts at `EVALUATION.cause_of_death.v1`; context file `KDS_Todesursache.context.yaml`.

## Resources

- Template: [`KDS_Todesursache.opt`](../resources/openehr/templates/KDS_Todesursache.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.person#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.person#2025.0.0)
- Examples: [`../resources/examples/todesursache`](../resources/examples/todesursache): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-EVALUATION.cause_of_death.v1` | Cause of death | [`EVALUATION.cause_of_death.v1`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml) | [`KDS_cause_of_death`](KDS_cause_of_death.yml) |
| `openEHR-EHR-CLUSTER.problem_qualifier.v2` | Problem/Diagnosis qualifier | [`CLUSTER.problem_qualifier.v2`](../../../../model/cluster/org.openehr/problem_qualifier.v2.yml) | [`KDS_problem_qualifier_todesursache`](KDS_problem_qualifier.yml) |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Case identification | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Todesursache | [`COMPOSITION.report.v1.Condition`](../../../../model/composition/org.openehr/report.v1.Condition.yml) | [`KDS_composition`](KDS_composition.yml) |

## Cause of death — EVALUATION.cause_of_death.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`Condition`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#compositionMapping "EVALUATION.cause_of_death.v1#compositionMapping") | [composition](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#compositionMapping "EVALUATION.cause_of_death.v1#compositionMapping") | → table **COMPOSITION.report.v1.Condition** |  |
| [`Condition.asserter`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#participationFunction "EVALUATION.cause_of_death.v1#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`Condition.asserter`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#performer "EVALUATION.cause_of_death.v1#performer") | [`performer` *(RM attribute)*](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#performer "EVALUATION.cause_of_death.v1#performer") | direct |  |
| [`Condition.recorder`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#provider "EVALUATION.cause_of_death.v1#provider") | [`provider` *(RM attribute)*](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#provider "EVALUATION.cause_of_death.v1#provider") | direct |  |
| [`Condition`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#status "EVALUATION.cause_of_death.v1#status") | [CLUSTER.problem_qualifier.v2](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#status "EVALUATION.cause_of_death.v1#status") | → table **CLUSTER.problem_qualifier.v2** |  |
| [`Condition.code`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#causeOfDeath "EVALUATION.cause_of_death.v1#causeOfDeath") | [**Todesursache** `at0002`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#causeOfDeath "EVALUATION.cause_of_death.v1#causeOfDeath") | direct |  |
| [`Condition.category.coding`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#categoryCodeCodingLoinc "EVALUATION.cause_of_death.v1#categoryCodeCodingLoinc") |  | fixed | code = `79378-6`<br>system = `http://loinc.org` |
| [`Condition.category.coding`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#categoryCodeCodingSnomed "EVALUATION.cause_of_death.v1#categoryCodeCodingSnomed") |  | fixed | code = `16100001`<br>system = `http://snomed.info/sct` |
| [`Condition.note.text`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#comment "EVALUATION.cause_of_death.v1#comment") | [**Comment** `at0013`](../../../../model/evaluation/org.openehr/cause_of_death.v1.yml#comment "EVALUATION.cause_of_death.v1#comment") | direct |  |
| [`Condition.meta`](KDS_cause_of_death.yml#metaURL "KDS_cause_of_death#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache`; openEHR → FHIR only; *KDS_cause_of_death* |
| [`Condition`](KDS_cause_of_death.yml#compositionMapping "KDS_cause_of_death#compositionMapping") | [composition](KDS_cause_of_death.yml#compositionMapping "KDS_cause_of_death#compositionMapping") | → table **COMPOSITION.report.v1.Condition** | *KDS_cause_of_death* |

## Problem/Diagnosis qualifier — CLUSTER.problem_qualifier.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….verificationStatus.coding`](../../../../model/cluster/org.openehr/problem_qualifier.v2.yml#statusCoded "CLUSTER.problem_qualifier.v2#statusCoded") | [**Diagnostic status** `at0004`](../../../../model/cluster/org.openehr/problem_qualifier.v2.yml#statusCoded "CLUSTER.problem_qualifier.v2#statusCoded") | value table | `provisional` ↔ Working (at0017)<br>`differential` ↔ Working (at0017)<br>`unconfirmed` ↔ Preliminary (at0016)<br>`confirmed` ↔ Established (at0018)<br>`refuted` ↔ Refuted (at0088); only if FHIR `coding.code` not of `entered-in-error` |
| [`….clinicalStatus`](KDS_problem_qualifier.yml#clinicalStatus "KDS_problem_qualifier_todesursache#clinicalStatus") | [**Active/Inactive?** `at0003`](KDS_problem_qualifier.yml#clinicalStatus "KDS_problem_qualifier_todesursache#clinicalStatus") | direct | *KDS_problem_qualifier_todesursache* |

## Case identification — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | [**Case identifier** `at0001`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | direct |  |

## KDS_Todesursache — COMPOSITION.report.v1.Condition

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….onset (Period)`](../../../../model/composition/org.openehr/report.v1.Condition.yml#onset "COMPOSITION.report.v1.Condition#onset") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Condition.yml#onset "COMPOSITION.report.v1.Condition#onset") | direct |  |
| [`….onset (Period).end`](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetEnd "COMPOSITION.report.v1.Condition#onsetEnd") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetEnd "COMPOSITION.report.v1.Condition#onsetEnd") | direct |  |
| [`….onset (Period).start`](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetStart "COMPOSITION.report.v1.Condition#onsetStart") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetStart "COMPOSITION.report.v1.Condition#onsetStart") | direct |  |
| [`….onset (DateTime)`](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetDateTime "COMPOSITION.report.v1.Condition#onsetDateTime") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetDateTime "COMPOSITION.report.v1.Condition#onsetDateTime") | direct |  |
| [`…`](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetStart "COMPOSITION.report.v1.Condition#onsetStart") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Condition.yml#onsetStart "COMPOSITION.report.v1.Condition#onsetStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….recordedDate`](../../../../model/composition/org.openehr/report.v1.Condition.yml#contextStartTime "COMPOSITION.report.v1.Condition#contextStartTime") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Condition.yml#contextStartTime "COMPOSITION.report.v1.Condition#contextStartTime") | direct |  |
| [`….asserter`](../../../../model/composition/org.openehr/report.v1.Condition.yml#participationFunction "COMPOSITION.report.v1.Condition#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`….asserter`](../../../../model/composition/org.openehr/report.v1.Condition.yml#performer "COMPOSITION.report.v1.Condition#performer") | [`performer` *(RM attribute)*](../../../../model/composition/org.openehr/report.v1.Condition.yml#performer "COMPOSITION.report.v1.Condition#performer") | direct |  |
| [`….recorder`](../../../../model/composition/org.openehr/report.v1.Condition.yml#composer "COMPOSITION.report.v1.Condition#composer") | [composition · composer](../../../../model/composition/org.openehr/report.v1.Condition.yml#composer "COMPOSITION.report.v1.Condition#composer") | direct |  |
| [`….recorder`](../../../../model/composition/org.openehr/report.v1.Condition.yml#composerEmpty "COMPOSITION.report.v1.Condition#composerEmpty") | [composition · composer](../../../../model/composition/org.openehr/report.v1.Condition.yml#composerEmpty "COMPOSITION.report.v1.Condition#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `recorder` is empty |
| [`….encounter (Reference).identifier`](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition#fallIdentifikationIdentifier") | [CLUSTER.case_identification.v0](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition#fallIdentifikationIdentifier") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | [*(the referenced resource)*](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | reference → Encounter | *KDS_composition* |
| [`….encounter.identifier`](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | [CLUSTER.case_identification.v0](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | [CLUSTER.case_identification.v0 · `links` *(RM attribute)*](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | LINK to the case composition | *KDS_composition* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
