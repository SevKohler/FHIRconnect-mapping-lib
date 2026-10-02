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
| [`MedicationStatement.informationSource`](../../../../model/observation/org.openehr/medication_statement.v0.yml#provider "OBSERVATION.medication_statement.v0#provider") | [`provider` *(RM attribute)*](../../../../model/observation/org.openehr/medication_statement.v0.yml#provider "OBSERVATION.medication_statement.v0#provider") | direct |  |
| [`MedicationStatement`](../../../../model/observation/org.openehr/medication_statement.v0.yml#eventsParent "OBSERVATION.medication_statement.v0#eventsParent") | [**Beliebiges Ereignis** `at0002`](../../../../model/observation/org.openehr/medication_statement.v0.yml#eventsParent "OBSERVATION.medication_statement.v0#eventsParent") | direct |  |
| [`MedicationStatement.reasonCode`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonCode "OBSERVATION.medication_statement.v0#reasonCode") | [**Behandlungsgrund** `at0023`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonCode "OBSERVATION.medication_statement.v0#reasonCode") | direct |  |
| [`MedicationStatement.note.text`](../../../../model/observation/org.openehr/medication_statement.v0.yml#note "OBSERVATION.medication_statement.v0#note") | [**Hinweis** `at0029`](../../../../model/observation/org.openehr/medication_statement.v0.yml#note "OBSERVATION.medication_statement.v0#note") | direct |  |
| [`MedicationStatement.dosage.route`](../../../../model/observation/org.openehr/medication_statement.v0.yml#dosageRoute "OBSERVATION.medication_statement.v0#dosageRoute") | [**Art der Verabreichung** `at0030`](../../../../model/observation/org.openehr/medication_statement.v0.yml#dosageRoute "OBSERVATION.medication_statement.v0#dosageRoute") | direct |  |
| [`MedicationStatement.dosage`](../../../../model/observation/org.openehr/medication_statement.v0.yml#dosage "OBSERVATION.medication_statement.v0#dosage") | [CLUSTER.dosage.v2](../../../../model/observation/org.openehr/medication_statement.v0.yml#dosage "OBSERVATION.medication_statement.v0#dosage") | → table **CLUSTER.dosage.v2** |  |
| [`MedicationStatement.dosage.text`](../../../../model/observation/org.openehr/medication_statement.v0.yml#unstructuredDosage "OBSERVATION.medication_statement.v0#unstructuredDosage") | [**Tree** `at0033`](../../../../model/observation/org.openehr/medication_statement.v0.yml#unstructuredDosage "OBSERVATION.medication_statement.v0#unstructuredDosage") | direct |  |
| [`MedicationStatement.medication`](../../../../model/observation/org.openehr/medication_statement.v0.yml#medication "OBSERVATION.medication_statement.v0#medication") | [*(the referenced resource)*](../../../../model/observation/org.openehr/medication_statement.v0.yml#medication "OBSERVATION.medication_statement.v0#medication") | reference → Medication |  |
| [`MedicationStatement.medication`](../../../../model/observation/org.openehr/medication_statement.v0.yml#medicationReference "OBSERVATION.medication_statement.v0#medicationReference") | [*(the referenced resource)*](../../../../model/observation/org.openehr/medication_statement.v0.yml#medicationReference "OBSERVATION.medication_statement.v0#medicationReference") | → table **CLUSTER.medication.v2** |  |
| [`MedicationStatement.medication (CodeableConcept)`](../../../../model/observation/org.openehr/medication_statement.v0.yml#medicationCode "OBSERVATION.medication_statement.v0#medicationCode") | [CLUSTER.medication.v2 · **Arzneimittel-Name** `at0132`](../../../../model/observation/org.openehr/medication_statement.v0.yml#medicationCode "OBSERVATION.medication_statement.v0#medicationCode") | direct | only if openEHR `items[at0071], items[at0115]` is empty |
| [`MedicationStatement.medication (CodeableConcept)`](../../../../model/observation/org.openehr/medication_statement.v0.yml#medicationCodeR "OBSERVATION.medication_statement.v0#medicationCodeR") | [**Tree** `at0006`](../../../../model/observation/org.openehr/medication_statement.v0.yml#medicationCodeR "OBSERVATION.medication_statement.v0#medicationCodeR") | direct | only if openEHR `items[at0132]` is empty |
| [`MedicationStatement.reasonReference.resolve() (Condition).code`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonReference "OBSERVATION.medication_statement.v0#reasonReference") | [**Behandlungsgrund** `at0023`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonReference "OBSERVATION.medication_statement.v0#reasonReference") | direct | FHIR → openEHR only |
| [`MedicationStatement.reasonReference.resolve() (DiagnosticReport).code`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonReference "OBSERVATION.medication_statement.v0#reasonReference") | [**Behandlungsgrund** `at0023`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonReference "OBSERVATION.medication_statement.v0#reasonReference") | direct | FHIR → openEHR only |
| [`MedicationStatement.reasonReference.resolve() (Observation).code`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonReferenceObservation "OBSERVATION.medication_statement.v0#reasonReferenceObservation") | [**Behandlungsgrund** `at0023`](../../../../model/observation/org.openehr/medication_statement.v0.yml#reasonReferenceObservation "OBSERVATION.medication_statement.v0#reasonReferenceObservation") | direct | FHIR → openEHR only |
| [`MedicationStatement.partOf`](../../../../model/observation/org.openehr/medication_statement.v0.yml#partOf "OBSERVATION.medication_statement.v0#partOf") | [`links` *(RM attribute)*](../../../../model/observation/org.openehr/medication_statement.v0.yml#partOf "OBSERVATION.medication_statement.v0#partOf") | LINK to the partOf composition |  |
| [`MedicationStatement.basedOn`](../../../../model/observation/org.openehr/medication_statement.v0.yml#basedOn "OBSERVATION.medication_statement.v0#basedOn") | [`links` *(RM attribute)*](../../../../model/observation/org.openehr/medication_statement.v0.yml#basedOn "OBSERVATION.medication_statement.v0#basedOn") | LINK to the basedOn composition |  |
| [`MedicationStatement.basedOn`](../../../../model/observation/org.openehr/medication_statement.v0.yml#derivedFrom "OBSERVATION.medication_statement.v0#derivedFrom") | [`links` *(RM attribute)*](../../../../model/observation/org.openehr/medication_statement.v0.yml#derivedFrom "OBSERVATION.medication_statement.v0#derivedFrom") | LINK to the derivedFrom composition |  |
| [`MedicationStatement.meta`](KDS_medikationseintrag.yml#metaURL "KDS_medikamentenstatement#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationStatement`; openEHR → FHIR only; *KDS_medikamentenstatement* |
| [`MedicationStatement`](KDS_medikationseintrag.yml#compositionMapping "KDS_medikamentenstatement#compositionMapping") | [composition](KDS_medikationseintrag.yml#compositionMapping "KDS_medikamentenstatement#compositionMapping") | → table **COMPOSITION.medication_list.v1.MedicationStatement** | *KDS_medikamentenstatement* |
| [`MedicationStatement`](KDS_medikationseintrag.yml#protocol0004Parent "KDS_medikamentenstatement#protocol0004Parent") | [**Item tree** `at0004`](KDS_medikationseintrag.yml#protocol0004Parent "KDS_medikamentenstatement#protocol0004Parent") | direct | *KDS_medikamentenstatement* |
| [`MedicationStatement.identifier`](KDS_medikationseintrag.yml#externalIdentifier "KDS_medikamentenstatement#externalIdentifier") | [CLUSTER.identifier_fhir.v0](KDS_medikationseintrag.yml#externalIdentifier "KDS_medikamentenstatement#externalIdentifier") | → table **CLUSTER.identifier_fhir.v0** | *KDS_medikamentenstatement* |
| [`MedicationStatement.category`](KDS_medikationseintrag.yml#category "KDS_medikamentenstatement#category") | [CLUSTER.entry_category.v0](KDS_medikationseintrag.yml#category "KDS_medikamentenstatement#category") | → table **CLUSTER.entry_category.v0** | *KDS_medikamentenstatement* |
| [`MedicationStatement.medication (Reference)`](KDS_medikationseintrag.yml#medicationReference "KDS_medikamentenstatement#medicationReference") | [*(the referenced resource)*](KDS_medikationseintrag.yml#medicationReference "KDS_medikamentenstatement#medicationReference") | reference → Medication | *KDS_medikamentenstatement* |
| [`MedicationStatement.medication (Reference)`](KDS_medikationseintrag.yml#medicationReferenceKds "KDS_medikamentenstatement#medicationReferenceKds") | [*(the referenced resource)*](KDS_medikationseintrag.yml#medicationReferenceKds "KDS_medikamentenstatement#medicationReferenceKds") | → table **CLUSTER.medication.v2** | *KDS_medikamentenstatement* |
| [`medication (CodeableConcept)`](KDS_medikationseintrag.yml#medicationCode "KDS_medikamentenstatement#medicationCode") | [CLUSTER.medication.v2 · **Arzneimittel-Name** `at0132`](KDS_medikationseintrag.yml#medicationCode "KDS_medikamentenstatement#medicationCode") | direct | FHIR → openEHR only; only if openEHR `items[at0071], items[at0115]` is empty; *KDS_medikamentenstatement* |
| [`medication (CodeableConcept)`](KDS_medikationseintrag.yml#medicationCodeR "KDS_medikamentenstatement#medicationCodeR") | [`data[at0003]/items[at0006]` *(not in this template)*](KDS_medikationseintrag.yml#medicationCodeR "KDS_medikamentenstatement#medicationCodeR") | direct | FHIR → openEHR only; only if openEHR `items[at0132]` is empty; *KDS_medikamentenstatement* |

## Wirkstoffrelation — CLUSTER.medication.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….code.coding.code`](KDS_medication.yml#name "KDS_medication.v3#name") | [**Arzneimittel-Name** `at0132`](KDS_medication.yml#name "KDS_medication.v3#name") | direct | only if openEHR `items[at0132]` type `DV_TEXT`; *KDS_medication.v3* |
| [`….form`](../../../../model/cluster/org.openehr/medication.v2.yml#form "CLUSTER.medication.v2#form") | [**Darreichungsform** `at0071`](../../../../model/cluster/org.openehr/medication.v2.yml#form "CLUSTER.medication.v2#form") | direct |  |
| [`….amount`](../../../../model/cluster/org.openehr/medication.v2.yml#amount "CLUSTER.medication.v2#amount") | [**Wirkstärke (Konzentration)** `at0115`](../../../../model/cluster/org.openehr/medication.v2.yml#amount "CLUSTER.medication.v2#amount") | direct |  |
| [`….batch.lotNumber`](../../../../model/cluster/org.openehr/medication.v2.yml#id "CLUSTER.medication.v2#id") | [**Batch ID** `at0150`](../../../../model/cluster/org.openehr/medication.v2.yml#id "CLUSTER.medication.v2#id") | direct |  |
| [`….batch.expirationDate`](../../../../model/cluster/org.openehr/medication.v2.yml#expirationDate "CLUSTER.medication.v2#expirationDate") | [**Verfallsdatum** `at0003`](../../../../model/cluster/org.openehr/medication.v2.yml#expirationDate "CLUSTER.medication.v2#expirationDate") | direct |  |
| [`….ingredient.item (CodeableConcept).text`](../../../../model/cluster/org.openehr/medication.v2.yml#itemtext "CLUSTER.medication.v2#itemtext") | [**Arzneimittel-Name** `at0132`](../../../../model/cluster/org.openehr/medication.v2.yml#itemtext "CLUSTER.medication.v2#itemtext") | direct |  |
| [`….ingredient.item (CodeableConcept).coding`](../../../../model/cluster/org.openehr/medication.v2.yml#wirkstofftyp "CLUSTER.medication.v2#wirkstofftyp") | [**Wirkstofftyp** `at0142`](../../../../model/cluster/org.openehr/medication.v2.yml#wirkstofftyp "CLUSTER.medication.v2#wirkstofftyp") | direct |  |
| [`….ingredient.item`](../../../../model/cluster/org.openehr/medication.v2.yml#medication "CLUSTER.medication.v2#medication") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/medication.v2.yml#medication "CLUSTER.medication.v2#medication") | reference → Medication |  |
| [`….ingredient.item`](../../../../model/cluster/org.openehr/medication.v2.yml#medicationMedicationReference "CLUSTER.medication.v2#medicationMedicationReference") | [CLUSTER.medication.v2](../../../../model/cluster/org.openehr/medication.v2.yml#medicationMedicationReference "CLUSTER.medication.v2#medicationMedicationReference") | → table **CLUSTER.medication.v2** |  |
| [`….ingredient.item`](../../../../model/cluster/org.openehr/medication.v2.yml#medicationSubstance "CLUSTER.medication.v2#medicationSubstance") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/medication.v2.yml#medicationSubstance "CLUSTER.medication.v2#medicationSubstance") | reference → Substance | FHIR → openEHR only |
| [`….ingredient.item`](../../../../model/cluster/org.openehr/medication.v2.yml#medicationSubstanceReference "CLUSTER.medication.v2#medicationSubstanceReference") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/medication.v2.yml#medicationSubstanceReference "CLUSTER.medication.v2#medicationSubstanceReference") | → table **CLUSTER.medication.v2.substance** |  |
| [`….ingredient.strength`](../../../../model/cluster/org.openehr/medication.v2.yml#strength "CLUSTER.medication.v2#strength") | [**Bestandteil-Menge** `at0152`](../../../../model/cluster/org.openehr/medication.v2.yml#strength "CLUSTER.medication.v2#strength") | direct |  |
| [`….ingredient.strength.numerator`](../../../../model/cluster/org.openehr/medication.v2.yml#numerator "CLUSTER.medication.v2#numerator") | [**Zähler** `at0153`](../../../../model/cluster/org.openehr/medication.v2.yml#numerator "CLUSTER.medication.v2#numerator") | direct |  |
| [`….ingredient.strength.denominator`](../../../../model/cluster/org.openehr/medication.v2.yml#denominator "CLUSTER.medication.v2#denominator") | [**Nenner** `at0157`](../../../../model/cluster/org.openehr/medication.v2.yml#denominator "CLUSTER.medication.v2#denominator") | direct |  |
| [`….ingredient.extension.value`](KDS_medication.yml#value "KDS_medication.v3#value") | [**Wirkstofftyp** `at0142`](KDS_medication.yml#value "KDS_medication.v3#value") | direct | *KDS_medication.v3* |
| [`….ingredient.extension`](KDS_medication.yml#url "KDS_medication.v3#url") |  | fixed | url = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/wirkstofftyp`; *KDS_medication.v3* |
| [`….ingredient.extension`](KDS_medication.yml#url "KDS_medication.v3#url") |  | fixed | url = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/wirkstoffrelation`; *KDS_medication.v3* |
| [`….ingredient.extension.extension`](KDS_medication.yml#url "KDS_medication.v3#url") |  | fixed | url = `ingredientReference`; *KDS_medication.v3* |
| [`….ingredient.extension.extension.extension.value`](KDS_medication.yml#relationMedication "KDS_medication.v3#relationMedication") | [*(the referenced resource)*](KDS_medication.yml#relationMedication "KDS_medication.v3#relationMedication") | reference → Medication | *KDS_medication.v3* |
| [`….ingredient.extension.extension.extension.value`](KDS_medication.yml#wirkstoffRelationMedication "KDS_medication.v3#wirkstoffRelationMedication") | [CLUSTER.medication.v2](KDS_medication.yml#wirkstoffRelationMedication "KDS_medication.v3#wirkstoffRelationMedication") | → table **CLUSTER.medication.v2** | *KDS_medication.v3* |
| [`….ingredient.extension.extension.extension.value`](KDS_medication.yml#substanceRelation "KDS_medication.v3#substanceRelation") | [*(the referenced resource)*](KDS_medication.yml#substanceRelation "KDS_medication.v3#substanceRelation") | reference → Substance | *KDS_medication.v3* |
| [`….ingredient.extension.extension.extension.value`](KDS_medication.yml#wirkstoffRelationSubstance "KDS_medication.v3#wirkstoffRelationSubstance") | [CLUSTER.medication.v2](KDS_medication.yml#wirkstoffRelationSubstance "KDS_medication.v3#wirkstoffRelationSubstance") | → table **CLUSTER.medication.v2.substance** | *KDS_medication.v3* |
| [`….ingredient.extension.extension`](KDS_medication.yml#url "KDS_medication.v3#url") |  | fixed | url = `ingredientUri`; *KDS_medication.v3* |
| [`….ingredient.extension.extension.value`](KDS_medication.yml#value "KDS_medication.v3#value") | [**Arzneimittel-Name** `at0132`](KDS_medication.yml#value "KDS_medication.v3#value") | direct | *KDS_medication.v3* |
| [`….meta`](KDS_medication.yml#metaURL "KDS_medication.v3#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/Medication`; openEHR → FHIR only; *KDS_medication.v3* |
| [`….code`](KDS_medication.yml#nameStructured "KDS_medication.v3#nameStructured") | [**Arzneimittel-Name** `at0132`](KDS_medication.yml#nameStructured "KDS_medication.v3#nameStructured") | direct | only if openEHR `items[at0132]` type `DV_CODED_TEXT`; *KDS_medication.v3* |

## Wirkstoffrelation — CLUSTER.medication.v2.substance

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….code`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#name "CLUSTER.medication.v2.substance#name") | [**Arzneimittel-Name** `at0132`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#name "CLUSTER.medication.v2.substance#name") | direct |  |
| [`….ingredient.substance (CodeableConcept).text`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#itemText "CLUSTER.medication.v2.substance#itemText") | [**Arzneimittel-Name** `at0132`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#itemText "CLUSTER.medication.v2.substance#itemText") | direct |  |
| [`….ingredient.substance (CodeableConcept).coding`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#wirkstofftyp "CLUSTER.medication.v2.substance#wirkstofftyp") | [**Wirkstofftyp** `at0142`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#wirkstofftyp "CLUSTER.medication.v2.substance#wirkstofftyp") | direct |  |
| [`….ingredient.substance`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#substanceSubstance "CLUSTER.medication.v2.substance#substanceSubstance") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/medication.v2.substance.yml#substanceSubstance "CLUSTER.medication.v2.substance#substanceSubstance") | reference → Substance |  |
| [`….ingredient.substance`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#medicationSubstanceReference "CLUSTER.medication.v2.substance#medicationSubstanceReference") | [CLUSTER.medication.v2](../../../../model/cluster/org.openehr/medication.v2.substance.yml#medicationSubstanceReference "CLUSTER.medication.v2.substance#medicationSubstanceReference") | → table **CLUSTER.medication.v2.substance** |  |
| [`….ingredient.quantity`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#quantity "CLUSTER.medication.v2.substance#quantity") | [**Bestandteil-Menge** `at0152`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#quantity "CLUSTER.medication.v2.substance#quantity") | direct |  |
| [`….ingredient.quantity.numerator`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#numerator "CLUSTER.medication.v2.substance#numerator") | [**Zähler** `at0153`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#numerator "CLUSTER.medication.v2.substance#numerator") | direct |  |
| [`….ingredient.quantity.denominator`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#denominator "CLUSTER.medication.v2.substance#denominator") | [**Nenner** `at0157`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#denominator "CLUSTER.medication.v2.substance#denominator") | direct |  |
| [`….instance.quantity`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#instance "CLUSTER.medication.v2.substance#instance") | [**Wirkstärke (Konzentration)** `at0115`](../../../../model/cluster/org.openehr/medication.v2.substance.yml#instance "CLUSTER.medication.v2.substance#instance") | direct |  |

## Dosierung — CLUSTER.dosage.v2

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….text`](../../../../model/cluster/org.openehr/dosage.v2.yml#dosageInstructionText "CLUSTER.dosage.v2#dosageInstructionText") | [**Dosierung Freitext** `at0178`](../../../../model/cluster/org.openehr/dosage.v2.yml#dosageInstructionText "CLUSTER.dosage.v2#dosageInstructionText") | direct |  |
| [`….sequence`](../../../../model/cluster/org.openehr/dosage.v2.yml#sequence "CLUSTER.dosage.v2#sequence") | [**Dosierungsreihenfolge** `at0164`](../../../../model/cluster/org.openehr/dosage.v2.yml#sequence "CLUSTER.dosage.v2#sequence") | direct |  |
| [`….doseAndRate.dose (Quantity)`](../../../../model/cluster/org.openehr/dosage.v2.yml#doseQuantityValue "CLUSTER.dosage.v2#doseQuantityValue") | [**Dosis** `at0144`](../../../../model/cluster/org.openehr/dosage.v2.yml#doseQuantityValue "CLUSTER.dosage.v2#doseQuantityValue") | direct | only if openEHR `items[at0144]` type `DV_QUANTITY` |
| [`….doseAndRate.dose (Range)`](../../../../model/cluster/org.openehr/dosage.v2.yml#doseRangeValue "CLUSTER.dosage.v2#doseRangeValue") | [**Dosis** `at0144`](../../../../model/cluster/org.openehr/dosage.v2.yml#doseRangeValue "CLUSTER.dosage.v2#doseRangeValue") | engine code `dosageQuantityToRange` | only if openEHR `items[at0144]` type `DV_INTERVAL` |
| [`….doseAndRate.rate (Quantity)`](../../../../model/cluster/org.openehr/dosage.v2.yml#rateQuantity "CLUSTER.dosage.v2#rateQuantity") | [**Verabreichungsrate** `at0134`](../../../../model/cluster/org.openehr/dosage.v2.yml#rateQuantity "CLUSTER.dosage.v2#rateQuantity") | direct | only if openEHR `items[at0102]` is empty |
| [`….doseAndRate.rate (Ratio)`](../../../../model/cluster/org.openehr/dosage.v2.yml#rateRatio "CLUSTER.dosage.v2#rateRatio") | [CLUSTER.dosage.v2](../../../../model/cluster/org.openehr/dosage.v2.yml#rateRatio "CLUSTER.dosage.v2#rateRatio") | engine code `ratio_to_dosage` | only if openEHR `items[at0102]` is not empty |
| [`….doseAndRate.rate (Range)`](../../../../model/cluster/org.openehr/dosage.v2.yml#rateRangeValue "CLUSTER.dosage.v2#rateRangeValue") | [**Verabreichungsrate** `at0134`](../../../../model/cluster/org.openehr/dosage.v2.yml#rateRangeValue "CLUSTER.dosage.v2#rateRangeValue") | engine code `rangeToText` |  |
| [`…`](../../../../model/cluster/org.openehr/dosage.v2.yml#dosageDailyTiming "CLUSTER.dosage.v2#dosageDailyTiming") | [CLUSTER.timing_daily.v1](../../../../model/cluster/org.openehr/dosage.v2.yml#dosageDailyTiming "CLUSTER.dosage.v2#dosageDailyTiming") | → table **CLUSTER.timing_daily.v1** | only if FHIR `timing.repeat.periodUnit` one of `s, min, h, d` |
| [`…`](../../../../model/cluster/org.openehr/dosage.v2.yml#dosageTimingNonDaily "CLUSTER.dosage.v2#dosageTimingNonDaily") | [CLUSTER.timing_nondaily.v1](../../../../model/cluster/org.openehr/dosage.v2.yml#dosageTimingNonDaily "CLUSTER.dosage.v2#dosageTimingNonDaily") | → table **CLUSTER.timing_nondaily.v1** | only if FHIR `timing.repeat.periodUnit` not of `s, min, h, d` |
| [`….timing.repeat`](../../../../model/cluster/org.openehr/dosage.v2.yml#duration "CLUSTER.dosage.v2#duration") | [**Verabreichungsdauer** `at0102`](../../../../model/cluster/org.openehr/dosage.v2.yml#duration "CLUSTER.dosage.v2#duration") | engine code `dosageDurationToAdministrationDuration` |  |

## Kategorie des Eintrags — CLUSTER.entry_category.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….coding`](../../../../model/cluster/org.highmed/entry_category.v0.yml#coding "CLUSTER.entry_category.v0#coding") | [**Kategorie der Medikation** `at0002`](../../../../model/cluster/org.highmed/entry_category.v0.yml#coding "CLUSTER.entry_category.v0#coding") | direct |  |
| [`….text`](../../../../model/cluster/org.highmed/entry_category.v0.yml#comment "CLUSTER.entry_category.v0#comment") | [**Kommentar** `at0003`](../../../../model/cluster/org.highmed/entry_category.v0.yml#comment "CLUSTER.entry_category.v0#comment") | direct |  |

## Identifier — CLUSTER.identifier_fhir.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.highmed/identifier_fhir.v0.yml#identifier "CLUSTER.identifier_fhir.v0#identifier") | [**Identifier** `at0001`](../../../../model/cluster/org.highmed/identifier_fhir.v0.yml#identifier "CLUSTER.identifier_fhir.v0#identifier") | direct |  |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | [**Fall-Kennung** `at0001`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | direct |  |

## Tägliche Dosierung — CLUSTER.timing_daily.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….timing.repeat`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#dosageTiming "CLUSTER.timing_daily.v1#dosageTiming") | [CLUSTER.timing_daily.v1](../../../../model/cluster/org.openehr/timing_daily.v1.yml#dosageTiming "CLUSTER.timing_daily.v1#dosageTiming") | engine code `timingToDaily` |  |
| [`….timing.repeat.when (Enumeration)`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#when "CLUSTER.timing_daily.v1#when") | [**Ereignis** `at0026`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#when "CLUSTER.timing_daily.v1#when") | direct |  |
| [`….timing.repeat.offset`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#offset "CLUSTER.timing_daily.v1#offset") | [**Offset** `at0040`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#offset "CLUSTER.timing_daily.v1#offset") | direct |  |
| [`….asNeeded (Boolean)`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#asNeeded "CLUSTER.timing_daily.v1#asNeeded") | [**Bei Bedarf** `at0024`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#asNeeded "CLUSTER.timing_daily.v1#asNeeded") | direct |  |
| [`….asNeeded (CodeableConcept)`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#asNeededCode "CLUSTER.timing_daily.v1#asNeededCode") | [**Kriterium "Bei Bedarf"** `at0025`](../../../../model/cluster/org.openehr/timing_daily.v1.yml#asNeededCode "CLUSTER.timing_daily.v1#asNeededCode") | direct |  |

## Nicht tägliche Dosierung — CLUSTER.timing_nondaily.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….timing.repeat`](../../../../model/cluster/org.openehr/timing_non_daily.yml#dosageTiming "CLUSTER.timing_nondaily.v1#dosageTiming") | [CLUSTER.timing_nondaily.v1](../../../../model/cluster/org.openehr/timing_non_daily.yml#dosageTiming "CLUSTER.timing_nondaily.v1#dosageTiming") | engine code `timingNonDaily` |  |
| [`….timing.repeat.when`](../../../../model/cluster/org.openehr/timing_non_daily.yml#when "CLUSTER.timing_nondaily.v1#when") | [**Ereignis** `at0005`](../../../../model/cluster/org.openehr/timing_non_daily.yml#when "CLUSTER.timing_nondaily.v1#when") | direct |  |
| [`….timing.repeat.offset`](../../../../model/cluster/org.openehr/timing_non_daily.yml#offset "CLUSTER.timing_nondaily.v1#offset") | [**Offset** `at0009`](../../../../model/cluster/org.openehr/timing_non_daily.yml#offset "CLUSTER.timing_nondaily.v1#offset") | direct |  |

## Medikamentenliste — COMPOSITION.medication_list.v1.MedicationStatement

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#statusDefault "COMPOSITION.medication_list.v1.MedicationStatement#statusDefault") |  | fixed | status = `final` |
| [`….informationSource`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#composer "COMPOSITION.medication_list.v1.MedicationStatement#composer") | [composition · composer](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#composer "COMPOSITION.medication_list.v1.MedicationStatement#composer") | direct |  |
| [`….informationSource (Organization)`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#healthcareFacility "COMPOSITION.medication_list.v1.MedicationStatement#healthcareFacility") | [composition · `context/health_care_facility`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#healthcareFacility "COMPOSITION.medication_list.v1.MedicationStatement#healthcareFacility") | direct | FHIR → openEHR only |
| [`….dateAsserted`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#dateAsserted "COMPOSITION.medication_list.v1.MedicationStatement#dateAsserted") | [composition · start time](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#dateAsserted "COMPOSITION.medication_list.v1.MedicationStatement#dateAsserted") | direct |  |
| [`effective (Period)`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectivePeriod "COMPOSITION.medication_list.v1.MedicationStatement#effectivePeriod") | [composition](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectivePeriod "COMPOSITION.medication_list.v1.MedicationStatement#effectivePeriod") | direct | FHIR → openEHR only |
| [`effective (Period).end`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectiveEnd "COMPOSITION.medication_list.v1.MedicationStatement#effectiveEnd") | [composition · end time](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectiveEnd "COMPOSITION.medication_list.v1.MedicationStatement#effectiveEnd") | direct |  |
| [`effective (Period).start`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectiveStart "COMPOSITION.medication_list.v1.MedicationStatement#effectiveStart") | [composition · start time](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectiveStart "COMPOSITION.medication_list.v1.MedicationStatement#effectiveStart") | direct |  |
| [`effective (DateTime)`](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectiveDateTime "COMPOSITION.medication_list.v1.MedicationStatement#effectiveDateTime") | [composition · start time](../../../../model/composition/org.openehr/medication_list.v1.MedicationStatement.yml#effectiveDateTime "COMPOSITION.medication_list.v1.MedicationStatement#effectiveDateTime") | direct | FHIR → openEHR only |
| [`….context (Reference).identifier`](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition.MedicationStatement#fallIdentifikationIdentifier") | [CLUSTER.case_identification.v0](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition.MedicationStatement#fallIdentifikationIdentifier") | → table **CLUSTER.case_identification.v0** | *KDS_composition.MedicationStatement* |
| [`….context`](KDS_composition.yml#fallIdentifikationReference "KDS_composition.MedicationStatement#fallIdentifikationReference") | [*(the referenced resource)*](KDS_composition.yml#fallIdentifikationReference "KDS_composition.MedicationStatement#fallIdentifikationReference") | reference → Encounter | *KDS_composition.MedicationStatement* |
| [`….context.identifier`](KDS_composition.yml#identifierInReference "KDS_composition.MedicationStatement#identifierInReference") | [CLUSTER.case_identification.v0](KDS_composition.yml#identifierInReference "KDS_composition.MedicationStatement#identifierInReference") | → table **CLUSTER.case_identification.v0** | *KDS_composition.MedicationStatement* |
| [`….context`](KDS_composition.yml#encounterMapping "KDS_composition.MedicationStatement#encounterMapping") | [CLUSTER.case_identification.v0 · `links` *(RM attribute)*](KDS_composition.yml#encounterMapping "KDS_composition.MedicationStatement#encounterMapping") | LINK to the case composition | *KDS_composition.MedicationStatement* |
| [`….status`](KDS_composition.yml#status "KDS_composition.MedicationStatement#status") | [CLUSTER.case_identification.v0 · **Status** `at0003`](KDS_composition.yml#status "KDS_composition.MedicationStatement#status") | direct | *KDS_composition.MedicationStatement* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
