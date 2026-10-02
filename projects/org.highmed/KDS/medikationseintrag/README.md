# KDS/medikationseintrag

openEHR template **KDS_Medikationseintrag** ↔ FHIR profile **MedicationStatement** (MedicationStatement), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationStatement>

Both directions unless a row says otherwise. Starts at `OBSERVATION.medication_statement.v0`; context file `KDS_medikationseintrag.context.yaml`.

## Resources

- Template: [`KDS_Medikationseintrag.opt`](../resources/openehr/templates/KDS_Medikationseintrag.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.medikation#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.medikation#2025.0.0)
- Examples: [`../resources/examples/medikationseintrag`](../resources/examples/medikationseintrag): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-OBSERVATION.medication_statement.v0` | Aussage zur Medikamenteneinnahme | [`OBSERVATION.medication_statement.v0`](../../../../model/observation/org.openehr/medication_statement.v0.yml) | [`KDS_medikamentenstatement`](KDS_medikationseintrag.yml) |
| `openEHR-EHR-CLUSTER.medication.v2` | Wirkstoffrelation | [`CLUSTER.medication.v2`](../../../../model/cluster/org.openehr/medication.v2.yml) | [`KDS_medication.v3`](KDS_medication.yml) |
| `openEHR-EHR-CLUSTER.medication.v2` | Wirkstoffrelation | [`CLUSTER.medication.v2.substance`](../../../../model/cluster/org.openehr/medication.v2.substance.yml) | – |
| `openEHR-EHR-CLUSTER.dosage.v2` | Dosierung | [`CLUSTER.dosage.v2`](../../../../model/cluster/org.openehr/dosage.v2.yml) | – |
| `openEHR-EHR-CLUSTER.entry_category.v0` | Kategorie des Eintrags | [`CLUSTER.entry_category.v0`](../../../../model/cluster/org.highmed/entry_category.v0.yml) | – |
| `openEHR-EHR-CLUSTER.identifier_fhir.v0` | Identifier | [`CLUSTER.identifier_fhir.v0`](../../../../model/cluster/org.highmed/identifier_fhir.v0.yml) | – |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Fallidentifikation | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-CLUSTER.timing_daily.v1` | Tägliche Dosierung | [`CLUSTER.timing_daily.v1`](../../../../model/cluster/org.openehr/timing_daily.v1.yml) | – |
| `openEHR-EHR-CLUSTER.timing_nondaily.v1` | Nicht tägliche Dosierung | [`CLUSTER.timing_nondaily.v1`](../../../../model/cluster/org.openehr/timing_non_daily.yml) | – |
| `openEHR-EHR-COMPOSITION.medication_list.v1` | Medikamentenliste | [`COMPOSITION.medication_list.v1.MedicationStatement`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml) | [`KDS_composition.MedicationStatement`](KDS_composition.yml) |

## Aussage zur Medikamenteneinnahme — OBSERVATION.medication_statement.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `MedicationStatement.informationSource` | `provider` *(RM attribute)* | direct |  |
| `MedicationStatement` | **Beliebiges Ereignis** `at0002` | direct |  |
| `MedicationStatement.reasonCode` | **Behandlungsgrund** `at0023` | direct |  |
| `MedicationStatement.note.text` | **Hinweis** `at0029` | direct |  |
| `MedicationStatement.dosage.route` | **Art der Verabreichung** `at0030` | direct |  |
| `MedicationStatement.dosage` | CLUSTER.dosage.v2 | → table **CLUSTER.dosage.v2** |  |
| `MedicationStatement.dosage.text` | **Tree** `at0033` | direct |  |
| `MedicationStatement.medication` | *(the referenced resource)* | reference → Medication |  |
| `MedicationStatement.medication` | *(the referenced resource)* | → table **CLUSTER.medication.v2** |  |
| `MedicationStatement.medication (CodeableConcept)` | CLUSTER.medication.v2 · **Arzneimittel-Name** `at0132` | direct | only if openEHR `items[at0071], items[at0115]` is empty |
| `MedicationStatement.medication (CodeableConcept)` | **Tree** `at0006` | direct | only if openEHR `items[at0132]` is empty |
| `MedicationStatement.reasonReference.resolve() (Condition).code` | **Behandlungsgrund** `at0023` | direct | FHIR → openEHR only |
| `MedicationStatement.reasonReference.resolve() (DiagnosticReport).code` | **Behandlungsgrund** `at0023` | direct | FHIR → openEHR only |
| `MedicationStatement.reasonReference.resolve() (Observation).code` | **Behandlungsgrund** `at0023` | direct | FHIR → openEHR only |
| `MedicationStatement.partOf` | `links` *(RM attribute)* | LINK to the partOf composition |  |
| `MedicationStatement.basedOn` | `links` *(RM attribute)* | LINK to the basedOn composition |  |
| `MedicationStatement.basedOn` | `links` *(RM attribute)* | LINK to the derivedFrom composition |  |
| `MedicationStatement.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationStatement`; openEHR → FHIR only; *KDS_medikamentenstatement* |
| `MedicationStatement` | composition | → table **COMPOSITION.medication_list.v1.MedicationStatement** | *KDS_medikamentenstatement* |
| `MedicationStatement` | **Item tree** `at0004` | direct | *KDS_medikamentenstatement* |
| `MedicationStatement.identifier` | CLUSTER.identifier_fhir.v0 | → table **CLUSTER.identifier_fhir.v0** | *KDS_medikamentenstatement* |
| `MedicationStatement.category` | CLUSTER.entry_category.v0 | → table **CLUSTER.entry_category.v0** | *KDS_medikamentenstatement* |
| `MedicationStatement.medication (Reference)` | *(the referenced resource)* | reference → Medication | *KDS_medikamentenstatement* |
| `MedicationStatement.medication (Reference)` | *(the referenced resource)* | → table **CLUSTER.medication.v2** | *KDS_medikamentenstatement* |
| `medication (CodeableConcept)` | CLUSTER.medication.v2 · **Arzneimittel-Name** `at0132` | direct | FHIR → openEHR only; only if openEHR `items[at0071], items[at0115]` is empty; *KDS_medikamentenstatement* |
| `medication (CodeableConcept)` | `data[at0003]/items[at0006]` *(not in this template)* | direct | FHIR → openEHR only; only if openEHR `items[at0132]` is empty; *KDS_medikamentenstatement* |

## Wirkstoffrelation — CLUSTER.medication.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….code.coding.code` | **Arzneimittel-Name** `at0132` | direct | only if openEHR `items[at0132]` type `DV_TEXT`; *KDS_medication.v3* |
| `….form` | **Darreichungsform** `at0071` | direct |  |
| `….amount` | **Wirkstärke (Konzentration)** `at0115` | direct |  |
| `….batch.lotNumber` | **Batch ID** `at0150` | direct |  |
| `….batch.expirationDate` | **Verfallsdatum** `at0003` | direct |  |
| `….ingredient.item (CodeableConcept).text` | **Arzneimittel-Name** `at0132` | direct |  |
| `….ingredient.item (CodeableConcept).coding` | **Wirkstofftyp** `at0142` | direct |  |
| `….ingredient.item` | *(the referenced resource)* | reference → Medication |  |
| `….ingredient.item` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2** |  |
| `….ingredient.item` | *(the referenced resource)* | reference → Substance | FHIR → openEHR only |
| `….ingredient.item` | *(the referenced resource)* | → table **CLUSTER.medication.v2.substance** |  |
| `….ingredient.strength` | **Bestandteil-Menge** `at0152` | direct |  |
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
| `….meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/Medication`; openEHR → FHIR only; *KDS_medication.v3* |
| `….code` | **Arzneimittel-Name** `at0132` | direct | only if openEHR `items[at0132]` type `DV_CODED_TEXT`; *KDS_medication.v3* |

## Wirkstoffrelation — CLUSTER.medication.v2.substance

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….code` | **Arzneimittel-Name** `at0132` | direct |  |
| `….ingredient.substance (CodeableConcept).text` | **Arzneimittel-Name** `at0132` | direct |  |
| `….ingredient.substance (CodeableConcept).coding` | **Wirkstofftyp** `at0142` | direct |  |
| `….ingredient.substance` | *(the referenced resource)* | reference → Substance |  |
| `….ingredient.substance` | CLUSTER.medication.v2 | → table **CLUSTER.medication.v2.substance** |  |
| `….ingredient.quantity` | **Bestandteil-Menge** `at0152` | direct |  |
| `….ingredient.quantity.numerator` | **Zähler** `at0153` | direct |  |
| `….ingredient.quantity.denominator` | **Nenner** `at0157` | direct |  |
| `….instance.quantity` | **Wirkstärke (Konzentration)** `at0115` | direct |  |

## Dosierung — CLUSTER.dosage.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….text` | **Dosierung Freitext** `at0178` | direct |  |
| `….sequence` | **Dosierungsreihenfolge** `at0164` | direct |  |
| `….doseAndRate.dose (Quantity)` | **Dosis** `at0144` | direct | only if openEHR `items[at0144]` type `DV_QUANTITY` |
| `….doseAndRate.dose (Range)` | **Dosis** `at0144` | engine code `dosageQuantityToRange` | only if openEHR `items[at0144]` type `DV_INTERVAL` |
| `….doseAndRate.rate (Quantity)` | **Verabreichungsrate** `at0134` | direct | only if openEHR `items[at0102]` is empty |
| `….doseAndRate.rate (Ratio)` | CLUSTER.dosage.v2 | engine code `ratio_to_dosage` | only if openEHR `items[at0102]` is not empty |
| `….doseAndRate.rate (Range)` | **Verabreichungsrate** `at0134` | engine code `rangeToText` |  |
| `…` | CLUSTER.timing_daily.v1 | → table **CLUSTER.timing_daily.v1** | only if FHIR `timing.repeat.periodUnit` one of `s, min, h, d` |
| `…` | CLUSTER.timing_nondaily.v1 | → table **CLUSTER.timing_nondaily.v1** | only if FHIR `timing.repeat.periodUnit` not of `s, min, h, d` |
| `….timing.repeat` | **Verabreichungsdauer** `at0102` | engine code `dosageDurationToAdministrationDuration` |  |

## Kategorie des Eintrags — CLUSTER.entry_category.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….coding` | **Kategorie der Medikation** `at0002` | direct |  |
| `….text` | **Kommentar** `at0003` | direct |  |

## Identifier — CLUSTER.identifier_fhir.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Identifier** `at0001` | direct |  |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Fall-Kennung** `at0001` | direct |  |

## Tägliche Dosierung — CLUSTER.timing_daily.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….timing.repeat` | CLUSTER.timing_daily.v1 | engine code `timingToDaily` |  |
| `….timing.repeat.when (Enumeration)` | **Ereignis** `at0026` | direct |  |
| `….timing.repeat.offset` | **Offset** `at0040` | direct |  |
| `….asNeeded (Boolean)` | **Bei Bedarf** `at0024` | direct |  |
| `….asNeeded (CodeableConcept)` | **Kriterium "Bei Bedarf"** `at0025` | direct |  |

## Nicht tägliche Dosierung — CLUSTER.timing_nondaily.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….timing.repeat` | CLUSTER.timing_nondaily.v1 | engine code `timingNonDaily` |  |
| `….timing.repeat.when` | **Ereignis** `at0005` | direct |  |
| `….timing.repeat.offset` | **Offset** `at0009` | direct |  |

## Medikamentenliste — COMPOSITION.medication_list.v1.MedicationStatement

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` |  | fixed | status = `final` |
| `….informationSource` | composition · composer | direct |  |
| `….informationSource (Organization)` | composition · `context/health_care_facility` | direct | FHIR → openEHR only |
| `….dateAsserted` | composition · start time | direct |  |
| `effective (Period)` | composition | direct | FHIR → openEHR only |
| `effective (Period).end` | composition · end time | direct |  |
| `effective (Period).start` | composition · start time | direct |  |
| `effective (DateTime)` | composition · start time | direct | FHIR → openEHR only |
| `….context (Reference).identifier` | CLUSTER.case_identification.v0 | → table **CLUSTER.case_identification.v0** | *KDS_composition.MedicationStatement* |
| `….context` | *(the referenced resource)* | reference → Encounter | *KDS_composition.MedicationStatement* |
| `….context.identifier` | CLUSTER.case_identification.v0 | → table **CLUSTER.case_identification.v0** | *KDS_composition.MedicationStatement* |
| `….context` | CLUSTER.case_identification.v0 · `links` *(RM attribute)* | LINK to the case composition | *KDS_composition.MedicationStatement* |
| `….status` | CLUSTER.case_identification.v0 · **Status** `at0003` | direct | *KDS_composition.MedicationStatement* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
