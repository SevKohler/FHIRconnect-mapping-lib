# KDS/diagnose

openEHR template **KDS_Diagnose** ↔ FHIR profile **Diagnose** (Condition), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose>

Both directions unless a row says otherwise. Starts at `EVALUATION.problem_diagnosis.v1`; context file `KDS_diagnose.context.yaml`.

## Resources

- Template: [`KDS_Diagnose.opt`](../resources/openehr/templates/KDS_Diagnose.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.diagnose#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.diagnose#2025.0.0)
- Examples: [`../resources/examples/diagnose`](../resources/examples/diagnose): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-CLUSTER.multiple_coding_icd10gm.v1` | Multiple_coding_ICD-10-GM | [`CLUSTER.multiple_coding_icd10gm.v1`](../../../../model/cluster/org.highmed/multiple_coding_icd10gm.v1.yml) | – |
| `openEHR-EHR-EVALUATION.problem_diagnosis.v1` | Diagnose | [`EVALUATION.problem_diagnosis.v1`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml) | [`KDS_problem_diagnose`](KDS_problem_diagnose.yml) |
| `openEHR-EHR-CLUSTER.problem_qualifier.v2` | Klinischer Status | [`CLUSTER.problem_qualifier.v2`](../../../../model/cluster/org.openehr/problem_qualifier.v2.yml) | [`KDS_problem_qualifier`](KDS_problem_qualifier.yml) |
| `openEHR-EHR-CLUSTER.lebensphase.v0` | Lebensphase | [`CLUSTER.lebensphase.v0`](../../../../model/cluster/org.highmed/lebensphase.v0.yml) | [`KDS_lebensphase`](KDS_lebensphase.yml) |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Case identification | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-CLUSTER.anatomical_location.v1` | Anatomical location | [`CLUSTER.anatomical_location.v1`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml) | [`KDS_anatomical_location`](KDS_anatomical_location.yml) |
| `openEHR-EHR-COMPOSITION.report.v1` | Diagnose | [`COMPOSITION.report.v1.Condition`](../../../../model/composition/org.openehr/report.v1.Condition.yml) | – |

## Diagnose — EVALUATION.problem_diagnosis.v1

Resources with `verificationStatus.coding.code` = `entered-in-error` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Condition.recordedDate` | composition · start time | direct |  |
| `Condition.asserter` |  | fixed | openEHR function = `asserter` |
| `Condition.recorder` | composition · composer | direct |  |
| `Condition.recorder` | `provider` *(RM attribute)* | direct |  |
| `Condition.code` | **Kodierte Diagnose** `at0002` | direct |  |
| `Condition.code.coding` |  | fixed | system = `http://fhir.de/CodeSystem/bfarm/icd-10-gm`; *KDS_problem_diagnose* |
| `Condition.code.coding.extension.value` | **Diagnosesicherheit** `at0073` | direct | *KDS_problem_diagnose* |
| `Condition.code.coding.extension.value` | **Diagnosesicherheit** `at0073` | direct | FHIR → openEHR only; *KDS_problem_diagnose* |
| `Condition.code.coding.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit`; *KDS_problem_diagnose* |
| `Condition.code.coding.extension` | CLUSTER.multiple_coding_icd10gm.v1 | → table **CLUSTER.multiple_coding_icd10gm.v1** | *KDS_problem_diagnose* |
| `Condition.code.coding.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen`; *KDS_problem_diagnose* |
| `Condition.code.coding.extension` | CLUSTER.anatomical_location.v1 | → table **CLUSTER.anatomical_location.v1** | *KDS_problem_diagnose* |
| `Condition.code.coding.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/seitenlokalisation`; *KDS_problem_diagnose* |
| `Condition.note.text` | **Diagnoseerläuterung** `at0069` | direct |  |
| `Condition.onset (Period)` | CLUSTER.lebensphase.v0 | → table **CLUSTER.lebensphase.v0** | *KDS_problem_diagnose* |
| `Condition.onset (Period).start` | **Klinisch relevanter Zeitraum (Zeitpunkt des Auftretens)** `at0077` | direct | *KDS_problem_diagnose* |
| `Condition.onset (DateTime)` | **Klinisch relevanter Zeitraum (Zeitpunkt des Auftretens)** `at0077` | direct | only if openEHR `items[openEHR-EHR-CLUSTER.lebensphase.v0]/items[at0001], items[openEHR-EHR-CLUSTER.lebensphase.v0]/items[at0002]` is empty; *KDS_problem_diagnose* |
| `Condition.bodySite` | `data[at0012]` *(not in this template)* | direct |  |
| `Condition.bodySite` | CLUSTER.anatomical_location.v1 | → table **CLUSTER.anatomical_location.v1** |  |
| `Condition.severity` | **Severity** `at0005` | direct |  |
| `Condition` | composition | → table **COMPOSITION.report.v1.Condition** | *KDS_problem_diagnose* |
| `Condition.extension` | **Feststellungsdatum** `at0003` | direct | extension `condition-assertedDate`; *KDS_problem_diagnose* |
| `Condition.extension.value (DateTime)` | **Feststellungsdatum** `at0003` | direct | *KDS_problem_diagnose* |
| `Condition.extension` | **Feststellungsdatum** `at0003` | fixed | url = `http://hl7.org/fhir/StructureDefinition/condition-assertedDate`; *KDS_problem_diagnose* |
| `Condition.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose`; openEHR → FHIR only; *KDS_problem_diagnose* |
| `Condition` | CLUSTER.problem_qualifier.v2 | → table **CLUSTER.problem_qualifier.v2** | *KDS_problem_diagnose* |
| `Condition.extension` |  | fixed | url = `http://hl7.org/fhir/StructureDefinition/condition-related`; *KDS_problem_diagnose* |
| `Condition.extension.value` | *(the referenced resource)* | reference → Condition | *KDS_problem_diagnose* |
| `Condition.extension.value` | EVALUATION.problem_diagnosis.v1 | → table **EVALUATION.problem_diagnosis.v1** | only if openEHR `data[at0001]/items[openEHR-EHR-CLUSTER.problem_qualifier.v2]/items[at0063]/defining_code/code_string` one of `at0064`; *KDS_problem_diagnose* |

## Multiple_coding_ICD-10-GM — CLUSTER.multiple_coding_icd10gm.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….value (Coding)` | **Multiple coding identifier** `at0001` | value table | `*` ↔ * (at0003)<br>`†` ↔ † (at0002)<br>`!` ↔ ! (at0004) |

## Klinischer Status — CLUSTER.problem_qualifier.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….verificationStatus.coding` | **Diagnostic status** `at0004` | value table | `provisional` ↔ Working (at0017)<br>`differential` ↔ Working (at0017)<br>`unconfirmed` ↔ Preliminary (at0016)<br>`confirmed` ↔ Established (at0018)<br>`refuted` ↔ Refuted (at0088); only if FHIR `coding.code` not of `entered-in-error` |
| `….clinicalStatus` | **Klinischer Status** `at0003` | direct | *KDS_problem_qualifier* |
| `` | **Diagnoserolle** `at0063` | fixed | openEHR defining_code/terminology_id = `local`, defining_code/code_string = `at0064`, value = `Hauptdiagnose`; only if FHIR `extension.url` not of `http://hl7.org/fhir/StructureDefinition/condition-related`; *KDS_problem_qualifier* |
| `` | **Diagnoserolle** `at0063` | fixed | openEHR defining_code/terminology_id = `local`, defining_code/code_string = `at0066`, value = `Nebendiagnose`; only if FHIR `extension.url` one of `http://hl7.org/fhir/StructureDefinition/condition-related`; *KDS_problem_qualifier* |

## Lebensphase — CLUSTER.lebensphase.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….start.extension` | **Beginn** `at0001` | direct | extension `lebensphase`; *KDS_lebensphase* |
| `….start.extension` | **Beginn** `at0001` | fixed | url = `http://fhir.de/StructureDefinition/lebensphase`; *KDS_lebensphase* |
| `….end.extension` | **Ende** `at0002` | direct | extension `lebensphase`; *KDS_lebensphase* |
| `….end.extension` | **Ende** `at0002` | fixed | url = `http://fhir.de/StructureDefinition/lebensphase`; *KDS_lebensphase* |

## Case identification — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Case identifier** `at0001` | direct |  |

## Anatomical location — CLUSTER.anatomical_location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….text` | **Body site name** `at0001` | direct | only if FHIR `coding` is empty |
| `…` | **Body site name** `at0001` | direct | only if openEHR `items[at0001]` type `DV_CODED_TEXT` |
| `….value (Coding)` | **Laterality** `at0002` | direct | only if FHIR `` type `Extension`; *KDS_anatomical_location* |

## Diagnose — COMPOSITION.report.v1.Condition

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
