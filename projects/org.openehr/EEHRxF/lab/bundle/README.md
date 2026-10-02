# EEHRxF/lab/bundle

openEHR template **EHDS - Laboratory report** ↔ FHIR profile **DiagnosticReport-eu-lab** (DiagnosticReport), version 0.1.1.

Profile: <http://hl7.eu/fhir/laboratory/StructureDefinition/DiagnosticReport-eu-lab>

Both directions unless a row says otherwise. Starts at `OBSERVATION.laboratory_test_result.v1`; context file `lab.context.yml`.

## Resources

- Template: [`EHDS - Laboratory report.opt`](../resources/openehr/templates/EHDS - Laboratory report.opt)
- Profile package: *not under resources/*

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-CLUSTER.laboratory_test_analyte.v1` | Laboratory analyte result | [`CLUSTER.laboratory_test_analyte.v1`](../../../../../model/cluster/org.openehr/laboratory_test_analyte.v1.yml) | [`eehrxf_lab_analyte`](lab_analyte.yml) |
| `openEHR-EHR-CLUSTER.specimen.v1` | Specimen | [`CLUSTER.specimen.v1`](../../../../../model/cluster/org.openehr/specimen.v1.yml) | – |
| `openEHR-EHR-OBSERVATION.laboratory_test_result.v1` | Laboratory test result | [`OBSERVATION.laboratory_test_result.v1`](../../../../../model/observation/org.openehr/laboratory_test_result.v1.yml) | [`eehrxf_lab_result`](lab_result.yml) |
| `COMPOSITION.report-result.v1.DiagnosticReport` | *not in template* | `COMPOSITION.report-result.v1.DiagnosticReport` *(not found)* | – |

## Laboratory test result — OBSERVATION.laboratory_test_result.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `DiagnosticReport.performer` | composition · `context/health_care_facility` | direct |  |
| `DiagnosticReport.resultsInterpreter` |  | fixed | openEHR function = `result interpreter` |
| `DiagnosticReport.performer` | composition · composer | direct |  |
| `DiagnosticReport.performer` | composition · `perfomer` | direct |  |
| `DiagnosticReport.effective (Period)` | composition | direct | FHIR → openEHR only |
| `DiagnosticReport.effective (Period).end` | composition · end time | direct |  |
| `DiagnosticReport.effective (Period).start` | composition · start time | direct |  |
| `DiagnosticReport.effective (DateTime)` | composition · start time | direct | FHIR → openEHR only |
| `DiagnosticReport.issued` | composition · start time | direct | openEHR → FHIR only |
| `DiagnosticReport` | **Any event** `at0002` | direct |  |
| `DiagnosticReport.category.coding` |  | fixed | system = `http://loinc.org`, code = `26436-6`, text = `laboratory` |
| `DiagnosticReport.category.coding` |  | fixed | system = `http://terminology.hl7.org/CodeSystem/v2-0074`, code = `LAB`, text = `laboratory` |
| `DiagnosticReport.category.text` |  | fixed | $fhirRoot = `laboratory` |
| `DiagnosticReport.code` | **Requested test** `at0005` | direct |  |
| `DiagnosticReport` | **Overall test status** `at0073` | value table | `registered` ↔ registered (at0107)<br>`partial` ↔ partial (at0037)<br>`preliminary` ↔ preliminary (at0120)<br>`final` ↔ final (at0038)<br>`amended` ↔ amended (at0040)<br>`corrected` ↔ corrected (at0115)<br>`appended` ↔ appended (at0119)<br>`cancelled` ↔ cancelled (at0074)<br>`entered-in-error` ↔ entered-in-error (at0116)<br>`unknown` ↔ unknown (253) |
| `DiagnosticReport.conclusion` | **Conclusion** `at0057` | direct |  |
| `DiagnosticReport.issued` | **Any event** `at0002` | direct |  |
| `DiagnosticReport.specimen` | *(the referenced resource)* | reference → Specimen |  |
| `DiagnosticReport.specimen` | OBSERVATION.laboratory_test_result.v1 | → table **CLUSTER.specimen.v1** |  |
| `DiagnosticReport.basedOn (Reference).identifier` | **Filler order number** `at0063` | direct |  |
| `DiagnosticReport.basedOn (Reference)` | **Filler order number** `at0063` | LINK to the based on composition |  |
| `DiagnosticReport.result` | *(the referenced resource)* | reference → Observation | *KDS_laborbericht* |
| `DiagnosticReport.result` | OBSERVATION.laboratory_test_result.v1 | → table **CLUSTER.laboratory_test_analyte.v1** | *KDS_laborbericht* |
| `DiagnosticReport.result` | *(the referenced resource)* | reference → Observation | *eehrxf_lab_result* |
| `DiagnosticReport.result` | *(the referenced resource)* | → table **CLUSTER.laboratory_test_analyte.v1** | *eehrxf_lab_result* |
| `DiagnosticReport.effective (DateTimeType)` | **Any event** `at0002` | direct | *eehrxf_lab_result* |
| `DiagnosticReport` | composition | → table **COMPOSITION.report-result.v1.DiagnosticReport** | *eehrxf_lab_result* |
| `DiagnosticReport.status` | `data[at0003]/items[at0073]` *(not in this template)* | direct | *eehrxf_lab_result* |
| `code.coding` |  | fixed | openEHR coding.system = `http://loinc.org`, coding.code = `11502-2`, coding.display = `Laboratory report`; openEHR → FHIR only; *eehrxf_lab_result* |
| `code.coding` | *(the referenced resource)* | direct | only if FHIR `code` not of `11502-2`; *eehrxf_lab_result* |

## Laboratory analyte result — CLUSTER.laboratory_test_analyte.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Result status** `at0005` | value table | `registered` ↔ Registered (at0015)<br>`preliminary` ↔ Preliminary (at0017)<br>`final` ↔ Final (at0018)<br>`amended` ↔ Amended (at0020)<br>`corrected` ↔ Corrected (at0019)<br>`appended` ↔ Appended (at0021)<br>`cancelled` ↔ Cancelled (at0023)<br>`entered-in-error` ↔ entered-in-error (at0022) |
| `….issued` | **Result status time** `at0006` | direct |  |
| `….value` | **Analyte result** `at0001` | direct |  |
| `….code` | **Analyte name** `at0024` | direct |  |
| `….interpretation` | **Reference range guidance** `at0004` | direct |  |
| `….method` | `items[at0028]` *(not in this template)* | direct |  |
| `….specimen` | *(the referenced resource)* | reference → Specimen | only if openEHR `links` is not empty |
| `….specimen` | `links` *(RM attribute)* | LINK to the specimen composition |  |
| `….note.text` | **Comment** `at0003` | direct |  |
| `hasMember` | *(the referenced resource)* | reference → Observation | *eehrxf_lab_analyte* |
| `hasMember` | *(the referenced resource)* | → table **CLUSTER.laboratory_test_analyte.v1** | *eehrxf_lab_analyte* |

## Specimen — CLUSTER.specimen.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….identifier` | `items[at0088]` *(not in this template)* | direct |  |
| `….collection.collected (DateTime)` | **Collection date/time** `at0015` | direct | only if openEHR `items[at0015]` type `DV_DATE_TIME` |
| `….collection.collected (Period)` | **Collection date/time** `at0015` | direct | only if openEHR `items[at0015]` type `DV_INTERVAL` |
| `….collection.collector (Reference).identifier` | `items[at0070]` *(not in this template)* | direct |  |
| `….collection.method` | `items[at0007]` *(not in this template)* | direct |  |
| `….collection.bodySite` | `items[at0087]` *(not in this template)* | direct |  |
| `….collection.fastingStatus (CodeableConcept)` | `items[at0008]` *(not in this template)* | direct |  |
| `….type` | **Specimen type** `at0029` | direct |  |
| `….note.text` | `items[at0045]` *(not in this template)* | direct |  |
| `….condition` | `items[at0097]` *(not in this template)* | direct |  |
| `….accessionIdentifier` | `items[at0001]` *(not in this template)* | direct |  |
| `….receivedTime` | `items[at0034]` *(not in this template)* | direct |  |
| `….parent (Reference).identifier.value` | `items[at0003]` *(not in this template)* | direct |  |
| `….parent` | `items[at0003]` *(not in this template)* | direct |  |
| `….parent` | *(the referenced resource)* | reference → Specimen | only if openEHR `links` is not empty |
| `….parent` | `links` *(RM attribute)* | LINK to the parent composition |  |
| `…` | **Adequacy for testing** `at0041` | value table | `available` ↔ Satisfactory (at0062)<br>`unavailable` ↔ Unsatisfactory - not analysed (at0064)<br>`unsatisfactory` ↔ Unsatisfactory - not analysed (at0064); only if FHIR `status` not of `entered-in-error` |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
