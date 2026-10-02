# KDS/medikationsverabreichung

openEHR template **KDS_Medikamentenverabreichungen** ↔ FHIR profile **MedicationAdministration** (MedicationAdministration), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationAdministration>

Both directions unless a row says otherwise. Starts at `ACTION.medication.v1`; context file `KDS_medikationsverabreichung.context.yaml`.

## Resources

- Template: [`KDS_Medikamentenverabreichungen.opt`](../resources/openehr/templates/KDS_Medikamentenverabreichungen.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.medikation#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.medikation#2025.0.0)
- Examples: [`../resources/examples/medikationsverabreichung`](../resources/examples/medikationsverabreichung): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-ACTION.medication.v1` | Arzneimittelanwendung | [`ACTION.medication.v1`](../../../../model/action/org.openehr/medication.v1.yml) | [`KDS_medikamentenverabreichung`](KDS_medikamentenverabreichung.yml) |
| `openEHR-EHR-CLUSTER.medication.v2` | Wirkstoff | [`CLUSTER.medication.v2`](../../../../model/cluster/org.openehr/medication.v2.yml) | – |
| `openEHR-EHR-CLUSTER.dosage.v2` | Dosierung | [`CLUSTER.dosage.v2.BackboneElement`](../../../../model/cluster/org.openehr/dosage.v2.BackboneElement.yml) | – |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Fallidentifikation | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-CLUSTER.medication.v2` | Wirkstoff | [`CLUSTER.medication.v2.substance`](../../../../model/cluster/org.openehr/medication.v2.substance.yml) | [`KDS_medication.v2.substance`](KDS_medication_substance.yml) |
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Medikamentenverabreichungen | [`COMPOSITION.report.v1.MedicationAdministration`](../../../../model/composition/org.openehr/report.v1.MedicationAdministration.yml) | [`KDS_composition.MedicationAdministration`](KDS_composition.yml) |

## Arzneimittelanwendung — ACTION.medication.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `MedicationAdministration.effective (Period).start` | `time` *(RM attribute)* | direct | FHIR → openEHR only |
| `MedicationAdministration.effective (DateTime)` | `time` *(RM attribute)* | direct |  |
| `MedicationAdministration.actor.performer` | `provider` *(RM attribute)* | direct |  |
| `MedicationAdministration.note.text` | **Kommentar** `at0024` | direct |  |
| `MedicationAdministration.dosage` | CLUSTER.dosage.v2 | → table **CLUSTER.dosage.v2.BackboneElement** |  |
| `MedicationAdministration.dosage.route` | **Verabreichungsweg** `at0147` | direct |  |
| `MedicationAdministration.dosage.site` | **Körperstelle** `at0141` | direct |  |
| `MedicationAdministration.dosage.method` | **Methode der Verabreichung** `at0143` | direct |  |
| `MedicationAdministration.medication` | *(the referenced resource)* | reference → Medication |  |
| `MedicationAdministration.medication` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2** |  |
| `MedicationAdministration.medication (CodeableConcept).coding` | CLUSTER.medication.v2 · **Arzneimittel-Name** `at0132` | direct | only if openEHR `/items[at0071], /items[at0142], /items[at0153], /items[at0153], /items[at0157], /items[at0115], /items[at0151], /items[at0150], /items[at0003], /items[at0003], /items[at0138], /items[at0139], /items[at0148], /items[at0127], /items[at0133], /items[at0141]` is empty; *KDS_medikamentenverabreichung* |
| `MedicationAdministration.reasonCode.coding.display` | **Klinische Indikation** `at0156` | direct | *KDS_medikamentenverabreichung* |
| `MedicationAdministration.partOf` | `links` *(RM attribute)* | LINK to the partOf composition |  |
| `MedicationAdministration.request` | **ID der Verordnung** `at0103` | direct |  |
| `MedicationAdministration.request` | *(the referenced resource)* | reference → MedicationRequest | only if openEHR `links` is not empty |
| `MedicationAdministration.request` | `links` *(RM attribute)* | LINK to the medicationRequest composition |  |
| `MedicationAdministration` | `ism_transition/current_state` *(RM attribute)* | value table | `in-progress` ↔ Active (245)<br>`not-done` ↔ Cancelled (528)<br>`on-hold` ↔ Suspended (530)<br>`completed` ↔ Completed (532)<br>`entered-in-error` ↔ Cancelled (528)<br>`stopped` ↔ Aborted (531); FHIR → openEHR only |
| `MedicationAdministration` | `ism_transition/current_state` *(RM attribute)* | value table | `in-progress` ↔ Active (245)<br>`on-hold` ↔ Suspended (530)<br>`stopped` ↔ Aborted (531)<br>`completed` ↔ Completed (532)<br>`not-done` ↔ Cancelled (528)<br>`unknown` ↔ Initial (524)<br>`unknown` ↔ Planned (526)<br>`unknown` ↔ Postponed (527)<br>`unknown` ↔ Scheduled (529)<br>`unknown` ↔ Expired (533); openEHR → FHIR only |
| `MedicationAdministration` | composition | → table **COMPOSITION.report.v1.MedicationAdministration** | *KDS_medikamentenverabreichung* |
| `MedicationAdministration.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationAdministration`; openEHR → FHIR only; *KDS_medikamentenverabreichung* |

## Wirkstoff — CLUSTER.medication.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….code` | **Arzneimittel-Name** `at0132` | direct |  |
| `….form` | **Darreichungsform** `at0071` | direct |  |
| `….amount` | **Wirkstärke (Konzentration)** `at0115` | direct |  |
| `….batch.lotNumber` | `items[at0150]` *(not in this template)* | direct |  |
| `….batch.expirationDate` | `items[at0003]` *(not in this template)* | direct |  |
| `….ingredient.item (CodeableConcept).text` | **Arzneimittel-Name** `at0132` | direct |  |
| `….ingredient.item (CodeableConcept).coding` | **Wirkstofftyp** `at0142` | direct |  |
| `….ingredient.item` | *(the referenced resource)* | reference → Medication |  |
| `….ingredient.item` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2** |  |
| `….ingredient.item` | *(the referenced resource)* | reference → Substance | FHIR → openEHR only |
| `….ingredient.item` | *(the referenced resource)* | → table **CLUSTER.medication.v2.substance** |  |
| `….ingredient.strength` | **Wirkstoffmenge** `at0152` | direct |  |
| `….ingredient.strength.numerator` | **Zähler** `at0153` | direct |  |
| `….ingredient.strength.denominator` | **Nenner** `at0157` | direct |  |
| `….ingredient.extension.value` | **Wirkstofftyp** `at0142` | direct | *KDS_medication.v3* |
| `….ingredient.extension` |  | fixed | url = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/wirkstofftyp`; *KDS_medication.v3* |
| `….ingredient.extension` |  | fixed | url = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/wirkstoffrelation`; *KDS_medication.v3* |
| `….ingredient.extension.extension` |  | fixed | url = `ingredientReference`; *KDS_medication.v3* |
| `….ingredient.extension.extension.extension.value` | *(the referenced resource)* | reference → Medication | *KDS_medication.v3* |
| `….ingredient.extension.extension.extension.value` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2** | *KDS_medication.v3* |
| `….ingredient.extension.extension.extension.value` | *(the referenced resource)* | reference → Substance | *KDS_medication.v3* |
| `….ingredient.extension.extension.extension.value` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2.substance** | *KDS_medication.v3* |
| `….ingredient.extension.extension` |  | fixed | url = `ingredientUri`; *KDS_medication.v3* |
| `….ingredient.extension.extension.value` | **Arzneimittel-Name** `at0132` | direct | *KDS_medication.v3* |

## Dosierung — CLUSTER.dosage.v2.BackboneElement

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….dose` | **Dosis** `at0144` | direct |  |
| `….text` | **Dosierung Freitext** `at0178` | direct |  |
| `….rate (Quantity)` | **Verabreichungsrate** `at0134` | direct | only if openEHR `items[at0134]` type `DV_QUANTITY` |
| `….rate (Ratio)` | CLUSTER.dosage.v2 | engine code `ratio_to_dosage_action` | only if openEHR `items[at0102]` is not empty |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Fall-Kennung** `at0001` | direct |  |

## Wirkstoff — CLUSTER.medication.v2.substance

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….code.coding.display` | **Arzneimittel-Name** `at0132` | direct | *KDS_medication.v2.substance* |
| `….ingredient.substance (CodeableConcept).text` | **Arzneimittel-Name** `at0132` | direct |  |
| `….ingredient.substance (CodeableConcept).coding` | **Wirkstofftyp** `at0142` | direct |  |
| `….ingredient.substance` | *(the referenced resource)* | reference → Substance |  |
| `….ingredient.substance` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2.substance** |  |
| `….ingredient.quantity` | **Wirkstoffmenge** `at0152` | direct |  |
| `….ingredient.quantity.numerator` | **Zähler** `at0153` | direct |  |
| `….ingredient.quantity.denominator` | **Nenner** `at0157` | direct |  |
| `….instance.quantity` | **Wirkstärke (Konzentration)** `at0115` | direct |  |

## KDS_Medikamentenverabreichungen — COMPOSITION.report.v1.MedicationAdministration

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….request.requester` | composition · `context/health_care_facility` | direct |  |
| `…` |  | fixed | status = `final`; only if openEHR `items[at0005]` is empty; *KDS_composition.MedicationAdministration* |
| `….performer.actor` | composition · composer | direct |  |
| `….performer.actor` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `request.performer.actor` is empty |
| `….effective (Period)` | composition | direct | only if openEHR `end_time` is not empty |
| `….effective (Period).end` | composition · end time | direct |  |
| `….effective (Period).start` | composition · start time | direct |  |
| `….effective (DateTime)` | composition · start time | direct | FHIR → openEHR only |
| `…` | composition · start time | fixed | openEHR _null_flavour/value = `no information`, _null_flavour/defining_code/terminology_id = `openehr`, _null_flavour/defining_code/code_string = `271` |
| `….category.coding` | composition · `context/setting` | value table | `outpatient` ↔ primary medical care (228)<br>`inpatient` ↔ secondary medical care (232)<br>`community` ↔ Community (238) |
| `….category.coding` | composition | fixed | extension.url = `http://hl7.org/fhir/StructureDefinition/data-absent-reason`, extension.code = `unsupported`; only if openEHR `context` is empty |
| `….identifier` | composition · `context/other_context[at0001]/items[at0002]` | direct | *KDS_composition.MedicationAdministration* |
| `….status` | composition · `context/other_context[at0001]/items[at0005]` | direct | *KDS_composition.MedicationAdministration* |
| `….context (Reference).identifier` | CLUSTER.case_identification.v0 | → table **CLUSTER.case_identification.v0** | *KDS_composition.MedicationAdministration* |
| `….context` | *(the referenced resource)* | reference → Encounter | *KDS_composition.MedicationAdministration* |
| `….context.identifier` | CLUSTER.case_identification.v0 | → table **CLUSTER.case_identification.v0** | *KDS_composition.MedicationAdministration* |
| `….context` | CLUSTER.case_identification.v0 · `links` *(RM attribute)* | LINK to the case composition | *KDS_composition.MedicationAdministration* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
