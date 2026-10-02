# KDS/laborauftrag

openEHR template **KDS_Laborauftrag** ↔ FHIR profile **ServiceRequestLab** (ServiceRequest), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-labor/StructureDefinition/ServiceRequestLab>

Both directions unless a row says otherwise. Starts at `INSTRUCTION.service_request.v1`; context file `KDS_laborauftrag.context.yaml`.

## Resources

- Template: [`KDS_Laborauftrag.opt`](../resources/openehr/templates/KDS_Laborauftrag.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.laborbefund#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.laborbefund#2025.0.0)
- Examples: [`../resources/examples/laborauftrag`](../resources/examples/laborauftrag): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-INSTRUCTION.service_request.v1` | Dienstleistung | [`INSTRUCTION.service_request.v1`](../../../../model/instruction/org.openehr/service_request.v1.yml) | [`KDS_laborauftrag`](KDS_laborauftrag.yml) |
| `openEHR-EHR-CLUSTER.specimen.v1` | Probe | [`CLUSTER.specimen.v1`](../../../../model/cluster/org.openehr/specimen.v1.yml) | – |
| `openEHR-EHR-CLUSTER.organisation.v1` | Organisation | [`CLUSTER.organisation.v1`](../../../../model/cluster/org.openehr/organisation.v1.yml) | – |
| `openEHR-EHR-CLUSTER.case_identification.v0` | Fallidentifikation | [`CLUSTER.case_identification.v0`](../../../../model/cluster/org.openehr/case_identification.v0.yml) | – |
| `openEHR-EHR-COMPOSITION.ServiceRequest.v1` | *not in template* | [`COMPOSITION.request.v1.ServiceRequest`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml) | – |

## Dienstleistung — INSTRUCTION.service_request.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `ServiceRequest.requester` | `context/health_care_facility` *(RM attribute)* | direct |  |
| `ServiceRequest.authoredOn` | composition · start time | direct |  |
| `ServiceRequest.requester` | composition · composer | direct |  |
| `ServiceRequest.requester` | composition · `provider` | direct |  |
| `ServiceRequest` | **Tree** `at0008` | direct |  |
| `ServiceRequest.identifier` | **Auftrags-ID des anfordernden/einsendenden Systems** `at0010` | direct |  |
| `ServiceRequest.status` | **Status der Anfrage** `at0127` | direct |  |
| `ServiceRequest.requester` | *(the referenced resource)* | reference → Organization |  |
| `ServiceRequest.requester` | *(the referenced resource)* | → table **CLUSTER.organisation.v1** |  |
| `ServiceRequest.code` | **Name der Dienstleistung** `at0121` | direct |  |
| `ServiceRequest.category.coding` | **Art der Dienstleistung** `at0148` | value table | `laboratory` ↔ Laboratory (laboratory); *KDS_laborauftrag* |
| `ServiceRequest` | **Intention** `at0065` | value table | `order` ↔ Order (order); *KDS_laborauftrag* |
| `ServiceRequest.note.text` | **Kommentar** `at0150` | direct |  |
| `ServiceRequest` | composition | → table **COMPOSITION.request.v1.ServiceRequest** | *KDS_laborauftrag* |
| `ServiceRequest.specimen` | *(the referenced resource)* | reference → Specimen | *KDS_laborauftrag* |
| `ServiceRequest.specimen` | INSTRUCTION.service_request.v1 | → table **CLUSTER.specimen.v1** | *KDS_laborauftrag* |
| `ServiceRequest.specimen.identifier` | `items[at0001]` *(not in this template)* | direct | *KDS_laborauftrag* |
| `ServiceRequest` | **Status der Anfrage** `at0127` | value table | `completed` ↔ Completed (completed); *KDS_laborauftrag* |

## Probe — CLUSTER.specimen.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….identifier` | `items[at0088]` *(not in this template)* | direct |  |
| `….collection.collected (DateTime)` | **Zeitpunkt der Probenentnahme** `at0015` | direct | only if openEHR `items[at0015]` type `DV_DATE_TIME` |
| `….collection.collected (Period)` | **Zeitpunkt der Probenentnahme** `at0015` | direct | only if openEHR `items[at0015]` type `DV_INTERVAL` |
| `….collection.collector (Reference).identifier` | **Identifikator des Probenehmers** `at0070` | direct |  |
| `….collection.method` | `items[at0007]` *(not in this template)* | direct |  |
| `….collection.bodySite` | `items[at0087]` *(not in this template)* | direct |  |
| `….collection.fastingStatus (CodeableConcept)` | `items[at0008]` *(not in this template)* | direct |  |
| `….type` | `items[at0029]` *(not in this template)* | direct |  |
| `….note.text` | `items[at0045]` *(not in this template)* | direct |  |
| `….condition` | `items[at0097]` *(not in this template)* | direct |  |
| `….accessionIdentifier` | **Laborprobenidentifikator** `at0001` | direct |  |
| `….receivedTime` | `items[at0034]` *(not in this template)* | direct |  |
| `….parent (Reference).identifier.value` | `items[at0003]` *(not in this template)* | direct |  |
| `….parent` | `items[at0003]` *(not in this template)* | direct |  |
| `….parent` | *(the referenced resource)* | reference → Specimen | only if openEHR `links` is not empty |
| `….parent` | `links` *(RM attribute)* | LINK to the parent composition |  |
| `…` | `items[at0041]` *(not in this template)* | value table | `available` ↔ Satisfactory (at0062)<br>`unavailable` ↔ Unsatisfactory - not analysed (at0064)<br>`unsatisfactory` ↔ Unsatisfactory - not analysed (at0064); only if FHIR `status` not of `entered-in-error` |

## Organisation — CLUSTER.organisation.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….name` | `items[at0001]` *(not in this template)* | direct |  |
| `….identifier` | `items[at0003]` *(not in this template)* | direct |  |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `…` | **Fall-Kennung** `at0001` | direct |  |

## COMPOSITION.request.v1.ServiceRequest

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….requester` | composition · `context/health_care_facility` | direct |  |
| `…` | composition · start time | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| `….requester` | composition · composer | direct |  |
| `….requester` | composition · composer | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `requester` is empty |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
