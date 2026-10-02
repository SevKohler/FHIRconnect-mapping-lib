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
| `openEHR-EHR-COMPOSITION.report.v1` | KDS_Prozedur | [`COMPOSITION.report.v1.Procedure`](../../../../model/composition/org.openehr/report.v1.Procedure.yml) | – |

## Procedure — ACTION.procedure.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Procedure.performer.actor` |  | fixed | openEHR function = `asserter` |
| `Procedure.performer.actor` | composition · `provider` | direct |  |
| `Procedure.recorder` | composition · composer | direct |  |
| `Procedure.performed (Period).end` | composition · end time | direct |  |
| `Procedure.performed (Period).start` | composition · start time | direct |  |
| `Procedure.performed (Period).end` | **Final end date/time** `at0060` | direct | FHIR → openEHR only |
| `Procedure.performed (DateTime)` | composition · start time | direct | only if openEHR `end_time` is empty |
| `Procedure.performed (Period).end` | `time` *(RM attribute)* | direct | FHIR → openEHR only |
| `Procedure.performed (DateTime)` | `time` *(RM attribute)* | direct | FHIR → openEHR only |
| `Procedure` | `ism_transition/current_state` *(RM attribute)* | fixed | openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `526`, value = `Planned`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `245`, value = `Active`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `528`, value = `Cancelled`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `530`, value = `Suspended`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `532`, value = `Completed`<br>openEHR defining_code/terminology_id = `openehr`, defining_code/code_string = `531`, value = `Aborted`; FHIR → openEHR only |
| `Procedure` | `ism_transition/current_state` *(RM attribute)* | fixed | status = `in-progress`<br>status = `on-hold`, statusReason.text = `suspended`<br>status = `stopped`<br>status = `not-done`, statusReason.text = `cancelled`<br>status = `unknown`<br>status = `preparation`, statusReason.text = `planned`<br>status = `on-hold`, statusReason.text = `postponed`<br>status = `preparation`, statusReason.text = `scheduled`<br>status = `not-done`, statusReason.text = `expired`<br>status = `completed`, statusReason.text = `completed`; openEHR → FHIR only |
| `Procedure.code` | **Procedure name** `at0002` | direct |  |
| `Procedure.code.coding.extension.value (Coding)` | CLUSTER.anatomical_location.v1 · **Laterality** `at0002` | direct | *KDS_procedure.v1* |
| `Procedure.code.coding.extension` |  | fixed | url = `http://fhir.de/StructureDefinition/seitenlokalisation`; *KDS_procedure.v1* |
| `Procedure.note.text` | **Comment** `at0005` | direct |  |
| `Procedure.category` | **Kategorie der Prozedur** `at0067` | direct |  |
| `Procedure` | CLUSTER.anatomical_location.v1 | → table **CLUSTER.anatomical_location.v1** | *KDS_procedure.v1* |
| `Procedure.meta` |  | fixed | profile = `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure`; openEHR → FHIR only; *KDS_procedure.v1* |
| `Procedure` | composition | → table **COMPOSITION.report.v1.Procedure** | *KDS_procedure.v1* |
| `Procedure.extension.value (Coding)` | **Durchführungsabsicht** `at0014` | direct | *KDS_procedure.v1* |
| `Procedure.extension` |  | fixed | url = `https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht`; *KDS_procedure.v1* |
| `Procedure.extension` | composition · start time | direct | extension `ProzedurDokumentationsdatum`; *KDS_procedure.v1* |
| `Procedure.extension` | composition · start time | fixed | url = `http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum`; *KDS_procedure.v1* |

## Anatomical location — CLUSTER.anatomical_location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….text` | **Body site name** `at0001` | direct | only if FHIR `coding` is empty |
| `….bodySite` | **Body site name** `at0001` | direct | *KDS_anatomical_location_prozedur* |
| `….code.coding.extension.value` | **Laterality** `at0002` | direct | FHIR → openEHR only; *KDS_anatomical_location_prozedur* |

## Case identification — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Case identifier** `at0001` | direct |  |

## KDS_Prozedur — COMPOSITION.report.v1.Procedure

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….performer.actor` |  | fixed | openEHR function = `asserter` |
| `….recorder` | composition · composer | direct |  |
| `….recorder` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `recorder` is empty |
| `….performed (Period)` | *(the referenced resource)* | direct |  |
| `….performed (Period).end` | *(the referenced resource)* | direct |  |
| `….performed (Period).start` | *(the referenced resource)* | direct |  |
| `….performed (DateTimeType)` | composition · start time | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
