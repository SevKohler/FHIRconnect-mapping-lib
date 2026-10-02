# KDS/studienteilnahme

openEHR template **Studienteilnahme** ↔ FHIR profile **mii-pr-consent-einwilligung** (Consent), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/modul-consent/StructureDefinition/mii-pr-consent-einwilligung>

Both directions unless a row says otherwise. Starts at `ACTION.informed_consent.v0`; context file `studienteilnahme.context.yaml`.

## Resources

- Template: [`Studienteilnahme.opt`](../resources/openehr/templates/Studienteilnahme.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.consent#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.consent#2025.0.0)
- Examples: [`../resources/examples/studienteilnahme`](../resources/examples/studienteilnahme): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-ACTION.informed_consent.v0` | Einwilligungserklärung | [`ACTION.informed_consent.v0`](../../../../model/action/org.openehr/informed_consent.v0.yml) | [`KDS_informed_consent`](KDS_informed_consent.yaml) |
| `openEHR-EHR-CLUSTER.study_details.v1` | Studie/Prüfung | [`CLUSTER.study_details.v1`](../../../../model/cluster/org.highmed/study_details.v1.yml) | – |
| `openEHR-EHR-CLUSTER.study_participation.v1` | Studienteilnahme | [`CLUSTER.study_participation.v1`](../../../../model/cluster/org.highmed/study_participation.v1.yml) | – |

## Einwilligungserklärung — ACTION.informed_consent.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `Consent.dateTime` | composition · start time | direct |  |
| `Consent.organization` | composition · `context/health_care_facility` | direct |  |
| `Consent` | `ism_transition/current_state` *(RM attribute)* | value table | `draft` ↔ Initial (524)<br>`proposed` ↔ Planned (526)<br>`active` ↔ Active (245)<br>`rejected` ↔ Cancelled (528)<br>`inactive` ↔ Completed (532)<br>`entered-in-error` ↔ Cancelled (528) |
| `Consent` | CLUSTER.study_participation.v1 | → table **CLUSTER.study_participation.v1** |  |

## Studie/Prüfung — CLUSTER.study_details.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|

## Studienteilnahme — CLUSTER.study_participation.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| `….provision.period.start` | **Beginn der Teilnahme** `at0003` | direct |  |
| `….provision.period.end` | **Ende der Teilnahme** `at0004` | direct |  |
| `…` | CLUSTER.study_details.v1 | → table **CLUSTER.study_details.v1** |  |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
