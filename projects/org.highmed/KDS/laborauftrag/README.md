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
| `openEHR-EHR-COMPOSITION.ServiceRequest.v1` | *not in template* | [`COMPOSITION.request.v1.ServiceRequest`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml) | [`KDS_composition`](KDS_composition.yml) |

## Dienstleistung — INSTRUCTION.service_request.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`ServiceRequest.requester`](../../../../model/instruction/org.openehr/service_request.v1.yml#healthCareFacility "INSTRUCTION.service_request.v1#healthCareFacility") | [`context/health_care_facility` *(RM attribute)*](../../../../model/instruction/org.openehr/service_request.v1.yml#healthCareFacility "INSTRUCTION.service_request.v1#healthCareFacility") | direct |  |
| [`ServiceRequest.authoredOn`](../../../../model/instruction/org.openehr/service_request.v1.yml#authoredOn "INSTRUCTION.service_request.v1#authoredOn") | [composition · start time](../../../../model/instruction/org.openehr/service_request.v1.yml#authoredOn "INSTRUCTION.service_request.v1#authoredOn") | direct |  |
| [`ServiceRequest.requester`](../../../../model/instruction/org.openehr/service_request.v1.yml#composer "INSTRUCTION.service_request.v1#composer") | [composition · composer](../../../../model/instruction/org.openehr/service_request.v1.yml#composer "INSTRUCTION.service_request.v1#composer") | direct |  |
| [`ServiceRequest.requester`](../../../../model/instruction/org.openehr/service_request.v1.yml#provider "INSTRUCTION.service_request.v1#provider") | [composition · `provider`](../../../../model/instruction/org.openehr/service_request.v1.yml#provider "INSTRUCTION.service_request.v1#provider") | direct |  |
| [`ServiceRequest`](../../../../model/instruction/org.openehr/service_request.v1.yml#protocol0008Parent "INSTRUCTION.service_request.v1#protocol0008Parent") | [**Tree** `at0008`](../../../../model/instruction/org.openehr/service_request.v1.yml#protocol0008Parent "INSTRUCTION.service_request.v1#protocol0008Parent") | direct |  |
| [`ServiceRequest.identifier`](../../../../model/instruction/org.openehr/service_request.v1.yml#identifier "INSTRUCTION.service_request.v1#identifier") | [**Auftrags-ID des anfordernden/einsendenden Systems** `at0010`](../../../../model/instruction/org.openehr/service_request.v1.yml#identifier "INSTRUCTION.service_request.v1#identifier") | direct |  |
| [`ServiceRequest.status`](../../../../model/instruction/org.openehr/service_request.v1.yml#status "INSTRUCTION.service_request.v1#status") | [**Status der Anfrage** `at0127`](../../../../model/instruction/org.openehr/service_request.v1.yml#status "INSTRUCTION.service_request.v1#status") | direct |  |
| [`ServiceRequest.requester`](../../../../model/instruction/org.openehr/service_request.v1.yml#organisation "INSTRUCTION.service_request.v1#organisation") | [*(the referenced resource)*](../../../../model/instruction/org.openehr/service_request.v1.yml#organisation "INSTRUCTION.service_request.v1#organisation") | reference → Organization |  |
| [`ServiceRequest.requester`](../../../../model/instruction/org.openehr/service_request.v1.yml#organization "INSTRUCTION.service_request.v1#organization") | [*(the referenced resource)*](../../../../model/instruction/org.openehr/service_request.v1.yml#organization "INSTRUCTION.service_request.v1#organization") | → table **CLUSTER.organisation.v1** |  |
| [`ServiceRequest.code`](../../../../model/instruction/org.openehr/service_request.v1.yml#code "INSTRUCTION.service_request.v1#code") | [**Name der Dienstleistung** `at0121`](../../../../model/instruction/org.openehr/service_request.v1.yml#code "INSTRUCTION.service_request.v1#code") | direct |  |
| [`ServiceRequest.category.coding`](KDS_laborauftrag.yml#category "KDS_laborauftrag#category") | [**Art der Dienstleistung** `at0148`](KDS_laborauftrag.yml#category "KDS_laborauftrag#category") | value table | `laboratory` ↔ Laboratory (laboratory); *KDS_laborauftrag* |
| [`ServiceRequest`](KDS_laborauftrag.yml#intent "KDS_laborauftrag#intent") | [**Intention** `at0065`](KDS_laborauftrag.yml#intent "KDS_laborauftrag#intent") | value table | `order` ↔ Order (order); *KDS_laborauftrag* |
| [`ServiceRequest.note.text`](../../../../model/instruction/org.openehr/service_request.v1.yml#note "INSTRUCTION.service_request.v1#note") | [**Kommentar** `at0150`](../../../../model/instruction/org.openehr/service_request.v1.yml#note "INSTRUCTION.service_request.v1#note") | direct |  |
| [`ServiceRequest`](KDS_laborauftrag.yml#compositionMapping "KDS_laborauftrag#compositionMapping") | [composition](KDS_laborauftrag.yml#compositionMapping "KDS_laborauftrag#compositionMapping") | → table **COMPOSITION.request.v1.ServiceRequest** | *KDS_laborauftrag* |
| [`ServiceRequest.specimen`](KDS_laborauftrag.yml#specimenReference "KDS_laborauftrag#specimenReference") | [*(the referenced resource)*](KDS_laborauftrag.yml#specimenReference "KDS_laborauftrag#specimenReference") | reference → Specimen | *KDS_laborauftrag* |
| [`ServiceRequest.specimen`](KDS_laborauftrag.yml#specimenRecurring "KDS_laborauftrag#specimenRecurring") | [INSTRUCTION.service_request.v1](KDS_laborauftrag.yml#specimenRecurring "KDS_laborauftrag#specimenRecurring") | → table **CLUSTER.specimen.v1** | *KDS_laborauftrag* |
| [`ServiceRequest.specimen.identifier`](KDS_laborauftrag.yml#specimenIdentifier "KDS_laborauftrag#specimenIdentifier") | [`items[at0001]` *(not in this template)*](KDS_laborauftrag.yml#specimenIdentifier "KDS_laborauftrag#specimenIdentifier") | direct | *KDS_laborauftrag* |
| [`ServiceRequest`](KDS_laborauftrag.yml#status "KDS_laborauftrag#status") | [**Status der Anfrage** `at0127`](KDS_laborauftrag.yml#status "KDS_laborauftrag#status") | value table | `completed` ↔ Completed (completed); *KDS_laborauftrag* |

## Probe — CLUSTER.specimen.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….identifier`](../../../../model/cluster/org.openehr/specimen.v1.yml#identifier "CLUSTER.specimen.v1#identifier") | [`items[at0088]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#identifier "CLUSTER.specimen.v1#identifier") | direct |  |
| [`….collection.collected (DateTime)`](../../../../model/cluster/org.openehr/specimen.v1.yml#collected "CLUSTER.specimen.v1#collected") | [**Zeitpunkt der Probenentnahme** `at0015`](../../../../model/cluster/org.openehr/specimen.v1.yml#collected "CLUSTER.specimen.v1#collected") | direct | only if openEHR `items[at0015]` type `DV_DATE_TIME` |
| [`….collection.collected (Period)`](../../../../model/cluster/org.openehr/specimen.v1.yml#collectedPeriod "CLUSTER.specimen.v1#collectedPeriod") | [**Zeitpunkt der Probenentnahme** `at0015`](../../../../model/cluster/org.openehr/specimen.v1.yml#collectedPeriod "CLUSTER.specimen.v1#collectedPeriod") | direct | only if openEHR `items[at0015]` type `DV_INTERVAL` |
| [`….collection.collector (Reference).identifier`](../../../../model/cluster/org.openehr/specimen.v1.yml#collector "CLUSTER.specimen.v1#collector") | [**Identifikator des Probenehmers** `at0070`](../../../../model/cluster/org.openehr/specimen.v1.yml#collector "CLUSTER.specimen.v1#collector") | direct |  |
| [`….collection.method`](../../../../model/cluster/org.openehr/specimen.v1.yml#specimenCollectionMethod "CLUSTER.specimen.v1#specimenCollectionMethod") | [`items[at0007]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#specimenCollectionMethod "CLUSTER.specimen.v1#specimenCollectionMethod") | direct |  |
| [`….collection.bodySite`](../../../../model/cluster/org.openehr/specimen.v1.yml#specimenCollectionBodySite "CLUSTER.specimen.v1#specimenCollectionBodySite") | [`items[at0087]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#specimenCollectionBodySite "CLUSTER.specimen.v1#specimenCollectionBodySite") | direct |  |
| [`….collection.fastingStatus (CodeableConcept)`](../../../../model/cluster/org.openehr/specimen.v1.yml#samplingContext "CLUSTER.specimen.v1#samplingContext") | [`items[at0008]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#samplingContext "CLUSTER.specimen.v1#samplingContext") | direct |  |
| [`….type`](../../../../model/cluster/org.openehr/specimen.v1.yml#type "CLUSTER.specimen.v1#type") | [`items[at0029]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#type "CLUSTER.specimen.v1#type") | direct |  |
| [`….note.text`](../../../../model/cluster/org.openehr/specimen.v1.yml#note "CLUSTER.specimen.v1#note") | [`items[at0045]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#note "CLUSTER.specimen.v1#note") | direct |  |
| [`….condition`](../../../../model/cluster/org.openehr/specimen.v1.yml#descriptionOfSpecimen "CLUSTER.specimen.v1#descriptionOfSpecimen") | [`items[at0097]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#descriptionOfSpecimen "CLUSTER.specimen.v1#descriptionOfSpecimen") | direct |  |
| [`….accessionIdentifier`](../../../../model/cluster/org.openehr/specimen.v1.yml#identifierOfSpecimen "CLUSTER.specimen.v1#identifierOfSpecimen") | [**Laborprobenidentifikator** `at0001`](../../../../model/cluster/org.openehr/specimen.v1.yml#identifierOfSpecimen "CLUSTER.specimen.v1#identifierOfSpecimen") | direct |  |
| [`….receivedTime`](../../../../model/cluster/org.openehr/specimen.v1.yml#dateReceived "CLUSTER.specimen.v1#dateReceived") | [`items[at0034]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#dateReceived "CLUSTER.specimen.v1#dateReceived") | direct |  |
| [`….parent (Reference).identifier.value`](../../../../model/cluster/org.openehr/specimen.v1.yml#parent "CLUSTER.specimen.v1#parent") | [`items[at0003]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#parent "CLUSTER.specimen.v1#parent") | direct |  |
| [`….parent`](../../../../model/cluster/org.openehr/specimen.v1.yml#request "CLUSTER.specimen.v1#request") | [`items[at0003]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#request "CLUSTER.specimen.v1#request") | direct |  |
| [`….parent`](../../../../model/cluster/org.openehr/specimen.v1.yml#identifierInReference "CLUSTER.specimen.v1#identifierInReference") | [*(the referenced resource)*](../../../../model/cluster/org.openehr/specimen.v1.yml#identifierInReference "CLUSTER.specimen.v1#identifierInReference") | reference → Specimen | only if openEHR `links` is not empty |
| [`….parent`](../../../../model/cluster/org.openehr/specimen.v1.yml#specimenLink "CLUSTER.specimen.v1#specimenLink") | [`links` *(RM attribute)*](../../../../model/cluster/org.openehr/specimen.v1.yml#specimenLink "CLUSTER.specimen.v1#specimenLink") | LINK to the parent composition |  |
| [`…`](../../../../model/cluster/org.openehr/specimen.v1.yml#status "CLUSTER.specimen.v1#status") | [`items[at0041]` *(not in this template)*](../../../../model/cluster/org.openehr/specimen.v1.yml#status "CLUSTER.specimen.v1#status") | value table | `available` ↔ Satisfactory (at0062)<br>`unavailable` ↔ Unsatisfactory - not analysed (at0064)<br>`unsatisfactory` ↔ Unsatisfactory - not analysed (at0064); only if FHIR `status` not of `entered-in-error` |

## Organisation — CLUSTER.organisation.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….name`](../../../../model/cluster/org.openehr/organisation.v1.yml#orgName "CLUSTER.organisation.v1#orgName") | [`items[at0001]` *(not in this template)*](../../../../model/cluster/org.openehr/organisation.v1.yml#orgName "CLUSTER.organisation.v1#orgName") | direct |  |
| [`….identifier`](../../../../model/cluster/org.openehr/organisation.v1.yml#orgId "CLUSTER.organisation.v1#orgId") | [`items[at0003]` *(not in this template)*](../../../../model/cluster/org.openehr/organisation.v1.yml#orgId "CLUSTER.organisation.v1#orgId") | direct |  |

## Fallidentifikation — CLUSTER.case_identification.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`…`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | [**Fall-Kennung** `at0001`](../../../../model/cluster/org.openehr/case_identification.v0.yml#identifierCaseParent "CLUSTER.case_identification.v0#identifierCaseParent") | direct |  |

## COMPOSITION.request.v1.ServiceRequest

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….requester`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#healthcareFacility "COMPOSITION.request.v1.ServiceRequest#healthcareFacility") | [composition · `context/health_care_facility`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#healthcareFacility "COMPOSITION.request.v1.ServiceRequest#healthcareFacility") | direct |  |
| [`…`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#effectiveStart "COMPOSITION.request.v1.ServiceRequest#effectiveStart") | [composition · start time](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#effectiveStart "COMPOSITION.request.v1.ServiceRequest#effectiveStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….requester`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#composer "COMPOSITION.request.v1.ServiceRequest#composer") | [composition · composer](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#composer "COMPOSITION.request.v1.ServiceRequest#composer") | direct |  |
| [`….requester`](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#composerEmpty "COMPOSITION.request.v1.ServiceRequest#composerEmpty") | [composition · composer](../../../../model/composition/org.openehr/request.v1.ServiceRequest.yml#composerEmpty "COMPOSITION.request.v1.ServiceRequest#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `requester` is empty |
| [`….encounter (Reference).identifier`](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition#fallIdentifikationIdentifier") | [CLUSTER.case_identification.v0](KDS_composition.yml#fallIdentifikationIdentifier "KDS_composition#fallIdentifikationIdentifier") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | [*(the referenced resource)*](KDS_composition.yml#fallIdentifikationReference "KDS_composition#fallIdentifikationReference") | reference → Encounter | *KDS_composition* |
| [`….encounter.identifier`](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | [CLUSTER.case_identification.v0](KDS_composition.yml#identifierInReference "KDS_composition#identifierInReference") | → table **CLUSTER.case_identification.v0** | *KDS_composition* |
| [`….encounter`](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | [CLUSTER.case_identification.v0 · `links` *(RM attribute)*](KDS_composition.yml#encounterMapping "KDS_composition#encounterMapping") | LINK to the case composition | *KDS_composition* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
