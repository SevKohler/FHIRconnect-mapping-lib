# KDS/procedure

openEHR template **KDS_Prozedur** ↔ FHIR profile **Procedure** (Procedure), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure>

Both directions unless a row says otherwise. Starts at `ACTION.procedure.v1`; context file `procedure.context.yaml`.

## Resources

- Template: [`KDS_Prozedur.opt`](../resources/openehr/templates/KDS_Prozedur.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.prozedur#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.prozedur#2025.0.0)
- Examples: [`../resources/examples/procedure`](../resources/examples/procedure): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-ACTION.procedure.v1` | Procedure | [`ACTION.procedure.v1`](../../../../model/action/org.openehr/procedure.v1.yml) | [`KDS_procedure.v1`](KDS_procedure.v1.yml) |
| `openEHR-EHR-CLUSTER.anatomical_location.v1` | Anatomical location | [`CLUSTER.anatomical_location.v1`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml) | [`KDS_anatomical_location_prozedur`](KDS_anatomical_location.yml) |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Case identification | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Prozedur | [`COMPOSITION.report.v1.Procedure`](../../../../model/composition/org.openehr/report.v1.Procedure.yml) | [`KDS_composition`](KDS_composition.yml) |

## Procedure — ACTION.procedure.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`Procedure.performer.actor`](../../../../model/action/org.openehr/procedure.v1.yml#participationFunction "ACTION.procedure.v1#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`Procedure.performer.actor`](../../../../model/action/org.openehr/procedure.v1.yml#provider "ACTION.procedure.v1#provider") | [composition · `provider`](../../../../model/action/org.openehr/procedure.v1.yml#provider "ACTION.procedure.v1#provider") | direct |  |
| [`Procedure.recorder`](../../../../model/action/org.openehr/procedure.v1.yml#composer "ACTION.procedure.v1#composer") | [composition · composer](../../../../model/action/org.openehr/procedure.v1.yml#composer "ACTION.procedure.v1#composer") | direct |  |
| [`Procedure.performed (Period).end`](../../../../model/action/org.openehr/procedure.v1.yml#periodEnd "ACTION.procedure.v1#periodEnd") | [composition · end time](../../../../model/action/org.openehr/procedure.v1.yml#periodEnd "ACTION.procedure.v1#periodEnd") | direct |  |
| [`Procedure.performed (Period).start`](../../../../model/action/org.openehr/procedure.v1.yml#periodStart "ACTION.procedure.v1#periodStart") | [composition · start time](../../../../model/action/org.openehr/procedure.v1.yml#periodStart "ACTION.procedure.v1#periodStart") | direct |  |
| [`Procedure.performed (Period).end`](../../../../model/action/org.openehr/procedure.v1.yml#ending date "ACTION.procedure.v1#ending date") | [**Final end date/time** `at0060`](../../../../model/action/org.openehr/procedure.v1.yml#ending date "ACTION.procedure.v1#ending date") | direct | FHIR → openEHR only |
| [`Procedure.performed (DateTime)`](../../../../model/action/org.openehr/procedure.v1.yml#contextStart "ACTION.procedure.v1#contextStart") | [composition · start time](../../../../model/action/org.openehr/procedure.v1.yml#contextStart "ACTION.procedure.v1#contextStart") | direct | only if openEHR `end_time` is empty |
| [`Procedure.performed (Period).end`](../../../../model/action/org.openehr/procedure.v1.yml#actionTimeFromPerformedEnd "ACTION.procedure.v1#actionTimeFromPerformedEnd") | [`time` *(RM attribute)*](../../../../model/action/org.openehr/procedure.v1.yml#actionTimeFromPerformedEnd "ACTION.procedure.v1#actionTimeFromPerformedEnd") | direct | FHIR → openEHR only |
| [`Procedure.performed (DateTime)`](../../../../model/action/org.openehr/procedure.v1.yml#actionPerformed "ACTION.procedure.v1#actionPerformed") | [`time` *(RM attribute)*](../../../../model/action/org.openehr/procedure.v1.yml#actionPerformed "ACTION.procedure.v1#actionPerformed") | direct | FHIR → openEHR only |
| [`Procedure`](../../../../model/action/org.openehr/procedure.v1.yml#ISMTransitionFhirToOpenEhr "ACTION.procedure.v1#ISMTransitionFhirToOpenEhr") | [`ism_transition/current_state` *(RM attribute)*](../../../../model/action/org.openehr/procedure.v1.yml#ISMTransitionFhirToOpenEhr "ACTION.procedure.v1#ISMTransitionFhirToOpenEhr") | fixed | openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `526`, value = `Planned`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `245`, value = `Active`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `528`, value = `Cancelled`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `530`, value = `Suspended`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `532`, value = `Completed`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `531`, value = `Aborted`; FHIR → openEHR only |
| [`Procedure`](../../../../model/action/org.openehr/procedure.v1.yml#ISMTransitionOpenEhrToFhir "ACTION.procedure.v1#ISMTransitionOpenEhrToFhir") | [`ism_transition/current_state` *(RM attribute)*](../../../../model/action/org.openehr/procedure.v1.yml#ISMTransitionOpenEhrToFhir "ACTION.procedure.v1#ISMTransitionOpenEhrToFhir") | fixed | status = `in-progress`<br>status = `on-hold`, statusReason.text = `suspended`<br>status = `stopped`<br>status = `not-done`, statusReason.text = `cancelled`<br>status = `unknown`<br>status = `preparation`, statusReason.text = `planned`<br>status = `on-hold`, statusReason.text = `postponed`<br>status = `preparation`, statusReason.text = `scheduled`<br>status = `not-done`, statusReason.text = `expired`<br>status = `completed`, statusReason.text = `completed`; openEHR → FHIR only |
| [`Procedure.code`](../../../../model/action/org.openehr/procedure.v1.yml#name "ACTION.procedure.v1#name") | [**Procedure name** `at0002`](../../../../model/action/org.openehr/procedure.v1.yml#name "ACTION.procedure.v1#name") | direct |  |
| [`Procedure.code.coding.extension.value (Coding)`](KDS_procedure.v1.yml#seitenlokalisationValue "KDS_procedure.v1#seitenlokalisationValue") | [CLUSTER.anatomical_location.v1 · **Laterality** `at0002`](KDS_procedure.v1.yml#seitenlokalisationValue "KDS_procedure.v1#seitenlokalisationValue") | direct | *KDS_procedure.v1* |
| [`Procedure.code.coding.extension`](KDS_procedure.v1.yml#seitenlokalisationUrl "KDS_procedure.v1#seitenlokalisationUrl") |  | fixed | url = `http://fhir.de/StructureDefinition/seitenlokalisation`; *KDS_procedure.v1* |
| [`Procedure.note.text`](../../../../model/action/org.openehr/procedure.v1.yml#comment "ACTION.procedure.v1#comment") | [**Comment** `at0005`](../../../../model/action/org.openehr/procedure.v1.yml#comment "ACTION.procedure.v1#comment") | direct |  |
| [`Procedure.category`](../../../../model/action/org.openehr/procedure.v1.yml#category "ACTION.procedure.v1#category") | [**Kategorie der Prozedur** `at0067`](../../../../model/action/org.openehr/procedure.v1.yml#category "ACTION.procedure.v1#category") | direct |  |
| [`Procedure`](KDS_procedure.v1.yml#bodySite "KDS_procedure.v1#bodySite") | [CLUSTER.anatomical_location.v1](KDS_procedure.v1.yml#bodySite "KDS_procedure.v1#bodySite") | → table **CLUSTER.anatomical_location.v1** | *KDS_procedure.v1* |
| [`Procedure.meta`](KDS_procedure.v1.yml#metaURL "KDS_procedure.v1#metaURL") |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure`; openEHR → FHIR only; *KDS_procedure.v1* |
| [`Procedure`](KDS_procedure.v1.yml#compositionMapping "KDS_procedure.v1#compositionMapping") | [composition](KDS_procedure.v1.yml#compositionMapping "KDS_procedure.v1#compositionMapping") | → table **COMPOSITION.report.v1.Procedure** | *KDS_procedure.v1* |
| [`Procedure.extension.value (Coding)`](KDS_procedure.v1.yml#value "KDS_procedure.v1#value") | [**Durchführungsabsicht** `at0014`](KDS_procedure.v1.yml#value "KDS_procedure.v1#value") | direct | *KDS_procedure.v1* |
| [`Procedure.extension`](KDS_procedure.v1.yml#staticUrl "KDS_procedure.v1#staticUrl") |  | fixed | url = `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht`; *KDS_procedure.v1* |
| [`Procedure.extension`](KDS_procedure.v1.yml#contextStartDokumentationsdatum "KDS_procedure.v1#contextStartDokumentationsdatum") | [composition · start time](KDS_procedure.v1.yml#contextStartDokumentationsdatum "KDS_procedure.v1#contextStartDokumentationsdatum") | direct | extension `ProzedurDokumentationsdatum`; *KDS_procedure.v1* |
| [`Procedure.extension`](KDS_procedure.v1.yml#staticUrl "KDS_procedure.v1#staticUrl") | [composition · start time](KDS_procedure.v1.yml#staticUrl "KDS_procedure.v1#staticUrl") | fixed | url = `http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum`; *KDS_procedure.v1* |

## Anatomical location — CLUSTER.anatomical_location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….text`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteText "CLUSTER.anatomical_location.v1#bodySiteText") | [**Body site name** `at0001`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteText "CLUSTER.anatomical_location.v1#bodySiteText") | direct | only if FHIR `coding` is empty |
| [`….bodySite`](KDS_anatomical_location.yml#bodySiteCoded "KDS_anatomical_location_prozedur#bodySiteCoded") | [**Body site name** `at0001`](KDS_anatomical_location.yml#bodySiteCoded "KDS_anatomical_location_prozedur#bodySiteCoded") | direct | *KDS_anatomical_location_prozedur* |
| [`….code.coding.extension.value`](KDS_anatomical_location.yml#seitenlokalisationFromOpsCode "KDS_anatomical_location_prozedur#seitenlokalisationFromOpsCode") | [**Laterality** `at0002`](KDS_anatomical_location.yml#seitenlokalisationFromOpsCode "KDS_anatomical_location_prozedur#seitenlokalisationFromOpsCode") | direct | FHIR → openEHR only; *KDS_anatomical_location_prozedur* |

## Case identification — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | [**Case identifier** `at0001`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | direct |  |

## KDS_Prozedur — COMPOSITION.report.v1.Procedure

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….performer.actor`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#participationFunction "COMPOSITION.report.v1.Procedure#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`….recorder`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#composer "COMPOSITION.report.v1.Procedure#composer") | [composition · composer](../../../../model/composition/org.openehr/report.v1.Procedure.yml#composer "COMPOSITION.report.v1.Procedure#composer") | direct |  |
| [`….recorder`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#composerEmpty "COMPOSITION.report.v1.Procedure#composerEmpty") | [composition · composer](../../../../model/composition/org.openehr/report.v1.Procedure.yml#composerEmpty "COMPOSITION.report.v1.Procedure#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `recorder` is empty |
| [`….performed (Period)`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performed "COMPOSITION.report.v1.Procedure#performed") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performed "COMPOSITION.report.v1.Procedure#performed") | direct |  |
| [`….performed (Period).end`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedEnd "COMPOSITION.report.v1.Procedure#performedEnd") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedEnd "COMPOSITION.report.v1.Procedure#performedEnd") | direct |  |
| [`….performed (Period).start`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedStart "COMPOSITION.report.v1.Procedure#performedStart") | [*(the referenced resource)*](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedStart "COMPOSITION.report.v1.Procedure#performedStart") | direct |  |
| [`….performed (DateTimeType)`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedDateTime "COMPOSITION.report.v1.Procedure#performedDateTime") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedDateTime "COMPOSITION.report.v1.Procedure#performedDateTime") | direct |  |
| [`…`](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedStart "COMPOSITION.report.v1.Procedure#performedStart") | [composition · start time](../../../../model/composition/org.openehr/report.v1.Procedure.yml#performedStart "COMPOSITION.report.v1.Procedure#performedStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….encounter.identifier`](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition#fallIdentifikationIdentifier") | [CLUSTER.case_identification.v0](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition#fallIdentifikationIdentifier") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | [*(the referenced resource)*](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | reference → Encounter | *KDS_composition* |
| [`….encounter.identifier`](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | [CLUSTER.case_identification.v0](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | [CLUSTER.case_identification.v0 · `links` *(RM attribute)*](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | LINK to the case composition | *KDS_composition* |
| [`….identifier.value`](KDS_composition.yml#berichtId "KDS_composition#berichtId") | [composition · `context/other_context[at0001]/items[at0002]`](KDS_composition.yml#berichtId "KDS_composition#berichtId") | direct | *KDS_composition* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
