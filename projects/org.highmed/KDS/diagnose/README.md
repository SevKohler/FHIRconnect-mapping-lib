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
| [`Condition.recordedDate`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#contextStartTime "EVALUATION.problem_diagnosis.v1#contextStartTime") | [composition · start time](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#contextStartTime "EVALUATION.problem_diagnosis.v1#contextStartTime") | direct |  |
| [`Condition.asserter`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#participationFunction "EVALUATION.problem_diagnosis.v1#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`Condition.recorder`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#composer "EVALUATION.problem_diagnosis.v1#composer") | [composition · composer](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#composer "EVALUATION.problem_diagnosis.v1#composer") | direct |  |
| [`Condition.recorder`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#provider "EVALUATION.problem_diagnosis.v1#provider") | [`provider` *(RM attribute)*](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#provider "EVALUATION.problem_diagnosis.v1#provider") | direct |  |
| [`Condition.code`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#problemDiagnose "EVALUATION.problem_diagnosis.v1#problemDiagnose") | [**Kodierte Diagnose** `at0002`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#problemDiagnose "EVALUATION.problem_diagnosis.v1#problemDiagnose") | direct |  |
| [`Condition.code.coding`](KDS_problem_diagnose.yml#codingSystem "KDS_problem_diagnose#codingSystem") |  | fixed | system = `http://fhir.de/CodeSystem/bfarm/icd-10-gm`; *KDS_problem_diagnose* |
| [`Condition.code.coding.extension.value`](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | [**Diagnosesicherheit** `at0073`](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | direct | *KDS_problem_diagnose* |
| [`Condition.code.coding.extension.value`](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | [**Diagnosesicherheit** `at0073`](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | direct | FHIR → openEHR only; *KDS_problem_diagnose* |
| [`Condition.code.coding.extension`](KDS_problem_diagnose.yml#extensionUrl "KDS_problem_diagnose#extensionUrl") |  | fixed | url = `http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit`; *KDS_problem_diagnose* |
| [`Condition.code.coding.extension`](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | [CLUSTER.multiple_coding_icd10gm.v1](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | → table **CLUSTER.multiple_coding_icd10gm.v1** | *KDS_problem_diagnose* |
| [`Condition.code.coding.extension`](KDS_problem_diagnose.yml#extensionUrl "KDS_problem_diagnose#extensionUrl") |  | fixed | url = `http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen`; *KDS_problem_diagnose* |
| [`Condition.code.coding.extension`](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | [CLUSTER.anatomical_location.v1](KDS_problem_diagnose.yml#extensionValue "KDS_problem_diagnose#extensionValue") | → table **CLUSTER.anatomical_location.v1** | *KDS_problem_diagnose* |
| [`Condition.code.coding.extension`](KDS_problem_diagnose.yml#extension "KDS_problem_diagnose#extension") |  | fixed | url = `http://fhir.de/StructureDefinition/seitenlokalisation`; *KDS_problem_diagnose* |
| [`Condition.note.text`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#note "EVALUATION.problem_diagnosis.v1#note") | [**Diagnoseerläuterung** `at0069`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#note "EVALUATION.problem_diagnosis.v1#note") | direct |  |
| [`Condition.onset (Period)`](KDS_problem_diagnose.yml#lebensphaseCluster "KDS_problem_diagnose#lebensphaseCluster") | [CLUSTER.lebensphase.v0](KDS_problem_diagnose.yml#lebensphaseCluster "KDS_problem_diagnose#lebensphaseCluster") | → table **CLUSTER.lebensphase.v0** | *KDS_problem_diagnose* |
| [`Condition.onset (Period).start`](KDS_problem_diagnose.yml#start "KDS_problem_diagnose#start") | [**Klinisch relevanter Zeitraum (Zeitpunkt des Auftretens)** `at0077`](KDS_problem_diagnose.yml#start "KDS_problem_diagnose#start") | direct | *KDS_problem_diagnose* |
| [`Condition.onset (DateTime)`](KDS_problem_diagnose.yml#dateTime "KDS_problem_diagnose#dateTime") | [**Klinisch relevanter Zeitraum (Zeitpunkt des Auftretens)** `at0077`](KDS_problem_diagnose.yml#dateTime "KDS_problem_diagnose#dateTime") | direct | only if openEHR `items[openEHR-EHR-CLUSTER.lebensphase.v0]/items[at0001], items[openEHR-EHR-CLUSTER.lebensphase.v0]/items[at0002]` is empty; *KDS_problem_diagnose* |
| [`Condition.bodySite`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySite "EVALUATION.problem_diagnosis.v1#bodySite") | [`data[at0012]` *(not in this template)*](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySite "EVALUATION.problem_diagnosis.v1#bodySite") | direct |  |
| [`Condition.bodySite`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySiteCluster "EVALUATION.problem_diagnosis.v1#bodySiteCluster") | [CLUSTER.anatomical_location.v1](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySiteCluster "EVALUATION.problem_diagnosis.v1#bodySiteCluster") | → table **CLUSTER.anatomical_location.v1** |  |
| [`Condition.severity`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#severity "EVALUATION.problem_diagnosis.v1#severity") | [**Severity** `at0005`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#severity "EVALUATION.problem_diagnosis.v1#severity") | direct |  |
| [`Condition`](KDS_problem_diagnose.yml#compositionMapping "KDS_problem_diagnose#compositionMapping") | [composition](KDS_problem_diagnose.yml#compositionMapping "KDS_problem_diagnose#compositionMapping") | → table **COMPOSITION.report.v1.Condition** | *KDS_problem_diagnose* |
| [`Condition.extension`](KDS_problem_diagnose.yml#date "KDS_problem_diagnose#date") | [**Feststellungsdatum** `at0003`](KDS_problem_diagnose.yml#date "KDS_problem_diagnose#date") | direct | extension `condition-assertedDate`; *KDS_problem_diagnose* |
| [`Condition.extension.value (DateTime)`](KDS_problem_diagnose.yml#date "KDS_problem_diagnose#date") | [**Feststellungsdatum** `at0003`](KDS_problem_diagnose.yml#date "KDS_problem_diagnose#date") | direct | *KDS_problem_diagnose* |
| [`Condition.extension`](KDS_problem_diagnose.yml#staticURL "KDS_problem_diagnose#staticURL") | [**Feststellungsdatum** `at0003`](KDS_problem_diagnose.yml#staticURL "KDS_problem_diagnose#staticURL") | fixed | url = `http://hl7.org/fhir/StructureDefinition/condition-assertedDate`; *KDS_problem_diagnose* |
| [`Condition.meta`](KDS_problem_diagnose.yml#metaURL "KDS_problem_diagnose#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose`; openEHR → FHIR only; *KDS_problem_diagnose* |
| [`Condition`](KDS_problem_diagnose.yml#problemQualifier "KDS_problem_diagnose#problemQualifier") | [CLUSTER.problem_qualifier.v2](KDS_problem_diagnose.yml#problemQualifier "KDS_problem_diagnose#problemQualifier") | → table **CLUSTER.problem_qualifier.v2** | *KDS_problem_diagnose* |
| [`Condition.extension`](KDS_problem_diagnose.yml#extensionUrl "KDS_problem_diagnose#extensionUrl") |  | fixed | url = `http://hl7.org/fhir/StructureDefinition/condition-related`; *KDS_problem_diagnose* |
| [`Condition.extension.value`](KDS_problem_diagnose.yml#referencedCondition "KDS_problem_diagnose#referencedCondition") | [*(the referenced resource)*](KDS_problem_diagnose.yml#referencedCondition "KDS_problem_diagnose#referencedCondition") | reference → Condition | *KDS_problem_diagnose* |
| [`Condition.extension.value`](KDS_problem_diagnose.yml#primaryDiagnose "KDS_problem_diagnose#primaryDiagnose") | [EVALUATION.problem_diagnosis.v1](KDS_problem_diagnose.yml#primaryDiagnose "KDS_problem_diagnose#primaryDiagnose") | → table **EVALUATION.problem_diagnosis.v1** | only if openEHR `data[at0001]/items[openEHR-EHR-CLUSTER.problem_qualifier.v2]/items[at0063]/defining_code/code_string` one of `at0064`; *KDS_problem_diagnose* |

## Multiple_coding_ICD-10-GM — CLUSTER.multiple_coding_icd10gm.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….value (Coding)`](../../../../model/cluster/org.highmed/multiple_coding_icd10gm.v1.yml#mehrfachcodierung "CLUSTER.multiple_coding_icd10gm.v1#mehrfachcodierung") | [**Multiple coding identifier** `at0001`](../../../../model/cluster/org.highmed/multiple_coding_icd10gm.v1.yml#mehrfachcodierung "CLUSTER.multiple_coding_icd10gm.v1#mehrfachcodierung") | value table | `*` ↔ * (at0003)<br>`†` ↔ † (at0002)<br>`!` ↔ ! (at0004) |

## Klinischer Status — CLUSTER.problem_qualifier.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….verificationStatus.coding`](../../../../model/cluster/org.openehr/problem_qualifier.v2.yml#statusCoded "CLUSTER.problem_qualifier.v2#statusCoded") | [**Diagnostic status** `at0004`](../../../../model/cluster/org.openehr/problem_qualifier.v2.yml#statusCoded "CLUSTER.problem_qualifier.v2#statusCoded") | value table | `provisional` ↔ Working (at0017)<br>`differential` ↔ Working (at0017)<br>`unconfirmed` ↔ Preliminary (at0016)<br>`confirmed` ↔ Established (at0018)<br>`refuted` ↔ Refuted (at0088); only if FHIR `coding.code` not of `entered-in-error` |
| [`….clinicalStatus`](KDS_problem_qualifier.yml#clinicalStatus "KDS_problem_qualifier#clinicalStatus") | [**Klinischer Status** `at0003`](KDS_problem_qualifier.yml#clinicalStatus "KDS_problem_qualifier#clinicalStatus") | direct | *KDS_problem_qualifier* |
| `` | [**Diagnoserolle** `at0063`](KDS_problem_qualifier.yml#referenzPrimaerdiagnose "KDS_problem_qualifier#referenzPrimaerdiagnose") | fixed | openEHR defining_code/terminology_id = `local`, defining_code/code_string = `at0064`, value = `Hauptdiagnose`; only if FHIR `extension.url` not of `http://hl7.org/fhir/StructureDefinition/condition-related`; *KDS_problem_qualifier* |
| `` | [**Diagnoserolle** `at0063`](KDS_problem_qualifier.yml#referenzNebendiagnose "KDS_problem_qualifier#referenzNebendiagnose") | fixed | openEHR defining_code/terminology_id = `local`, defining_code/code_string = `at0066`, value = `Nebendiagnose`; only if FHIR `extension.url` one of `http://hl7.org/fhir/StructureDefinition/condition-related`; *KDS_problem_qualifier* |

## Lebensphase — CLUSTER.lebensphase.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….start.extension`](KDS_lebensphase.yml#periodOnsetStart "KDS_lebensphase#periodOnsetStart") | [**Beginn** `at0001`](KDS_lebensphase.yml#periodOnsetStart "KDS_lebensphase#periodOnsetStart") | direct | extension `lebensphase`; *KDS_lebensphase* |
| [`….start.extension`](KDS_lebensphase.yml#extension "KDS_lebensphase#extension") | [**Beginn** `at0001`](KDS_lebensphase.yml#extension "KDS_lebensphase#extension") | fixed | url = `http://fhir.de/StructureDefinition/lebensphase`; *KDS_lebensphase* |
| [`….end.extension`](KDS_lebensphase.yml#periodOnsetEnd "KDS_lebensphase#periodOnsetEnd") | [**Ende** `at0002`](KDS_lebensphase.yml#periodOnsetEnd "KDS_lebensphase#periodOnsetEnd") | direct | extension `lebensphase`; *KDS_lebensphase* |
| [`….end.extension`](KDS_lebensphase.yml#extension "KDS_lebensphase#extension") | [**Ende** `at0002`](KDS_lebensphase.yml#extension "KDS_lebensphase#extension") | fixed | url = `http://fhir.de/StructureDefinition/lebensphase`; *KDS_lebensphase* |

## Case identification — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | [**Case identifier** `at0001`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | direct |  |

## Anatomical location — CLUSTER.anatomical_location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….text`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteText "CLUSTER.anatomical_location.v1#bodySiteText") | [**Body site name** `at0001`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteText "CLUSTER.anatomical_location.v1#bodySiteText") | direct | only if FHIR `coding` is empty |
| [`…`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteCoded "CLUSTER.anatomical_location.v1#bodySiteCoded") | [**Body site name** `at0001`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteCoded "CLUSTER.anatomical_location.v1#bodySiteCoded") | direct | only if openEHR `items[at0001]` type `DV_CODED_TEXT` |
| [`….value (Coding)`](KDS_anatomical_location.yml#seitenlokalisation "KDS_anatomical_location#seitenlokalisation") | [**Laterality** `at0002`](KDS_anatomical_location.yml#seitenlokalisation "KDS_anatomical_location#seitenlokalisation") | direct | only if FHIR `` type `Extension`; *KDS_anatomical_location* |

## Diagnose — COMPOSITION.report.v1.Condition

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

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
