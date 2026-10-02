# KDS/fall

openEHR template **KDS_Fall_einfach** ↔ FHIR profile **KontaktGesundheitseinrichtung** (Encounter), version 2025.0.0.

Profile: <https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung>

Both directions unless a row says otherwise. Starts at `ADMIN_ENTRY.episode_institution_local.v0`; context file `KDS_fall_einfach.context.yaml`.

## Resources

- Template: [`KDS_Fall_einfach.opt`](../resources/openehr/templates/KDS_Fall_einfach.opt)
- Profile package: [`de.medizininformatikinitiative.kerndatensatz.fall#2025.0.0`](../resources/fhir/package/de.medizininformatikinitiative.kerndatensatz.fall#2025.0.0)
- Examples: [`../resources/examples/fall`](../resources/examples/fall): 3 FHIR, 3 openEHR

## Archetypes

| archetype | in the template as | model mapping | project extensions |
|---|---|---|---|
| `openEHR-EHR-EVALUATION.problem_diagnosis.v1` | Problem/Diagnose | [`EVALUATION.problem_diagnosis.v1`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml) | [`KDS_fall_problem_diagnose`](KDS_fall_problem_diagnose.yml) |
| `openEHR-EHR-ADMIN_ENTRY.episode_institution_local.v0` | Institutionsaufenthalt | [`ADMIN_ENTRY.episode_institution_local.v0`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml) | [`KDS_episode_institution_local`](KDS_episode_institution_local.yml) |
| `openEHR-EHR-CLUSTER.kontakttyp.v0` | KontaktTyp | [`CLUSTER.kontakttyp.v0`](../../../../model/cluster/org.highmed/kontaktTyp.yml) | – |
| `openEHR-EHR-CLUSTER.diagnosetyp.v0` | DiagnoseTyp | [`CLUSTER.diagnosetyp.v0`](../../../../model/cluster/org.highmed/diagnoseTyp.yml) | – |
| `openEHR-EHR-CLUSTER.organization.v0` | Organisationseinheit | [`CLUSTER.organization.v0`](../../../../model/cluster/org.highmed/organization.v0.yml) | – |
| `openEHR-EHR-CLUSTER.location.v1` | Standort | [`CLUSTER.location.v1`](../../../../model/cluster/org.openehr/location.v1.yml) | – |
| `openEHR-EHR-CLUSTER.anatomical_location.v1` | Anatomische Lokalisation | [`CLUSTER.anatomical_location.v1`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml) | [`KDS_anatomical_location`](../diagnose/KDS_anatomical_location.yml) |
| `openEHR-EHR-COMPOSITION.fall.v1` | KDS_Fall_einfach | [`COMPOSITION.fall.v1.encounter`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml) | [`KDS_composition`](KDS_composition.yml) |

## Institutionsaufenthalt — ADMIN_ENTRY.episode_institution_local.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`Encounter.serviceProvider`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#healthcareFacility "ADMIN_ENTRY.episode_institution_local.v0#healthcareFacility") | [composition · `context/health_care_facility`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#healthcareFacility "ADMIN_ENTRY.episode_institution_local.v0#healthcareFacility") | direct |  |
| [`Encounter.period`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#contextPeriod "ADMIN_ENTRY.episode_institution_local.v0#contextPeriod") | [composition · `context`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#contextPeriod "ADMIN_ENTRY.episode_institution_local.v0#contextPeriod") | direct |  |
| [`Encounter.period.start`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#contextStart "ADMIN_ENTRY.episode_institution_local.v0#contextStart") | [composition · start time](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#contextStart "ADMIN_ENTRY.episode_institution_local.v0#contextStart") | direct |  |
| [`Encounter.period.end`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#contextEnd "ADMIN_ENTRY.episode_institution_local.v0#contextEnd") | [composition · end time](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#contextEnd "ADMIN_ENTRY.episode_institution_local.v0#contextEnd") | direct |  |
| [`Encounter.location`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#location "ADMIN_ENTRY.episode_institution_local.v0#location") | [CLUSTER.location.v1](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#location "ADMIN_ENTRY.episode_institution_local.v0#location") | → table **CLUSTER.location.v1** |  |
| [`Encounter.period.start`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#admissionDate "ADMIN_ENTRY.episode_institution_local.v0#admissionDate") | [**Aufnahmedatum** `at0004`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#admissionDate "ADMIN_ENTRY.episode_institution_local.v0#admissionDate") | direct |  |
| [`Encounter.period.end`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#seperationDate "ADMIN_ENTRY.episode_institution_local.v0#seperationDate") | [**Entlassungsdatum** `at0002`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#seperationDate "ADMIN_ENTRY.episode_institution_local.v0#seperationDate") | direct |  |
| [`Encounter.period.location.identifier`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#bed "ADMIN_ENTRY.episode_institution_local.v0#bed") | [`items[at0024]` *(not in this template)*](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#bed "ADMIN_ENTRY.episode_institution_local.v0#bed") | direct | only if FHIR `physicalType.coding.code` one of `bd` |
| [`Encounter.period.status`](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#locationStatus "ADMIN_ENTRY.episode_institution_local.v0#locationStatus") | [`items[at0028]` *(not in this template)*](../../../../model/admin_entry/org.highmed/episode_institution_local.v0.yml#locationStatus "ADMIN_ENTRY.episode_institution_local.v0#locationStatus") | direct |  |
| [`Encounter`](KDS_episode_institution_local.yml#compositionMapping "KDS_episode_institution_local#compositionMapping") | [composition](KDS_episode_institution_local.yml#compositionMapping "KDS_episode_institution_local#compositionMapping") | → table **COMPOSITION.fall.v1.encounter** | *KDS_episode_institution_local* |
| [`Encounter.serviceProvider (Organization)`](KDS_episode_institution_local.yml#serviceProvider "KDS_episode_institution_local#serviceProvider") | [*(the referenced resource)*](KDS_episode_institution_local.yml#serviceProvider "KDS_episode_institution_local#serviceProvider") | reference → Organization | *KDS_episode_institution_local* |
| [`Encounter.serviceProvider (Organization)`](KDS_episode_institution_local.yml#organization "KDS_episode_institution_local#organization") | [CLUSTER.organisation.v1](KDS_episode_institution_local.yml#organization "KDS_episode_institution_local#organization") | → table **CLUSTER.organisation.v1** | *KDS_episode_institution_local* |
| [`Encounter.extension`](KDS_episode_institution_local.yml#aufnahmegrund "KDS_episode_institution_local#aufnahmegrund") |  | fixed | url = `http://fhir.de/StructureDefinition/Aufnahmegrund`; *KDS_episode_institution_local* |
| [`Encounter.extension.extension`](KDS_episode_institution_local.yml#ersteUndZweiteStelle "KDS_episode_institution_local#ersteUndZweiteStelle") | [**Aufnahmegrund - Vierte Stelle** `at0008`](KDS_episode_institution_local.yml#ersteUndZweiteStelle "KDS_episode_institution_local#ersteUndZweiteStelle") | direct | extension `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| [`Encounter.extension.extension`](KDS_episode_institution_local.yml#ersteUndZweiteStelleUrl "KDS_episode_institution_local#ersteUndZweiteStelleUrl") | [**Aufnahmegrund - Vierte Stelle** `at0008`](KDS_episode_institution_local.yml#ersteUndZweiteStelleUrl "KDS_episode_institution_local#ersteUndZweiteStelleUrl") | fixed | url = `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| [`Encounter.extension.extension`](KDS_episode_institution_local.yml#dritteStelle "KDS_episode_institution_local#dritteStelle") | [**Aufnahmegrund - Vierte Stelle** `at0008`](KDS_episode_institution_local.yml#dritteStelle "KDS_episode_institution_local#dritteStelle") | direct | extension `DritteStelle`; *KDS_episode_institution_local* |
| [`Encounter.extension.extension`](KDS_episode_institution_local.yml#DritteStelleUrl "KDS_episode_institution_local#DritteStelleUrl") | [**Aufnahmegrund - Vierte Stelle** `at0008`](KDS_episode_institution_local.yml#DritteStelleUrl "KDS_episode_institution_local#DritteStelleUrl") | fixed | url = `DritteStelle`; *KDS_episode_institution_local* |
| [`Encounter.extension.extension`](KDS_episode_institution_local.yml#vierteStelle "KDS_episode_institution_local#vierteStelle") | [**Aufnahmegrund - Vierte Stelle** `at0008`](KDS_episode_institution_local.yml#vierteStelle "KDS_episode_institution_local#vierteStelle") | direct | extension `VierteStelle`; *KDS_episode_institution_local* |
| [`Encounter.extension.extension`](KDS_episode_institution_local.yml#VierteStelleUrl "KDS_episode_institution_local#VierteStelleUrl") | [**Aufnahmegrund - Vierte Stelle** `at0008`](KDS_episode_institution_local.yml#VierteStelleUrl "KDS_episode_institution_local#VierteStelleUrl") | fixed | url = `VierteStelle`; *KDS_episode_institution_local* |
| [`Encounter.hospitalization.admitSource.coding`](KDS_episode_institution_local.yml#aufnahmekategorie "KDS_episode_institution_local#aufnahmekategorie") | [**Aufnahmekategorie** `at0009`](KDS_episode_institution_local.yml#aufnahmekategorie "KDS_episode_institution_local#aufnahmekategorie") | direct | *KDS_episode_institution_local* |
| [`Encounter.hospitalization.dischargeDisposition.extension`](KDS_episode_institution_local.yml#entlassungsgrundUrl "KDS_episode_institution_local#entlassungsgrundUrl") |  | fixed | url = `http://fhir.de/StructureDefinition/Entlassungsgrund`; *KDS_episode_institution_local* |
| [`Encounter.hospitalization.dischargeDisposition.extension.extension`](KDS_episode_institution_local.yml#entlassungsgrundExtension "KDS_episode_institution_local#entlassungsgrundExtension") | [**Item tree** `at0001`](KDS_episode_institution_local.yml#entlassungsgrundExtension "KDS_episode_institution_local#entlassungsgrundExtension") | direct | extension `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| [`Encounter.hospitalization.dischargeDisposition.extension.extension.value (Coding)`](KDS_episode_institution_local.yml#entlassungsgrundExtensionValue "KDS_episode_institution_local#entlassungsgrundExtensionValue") | [**EntlassungsgrundErsteUndZweiteStelle** `at0006`](KDS_episode_institution_local.yml#entlassungsgrundExtensionValue "KDS_episode_institution_local#entlassungsgrundExtensionValue") | direct | *KDS_episode_institution_local* |
| [`Encounter.hospitalization.dischargeDisposition.extension.extension`](KDS_episode_institution_local.yml#entlassungsgrundUrl "KDS_episode_institution_local#entlassungsgrundUrl") | [**Item tree** `at0001`](KDS_episode_institution_local.yml#entlassungsgrundUrl "KDS_episode_institution_local#entlassungsgrundUrl") | fixed | url = `ErsteUndZweiteStelle`; *KDS_episode_institution_local* |
| [`Encounter.diagnosis.condition`](KDS_episode_institution_local.yml#conditionReference "KDS_episode_institution_local#conditionReference") | [*(the referenced resource)*](KDS_episode_institution_local.yml#conditionReference "KDS_episode_institution_local#conditionReference") | reference → Condition | *KDS_episode_institution_local* |
| [`Encounter.diagnosis.condition`](KDS_episode_institution_local.yml#condition "KDS_episode_institution_local#condition") | [EVALUATION.problem_diagnosis.v1](KDS_episode_institution_local.yml#condition "KDS_episode_institution_local#condition") | → table **EVALUATION.problem_diagnosis.v1** | *KDS_episode_institution_local* |
| [`Encounter.diagnosis.use`](KDS_episode_institution_local.yml#diagnoseTyp "KDS_episode_institution_local#diagnoseTyp") | [CLUSTER.diagnosetyp.v0](KDS_episode_institution_local.yml#diagnoseTyp "KDS_episode_institution_local#diagnoseTyp") | → table **CLUSTER.diagnosetyp.v0** | *KDS_episode_institution_local* |

## Problem/Diagnose — EVALUATION.problem_diagnosis.v1

Resources with `verificationStatus.coding.code` = `entered-in-error` are skipped.

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….asserter`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#participationFunction "EVALUATION.problem_diagnosis.v1#participationFunction") |  | fixed | openEHR function = `asserter` |
| [`….recorder`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#composer "EVALUATION.problem_diagnosis.v1#composer") | [composition · composer](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#composer "EVALUATION.problem_diagnosis.v1#composer") | direct |  |
| [`….recorder`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#provider "EVALUATION.problem_diagnosis.v1#provider") | [`provider` *(RM attribute)*](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#provider "EVALUATION.problem_diagnosis.v1#provider") | direct |  |
| [`….code`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#problemDiagnose "EVALUATION.problem_diagnosis.v1#problemDiagnose") | [**Name des Problems/ der Diagnose** `at0002`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#problemDiagnose "EVALUATION.problem_diagnosis.v1#problemDiagnose") | direct |  |
| [`….note.text`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#note "EVALUATION.problem_diagnosis.v1#note") | [**Kommentar** `at0069`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#note "EVALUATION.problem_diagnosis.v1#note") | direct |  |
| [`….onset`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#dateTime "EVALUATION.problem_diagnosis.v1#dateTime") | [**Datum/ Zeitpunkt des Auftretens/ der Erstdiagnose** `at0077`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#dateTime "EVALUATION.problem_diagnosis.v1#dateTime") | direct |  |
| [`….bodySite`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySite "EVALUATION.problem_diagnosis.v1#bodySite") | [`data[at0012]` *(not in this template)*](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySite "EVALUATION.problem_diagnosis.v1#bodySite") | direct |  |
| [`….bodySite`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySiteCluster "EVALUATION.problem_diagnosis.v1#bodySiteCluster") | [CLUSTER.anatomical_location.v1](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#bodySiteCluster "EVALUATION.problem_diagnosis.v1#bodySiteCluster") | → table **CLUSTER.anatomical_location.v1** |  |
| [`….severity`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#severity "EVALUATION.problem_diagnosis.v1#severity") | [**Structure** `at0005`](../../../../model/evaluation/org.openehr/problem_diagnosis.v1.yml#severity "EVALUATION.problem_diagnosis.v1#severity") | direct |  |

## KontaktTyp — CLUSTER.kontakttyp.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….coding`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktEbene "CLUSTER.kontakttyp.v0#kontaktEbene") | [**KontaktEbene** `at0001`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktEbene "CLUSTER.kontakttyp.v0#kontaktEbene") | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/Kontaktebene` |
| [`….coding`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktEbeneSystem "CLUSTER.kontakttyp.v0#kontaktEbeneSystem") | [**KontaktEbene** `at0001`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktEbeneSystem "CLUSTER.kontakttyp.v0#kontaktEbeneSystem") | fixed | system = `http://fhir.de/CodeSystem/kontaktebene` |
| [`….coding`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktArt "CLUSTER.kontakttyp.v0#kontaktArt") | [**KontaktArt** `at0002`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktArt "CLUSTER.kontakttyp.v0#kontaktArt") | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/kontaktart-de` |
| [`….coding`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktArtSystem "CLUSTER.kontakttyp.v0#kontaktArtSystem") | [**KontaktArt** `at0002`](../../../../model/cluster/org.highmed/kontaktTyp.yml#kontaktArtSystem "CLUSTER.kontakttyp.v0#kontaktArtSystem") | fixed | system = `http://fhir.de/CodeSystem/kontaktart-de` |

## DiagnoseTyp — CLUSTER.diagnosetyp.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….coding`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseRole "CLUSTER.diagnosetyp.v0#diagnoseRole") | [**Rolle** `at0003`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseRole "CLUSTER.diagnosetyp.v0#diagnoseRole") | direct | only if FHIR `system` one of `http://terminology.hl7.org/CodeSystem/diagnosis-role`; only if openEHR `items[at0003]` is not empty |
| [`….coding`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseRoleSystem "CLUSTER.diagnosetyp.v0#diagnoseRoleSystem") | [**Rolle** `at0003`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseRoleSystem "CLUSTER.diagnosetyp.v0#diagnoseRoleSystem") | fixed | system = `http://terminology.hl7.org/CodeSystem/diagnosis-role` |
| [`….coding`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseTyp "CLUSTER.diagnosetyp.v0#diagnoseTyp") | [**Typ** `at0001`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseTyp "CLUSTER.diagnosetyp.v0#diagnoseTyp") | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/DiagnoseTyp`; only if openEHR `items[at0001]` is not empty |
| [`….coding`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseTypSystem "CLUSTER.diagnosetyp.v0#diagnoseTypSystem") | [**Typ** `at0001`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseTypSystem "CLUSTER.diagnosetyp.v0#diagnoseTypSystem") | fixed | system = `http://fhir.de/CodeSystem/DiagnoseTyp` |
| [`….coding`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseSubTyp "CLUSTER.diagnosetyp.v0#diagnoseSubTyp") | [**Subtyp** `at0002`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseSubTyp "CLUSTER.diagnosetyp.v0#diagnoseSubTyp") | direct | only if FHIR `system` one of `http://fhir.de/CodeSystem/Diagnosesubtyp`; only if openEHR `items[at0002]` is not empty |
| [`….coding`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseSubTypSystem "CLUSTER.diagnosetyp.v0#diagnoseSubTypSystem") | [**Subtyp** `at0002`](../../../../model/cluster/org.highmed/diagnoseTyp.yml#diagnoseSubTypSystem "CLUSTER.diagnosetyp.v0#diagnoseSubTypSystem") | fixed | system = `http://fhir.de/CodeSystem/Diagnosesubtyp` |

## Organisationseinheit — CLUSTER.organization.v0

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….type`](../../../../model/cluster/org.highmed/organization.v0.yml#type "CLUSTER.organization.v0#type") | [**Typ** `at0051`](../../../../model/cluster/org.highmed/organization.v0.yml#type "CLUSTER.organization.v0#type") | direct |  |
| [`…`](../../../../model/cluster/org.highmed/organization.v0.yml#orgaKey "CLUSTER.organization.v0#orgaKey") | [**Organisationsschlüssel** `at0024`](../../../../model/cluster/org.highmed/organization.v0.yml#orgaKey "CLUSTER.organization.v0#orgaKey") | direct |  |
| [`….name`](../../../../model/cluster/org.highmed/organization.v0.yml#name "CLUSTER.organization.v0#name") | [**Name** `at0052`](../../../../model/cluster/org.highmed/organization.v0.yml#name "CLUSTER.organization.v0#name") | direct |  |

## Standort — CLUSTER.location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….location.identifier`](../../../../model/cluster/org.openehr/location.v1.yml#station "CLUSTER.location.v1#station") | [**Station** `at0027`](../../../../model/cluster/org.openehr/location.v1.yml#station "CLUSTER.location.v1#station") | direct |  |
| [`….physicalType.coding`](../../../../model/cluster/org.openehr/location.v1.yml#hardcodingStationSystem "CLUSTER.location.v1#hardcodingStationSystem") |  | fixed | system = `http://terminology.hl7.org/CodeSystem/location-physical-type`, code = `wa`; only if openEHR `items[at0027]` is not empty |
| [`….status`](../../../../model/cluster/org.openehr/location.v1.yml#status "CLUSTER.location.v1#status") | [**Status** `at0046`](../../../../model/cluster/org.openehr/location.v1.yml#status "CLUSTER.location.v1#status") | direct | only if openEHR `items[at0027]` is not empty |
| [`….location.identifier`](../../../../model/cluster/org.openehr/location.v1.yml#room "CLUSTER.location.v1#room") | [**Zimmer** `at0029`](../../../../model/cluster/org.openehr/location.v1.yml#room "CLUSTER.location.v1#room") | direct |  |
| [`….physicalType.coding`](../../../../model/cluster/org.openehr/location.v1.yml#hardcodingRoomSystem "CLUSTER.location.v1#hardcodingRoomSystem") |  | fixed | system = `http://terminology.hl7.org/CodeSystem/location-physical-type`, code = `ro`; only if openEHR `items[at0029]` is not empty |
| [`….status`](../../../../model/cluster/org.openehr/location.v1.yml#status "CLUSTER.location.v1#status") | [**Status** `at0046`](../../../../model/cluster/org.openehr/location.v1.yml#status "CLUSTER.location.v1#status") | direct | only if openEHR `items[at0029]` is not empty |
| [`….location.identifier`](../../../../model/cluster/org.openehr/location.v1.yml#station "CLUSTER.location.v1#station") | [**Bettstellplatz** `at0034`](../../../../model/cluster/org.openehr/location.v1.yml#station "CLUSTER.location.v1#station") | direct |  |
| [`….physicalType.coding`](../../../../model/cluster/org.openehr/location.v1.yml#hardcodingBedSystem "CLUSTER.location.v1#hardcodingBedSystem") |  | fixed | system = `http://terminology.hl7.org/CodeSystem/location-physical-type`, code = `bd`; only if openEHR `items[at0034]` is not empty |
| [`….status`](../../../../model/cluster/org.openehr/location.v1.yml#status "CLUSTER.location.v1#status") | [**Status** `at0046`](../../../../model/cluster/org.openehr/location.v1.yml#status "CLUSTER.location.v1#status") | direct | only if openEHR `items[at0034]` is not empty |

## Anatomische Lokalisation — CLUSTER.anatomical_location.v1

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….text`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteText "CLUSTER.anatomical_location.v1#bodySiteText") | [**Name der Körperstelle** `at0001`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteText "CLUSTER.anatomical_location.v1#bodySiteText") | direct | only if FHIR `coding` is empty |
| [`…`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteCoded "CLUSTER.anatomical_location.v1#bodySiteCoded") | [**Name der Körperstelle** `at0001`](../../../../model/cluster/org.openehr/anatomical_location.v1.yml#bodySiteCoded "CLUSTER.anatomical_location.v1#bodySiteCoded") | direct | only if openEHR `items[at0001]` type `DV_CODED_TEXT` |
| [`….value (Coding)`](../diagnose/KDS_anatomical_location.yml#seitenlokalisation "KDS_anatomical_location#seitenlokalisation") | [**Lateralität** `at0002`](../diagnose/KDS_anatomical_location.yml#seitenlokalisation "KDS_anatomical_location#seitenlokalisation") | direct | only if FHIR `` type `Extension`; *KDS_anatomical_location* |

## KDS_Fall_einfach — COMPOSITION.fall.v1.encounter

| FHIR | openEHR | how | notes |
|---|---|---|---|
| [`….serviceProvider`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#healthcareFacility "COMPOSITION.fall.v1.encounter#healthcareFacility") | [composition · `context/health_care_facility`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#healthcareFacility "COMPOSITION.fall.v1.encounter#healthcareFacility") | direct |  |
| [`….period.start`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#contextStart "COMPOSITION.fall.v1.encounter#contextStart") | [composition · start time](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#contextStart "COMPOSITION.fall.v1.encounter#contextStart") | direct |  |
| [`….period.end`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#contextEnd "COMPOSITION.fall.v1.encounter#contextEnd") | [composition · end time](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#contextEnd "COMPOSITION.fall.v1.encounter#contextEnd") | direct |  |
| [`…`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#effectiveStart "COMPOSITION.fall.v1.encounter#effectiveStart") | [composition · start time](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#effectiveStart "COMPOSITION.fall.v1.encounter#effectiveStart") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271` |
| [`….serviceProvider`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#composer "COMPOSITION.fall.v1.encounter#composer") | [composition · composer](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#composer "COMPOSITION.fall.v1.encounter#composer") | direct |  |
| [`….serviceProvider`](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#composerEmpty "COMPOSITION.fall.v1.encounter#composerEmpty") | [composition · composer](../../../../model/composition/org.highmed/fall.v1.Encounter.yml#composerEmpty "COMPOSITION.fall.v1.encounter#composerEmpty") | fixed | openEHR null_flavour/value = `no information`, null_flavour/defining_code/terminology_id = `openehr`, null_flavour/defining_code/code_string = `271`; only if FHIR `serviceProvider` is empty |
| [`….type`](KDS_composition.yml#falltyp "KDS_composition#falltyp") | [composition · `context/other_context[at0001]/items[at0005]`](KDS_composition.yml#falltyp "KDS_composition#falltyp") | direct | *KDS_composition* |
| [`….class`](KDS_composition.yml#fallklasse "KDS_composition#fallklasse") | [composition · `context/other_context[at0001]/items[at0004]`](KDS_composition.yml#fallklasse "KDS_composition#fallklasse") | direct | *KDS_composition* |
| [`….status`](KDS_composition.yml#fallstatus "KDS_composition#fallstatus") | [composition · `context/other_context[at0001]/items[at0010]`](KDS_composition.yml#fallstatus "KDS_composition#fallstatus") | direct | *KDS_composition* |
| [`….identifier`](KDS_composition.yml#fallIdParent "KDS_composition#fallIdParent") | [composition · `context/other_context[at0001]/items[at0003]`](KDS_composition.yml#fallIdParent "KDS_composition#fallIdParent") | direct | only if FHIR `type.coding.code` one of `VN`; *KDS_composition* |
| [`….identifier.type.coding`](KDS_composition.yml#vncodingcode "KDS_composition#vncodingcode") | [composition · `context/other_context[at0001]/items[at0003]`](KDS_composition.yml#vncodingcode "KDS_composition#vncodingcode") | fixed | code = `VN`, system = `http://terminology.hl7.org/CodeSystem/v2-0203`; *KDS_composition* |

---
*Generated from the mapping YAML with `fhirconnect-mapping/scripts/mapping_readme.py`. Regenerate after changing a mapping.*
