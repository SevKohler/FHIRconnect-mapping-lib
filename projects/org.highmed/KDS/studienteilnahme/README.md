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
| [`Consent.dateTime`](../../../../model/action/org.openehr/informed_consent.v0.yml#contextStartTime "ACTION.informed_consent.v0#contextStartTime") | [composition · start time](../../../../model/action/org.openehr/informed_consent.v0.yml#contextStartTime "ACTION.informed_consent.v0#contextStartTime") | direct |  |
| [`Consent.organization`](../../../../model/action/org.openehr/informed_consent.v0.yml#healthCareFacility "ACTION.informed_consent.v0#healthCareFacility") | [composition · `context/health_care_facility`](../../../../model/action/org.openehr/informed_consent.v0.yml#healthCareFacility "ACTION.informed_consent.v0#healthCareFacility") | direct |  |
| [`Consent`](../../../../model/action/org.openehr/informed_consent.v0.yml#ISMTransition "ACTION.informed_consent.v0#ISMTransition") | [`ism_transition/current_state` *(RM attribute)*](../../../../model/action/org.openehr/informed_consent.v0.yml#ISMTransition "ACTION.informed_consent.v0#ISMTransition") | value table | `draft` ↔ Initial (524)<br>`proposed` ↔ Planned (526)<br>`active` ↔ Active (245)<br>`rejected` ↔ Cancelled (528)<br>`inactive` ↔ Completed (532)<br>`entered-in-error` ↔ Cancelled (528) |
| [`Consent`](../../../../model/action/org.openehr/informed_consent.v0.yml#study "ACTION.informed_consent.v0#study") | [CLUSTER.study_participation.v1](../../../../model/action/org.openehr/informed_consent.v0.yml#study "ACTION.informed_consent.v0#study") | → table **CLUSTER.study_participation.v1** |  |

## Studie/Prüfung — CLUSTER.study_details.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|

## Studienteilnahme — CLUSTER.study_participation.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….provision.period.start`](../../../../model/cluster/org.highmed/study_participation.v1.yml#start "CLUSTER.study_participation.v1#start") | [**Beginn der Teilnahme** `at0003`](../../../../model/cluster/org.highmed/study_participation.v1.yml#start "CLUSTER.study_participation.v1#start") | direct |  |
| [`….provision.period.end`](../../../../model/cluster/org.highmed/study_participation.v1.yml#end "CLUSTER.study_participation.v1#end") | [**Ende der Teilnahme** `at0004`](../../../../model/cluster/org.highmed/study_participation.v1.yml#end "CLUSTER.study_participation.v1#end") | direct |  |
| [`…`](../../../../model/cluster/org.highmed/study_participation.v1.yml#details "CLUSTER.study_participation.v1#details") | [CLUSTER.study_details.v1](../../../../model/cluster/org.highmed/study_participation.v1.yml#details "CLUSTER.study_participation.v1#details") | → table **CLUSTER.study_details.v1** |  |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
