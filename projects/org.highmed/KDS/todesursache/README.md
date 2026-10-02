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
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Todesursache | [`COMPOSITION.report.v1.Condition`](../../../../model/composition/org.openehr/report.v1.Condition.yml) | – |

## Cause of death — EVALUATION.cause_of_death.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Condition` | composition | → table **COMPOSITION.report.v1.Condition** |  |
| `Condition.asserter` |  | fixed | openEHR function = `asserter` |
| `Condition.asserter` | `performer` *(RM attribute)* | direct |  |
| `Condition.recorder` | `provider` *(RM attribute)* | direct |  |
| `Condition` | CLUSTER.problem_qualifier.v2 | → table **CLUSTER.problem_qualifier.v2** |  |
| `Condition.code` | **Todesursache** `at0002` | direct |  |
| `Condition.category.coding` |  | fixed | code = `79378-6`<br>system = `http://loinc.org` |
| `Condition.category.coding` |  | fixed | code = `16100001`<br>system = `http://snomed.info/sct` |
| `Condition.note.text` | **Comment** `at0013` | direct |  |
| `Condition.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache`; openEHR → FHIR only; *KDS_cause_of_death* |
| `Condition` | composition | → table **COMPOSITION.report.v1.Condition** | *KDS_cause_of_death* |

## Problem/Diagnosis qualifier — CLUSTER.problem_qualifier.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….verificationStatus.coding` | **Diagnostic status** `at0004` | value table | `provisional` ↔ Working (at0017)<br>`differential` ↔ Working (at0017)<br>`unconfirmed` ↔ Preliminary (at0016)<br>`confirmed` ↔ Established (at0018)<br>`refuted` ↔ Refuted (at0088); only if FHIR `coding.code` not of `entered-in-error` |
| `….clinicalStatus` | **Active/Inactive?** `at0003` | direct | *KDS_problem_qualifier_todesursache* |

## Case identification — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Case identifier** `at0001` | direct |  |

## KDS_Todesursache — COMPOSITION.report.v1.Condition

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….onset (Period)` | *(the referenced resource)* | direct |  |
| `….onset (Period).end` | *(the referenced resource)* | direct |  |
| `….onset (Period).start` | *(the referenced resource)* | direct |  |
| `….onset (DateTime)` | composition · start time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….recordedDate` | composition · start time | direct |  |
| `….asserter` |  | fixed | openEHR function = `asserter` |
| `….asserter` | `performer` *(RM attribute)* | direct |  |
| `….recorder` | composition · composer | direct |  |
| `….recorder` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `recorder` is empty |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
