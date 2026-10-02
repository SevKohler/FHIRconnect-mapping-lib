# KDS/laborbericht

openEHR template **KDS_Laborbericht** ↔ FHIR profile **DiagnosticReportLab** (DiagnosticReport), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-labor/StructureDefinition/DiagnosticReportLab>

Both directions unless a row says otherwise. Starts at `OBSERVATION.laboratory_test_result.v1`; context file `KDS_laborbericht.context.yaml`.

## Resources

- Template: [`KDS_Laborbericht.opt`](../resources/openehr/templates/KDS_Laborbericht.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.laborbefund#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.laborbefund#2025.0.0)
- Examples: [`../resources/examples/laborbericht`](../resources/examples/laborbericht): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-CLUSTER.laboratory_test_analyte.v1` | Laboranalyt-Ergebnis | [`CLUSTER.laboratory_test_analyte.v1`](../../../../model/cluster/org.openehr/laboratory_test_analyte.v1.yml) | – |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Fallidentifikation | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-CLUSTER.specimen.v1` | Probe | [`CLUSTER.specimen.v1`](../../../../model/cluster/org.openehr/specimen.v1.yml) | – |
| `openEHR-EHR-OBSERVATION.laboratory_test_result.v1` | Laborergebnis | [`OBSERVATION.laboratory_test_result.v1`](../../../../model/observation/org.openehr/laboratory_test_result.v1.yml) | [`KDS_laborbericht`](KDS_laborbericht.yml) |
| `openEHR-EHR-COMPOSITION.report-result.v1` | Bericht | [`COMPOSITION.report_result.v1.DiagnosticReport`](../../../../model/composition/org.openehr/report_result.v1.DiagnosticReport.yml) | [`KDS_composition.DiagnosticReport`](KDS_composition.yml) |

## Laborergebnis — OBSERVATION.laboratory_test_result.v1

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
| `DiagnosticReport` | **Jedes Ereignis** `at0002` | direct |  |
| `DiagnosticReport.category.coding` |  | fixed | system = `http://loinc.org`, code = `26436-6`, text = `laboratory` |
| `DiagnosticReport.category.coding` |  | fixed | system = `http://terminology.hl7.org/CodeSystem/v2-0074`, code = `LAB`, text = `laboratory` |
| `DiagnosticReport.category.text` |  | fixed | $fhirRoot = `laboratory` |
| `DiagnosticReport.code` | **Labortest-Bezeichnung** `at0005` | direct |  |
| `DiagnosticReport` | **Tree** `at0073` | value table | `registered` ↔ registered (at0107)<br>`partial` ↔ partial (at0037)<br>`preliminary` ↔ preliminary (at0120)<br>`final` ↔ final (at0038)<br>`amended` ↔ amended (at0040)<br>`corrected` ↔ corrected (at0115)<br>`appended` ↔ appended (at0119)<br>`cancelled` ↔ cancelled (at0074)<br>`entered-in-error` ↔ entered-in-error (at0116)<br>`unknown` ↔ unknown (253) |
| `DiagnosticReport.conclusion` | **Schlussfolgerung** `at0057` | direct |  |
| `DiagnosticReport.issued` | **Jedes Ereignis** `at0002` | direct |  |
| `DiagnosticReport.specimen` | *(the referenced resource)* | reference → Specimen |  |
| `DiagnosticReport.specimen` | OBSERVATION.laboratory_test_result.v1 | → table **CLUSTER.specimen.v1** |  |
| `DiagnosticReport.basedOn (Reference).identifier` | **Auftrags-ID (Empfänger)** `at0063` | direct |  |
| `DiagnosticReport.basedOn (Reference)` | **Auftrags-ID (Empfänger)** `at0063` | LINK to the based on composition |  |
| `DiagnosticReport.result` | *(the referenced resource)* | reference → Observation | *KDS_laborbericht* |
| `DiagnosticReport.result` | OBSERVATION.laboratory_test_result.v1 | → table **CLUSTER.laboratory_test_analyte.v1** | *KDS_laborbericht* |
| `DiagnosticReport.effective` | **Jedes Ereignis** `at0002` | direct |  |
| `DiagnosticReport` | composition | → table **COMPOSITION.report_result.v1.DiagnosticReport** | *KDS_laborbericht* |
| `DiagnosticReport.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-labor/StructureDefinition/DiagnosticReportLab`; openEHR → FHIR only; *KDS_laborbericht* |
| `DiagnosticReport.status` | composition · `context/other_context[at0001]/items[at0005]` | direct | *KDS_laborbericht* |

## Laboranalyt-Ergebnis — CLUSTER.laboratory_test_analyte.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Ergebnis-Status** `at0005` | value table | `registered` ↔ Registered (at0015)<br>`preliminary` ↔ Preliminary (at0017)<br>`final` ↔ Final (at0018)<br>`amended` ↔ Amended (at0020)<br>`corrected` ↔ Corrected (at0019)<br>`appended` ↔ Appended (at0021)<br>`cancelled` ↔ Cancelled (at0023)<br>`entered-in-error` ↔ entered-in-error (at0022) |
| `….issued` | **Zeitpunkt Ergebnis-Status** `at0006` | direct |  |
| `….value` | **Analyt-Ergebnis** `at0001` | direct |  |
| `….code` | **Bezeichnung des Analyts** `at0024` | direct |  |
| `….interpretation` | **Referenzbereichs-Hinweise** `at0004` | direct |  |
| `….method` | **Testmethode** `at0028` | direct |  |
| `….specimen` | *(the referenced resource)* | reference → Specimen | only if openEHR `links` is not empty |
| `….specimen` | `links` *(RM attribute)* | LINK to the specimen composition |  |
| `….note.text` | **Kommentar** `at0003` | direct |  |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Fall-Kennung** `at0001` | direct |  |

## Probe — CLUSTER.specimen.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….identifier` | **Externer Identifikator** `at0088` | direct |  |
| `….collection.collected (DateTime)` | **Zeitpunkt der Probenentnahme** `at0015` | direct | only if openEHR `items[at0015]` type `DV_DATE_TIME` |
| `….collection.collected (Period)` | **Zeitpunkt der Probenentnahme** `at0015` | direct | only if openEHR `items[at0015]` type `DV_INTERVAL` |
| `….collection.collector (Reference).identifier` | **Identifikator des Probenehmers** `at0070` | direct |  |
| `….collection.method` | **Probenentnahmemethode** `at0007` | direct |  |
| `….collection.bodySite` | **Probenentnahmestelle** `at0087` | direct |  |
| `….collection.fastingStatus (CodeableConcept)` | **Probenentahmebedingung** `at0008` | direct |  |
| `….type` | **Probenart** `at0029` | direct |  |
| `….note.text` | **Kommentar** `at0045` | direct |  |
| `….condition` | **Beschreibung der Probe** `at0097` | direct |  |
| `….accessionIdentifier` | **Laborprobenidentifikator** `at0001` | direct |  |
| `….receivedTime` | **Zeitpunkt des Probeneingangs** `at0034` | direct |  |
| `….parent (Reference).identifier.value` | **Identifikator der übergeordneten Probe** `at0003` | direct |  |
| `….parent` | **Identifikator der übergeordneten Probe** `at0003` | direct |  |
| `….parent` | *(the referenced resource)* | reference → Specimen | only if openEHR `links` is not empty |
| `….parent` | `links` *(RM attribute)* | LINK to the parent composition |  |
| `…` | **Eignung zur Analyse** `at0041` | value table | `available` ↔ Satisfactory (at0062)<br>`unavailable` ↔ Unsatisfactory - not analysed (at0064)<br>`unsatisfactory` ↔ Unsatisfactory - not analysed (at0064); only if FHIR `status` not of `entered-in-error` |

## Bericht — COMPOSITION.report_result.v1.DiagnosticReport

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….performer` | composition · `context/health_care_facility` | direct |  |
| `….resultsInterpreter` |  | fixed | openEHR function = `result interpreter` |
| `….resultsInterpreter` | `performer` *(RM attribute)* | direct |  |
| `….performer` | composition · composer | direct |  |
| `….performer` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `performer` is empty |
| `….performer` | composition · `perfomer` | direct |  |
| `….effective (Period)` | *(the referenced resource)* | direct |  |
| `….effective (Period).end` | *(the referenced resource)* | direct |  |
| `….effective (Period).start` | *(the referenced resource)* | direct |  |
| `….effective (DateTimeType)` | composition · start time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….encounter (Reference).identifier` | CLUSTER.case_identification.v0 | → table **CLUSTER.case_identification.v0** | *KDS_composition.DiagnosticReport* |
| `….encounter` | *(the referenced resource)* | reference → Encounter | *KDS_composition.DiagnosticReport* |
| `….encounter.identifier` | CLUSTER.case_identification.v0 | → table **CLUSTER.case_identification.v0** | *KDS_composition.DiagnosticReport* |
| `….encounter` | CLUSTER.case_identification.v0 · `links` *(RM attribute)* | LINK to the case composition | *KDS_composition.DiagnosticReport* |
| `….identifier` | composition · `context/other_context[at0001]/items[at0002]` | direct | only if FHIR `type.coding.code` one of `FILL`; *KDS_composition.DiagnosticReport* |
| `….identifier.type.coding` | composition · `context/other_context[at0001]/items[at0002]` | fixed | system = `http://terminology.hl7.org/CodeSystem/v2-0203`, code = `FILL`; *KDS_composition.DiagnosticReport* |
| `….identifier.value` | composition · `context/other_context[at0001]/items[at0002]` | direct | *KDS_composition.DiagnosticReport* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
