Profile:        IHE_PCC_MedicalDocument_ClinicalDocument
Parent:         http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument
Id:             IHE.PCC.MD.ClinicalDocument.MedicalDocument 
Title:          "IHE Medical Document CDA"
Description:    """
This section defines the base set of constraints used by almost all medical document profiles described in the PCC Technical Framework.

This Document header takes all the header constraints from HL7's history and Pysical header contraints, and deconstrains the Template ID requirements for US realm and histroy and physical.
It does not take in the section requirments from the History and physical

Note: Starting from template of US-realm header and deconstraining US specific  constraints (including invariants)
"""

//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.1.1:2024-05-01"
//* ^status = #draft
* obeys 4537-6380 and 4537-6387 and should-legalAuthenticator and should-relatedParticipant
* realmCode MS
* realmCode ^comment = "SHALL contain exactly one [1..1] realmCode=\"uv \". SHOULD be In universal Realm Unless constrained by Vol4 Elements"
* typeId 1.. MS
* typeId ^comment = "SHALL contain exactly one [1..1] typeId (CONF:4537-5361)."
* typeId.root ^comment = "This typeId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.1.3\" (CONF:4537-5250)."
* typeId.extension ^comment = "This typeId SHALL contain exactly one [1..1] @extension=\"POCD_HD000040\" (CONF:4537-5251)."
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains  
     uv-realm 1..1 and 
     us-realm 0..1
* templateId[uv-realm].root 1..
* templateId[uv-realm].root = "1.3.6.1.4.1.19376.1.5.3.1.1.1"
* templateId[uv-realm].extension 1..
* templateId[uv-realm].extension = "2025-10-20"
* templateId[us-realm].root 1..
* templateId[us-realm].root = "2.16.840.1.113883.10.20.22.1.1"
* templateId[us-realm].extension 1..
* templateId[us-realm].extension = "2024-05-01"
* id ^short = "**SHALL** be a globally unique identifier for the document (CONF:4537-9991)."
* id ^comment = "SHALL contain exactly one [1..1] id (CONF:4537-5363)."
* code ^short = "**SHALL** specify the particular kind of document (e.g., History and Physical, Discharge Summary, Progress Note) (CONF:4537-9992)."
* code ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-5253)."
* code.nullFlavor ..0
* code.code 1..
* code.codeSystem 1..
* code.codeSystem = "2.16.840.1.113883.6.1"
* title MS
* title ^short = "The title can either be a locally defined name or the displayName corresponding to clinicalDocument/code"
* title ^comment = "SHALL contain exactly one [1..1] title (CONF:4537-5254)."
* effectiveTime MS 
* confidentialityCode.nullFlavor ..0
* confidentialityCode.code 1..
* confidentialityCode.code from $2.16.840.1.113883.1.11.16926 (preferred)
* languageCode 1..
* languageCode ^comment = "SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet AllLanguages https://www.hl7.org/fhir/valueset-all-languages.html (OID 2.16.840.1.113883.4.642.3.21) DYNAMIC."
* setId ^comment = "MAY contain zero or one [0..1] setId (CONF:4537-5261)."
* versionNumber ^comment = "MAY contain zero or one [0..1] versionNumber (CONF:4537-5264)."
* recordTarget ^short = "The recordTarget records the administrative and demographic data of the patient whose health information is described by the clinical document; each recordTarget must contain at least one patientRole element"
* recordTarget ^comment = "SHALL contain at least one [1..*] recordTarget (CONF:4537-5266)."
* recordTarget.patientRole ^comment = "Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:4537-5267)."
* recordTarget.patientRole.id ^comment = "This patientRole SHALL contain at least one [1..*] id (CONF:4537-5268)."
* recordTarget.patientRole.addr 1..
* recordTarget.patientRole.telecom 1..
* recordTarget.patientRole.telecom obeys should-use
* recordTarget.patientRole.telecom.use ..1
* recordTarget.patientRole.patient 1..
* recordTarget.patientRole.patient obeys 4537-32993 and 4537-21000 and should-maritalStatusCode and should-us-languageCommunication
* recordTarget.patientRole.patient ^comment = "This patientRole SHALL contain exactly one [1..1] patient (CONF:4537-5283)."
* recordTarget.patientRole.patient.name 1..
* recordTarget.patientRole.patient.birthTime 1..
* recordTarget.patientRole.patient.birthTime obeys ts-shall-year and ts-should-day
//* recordTarget.patientRole.patient.birthTime ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.birthTime ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.birthTime ^short = "𝗨𝗦𝗖𝗗𝗜: Date of Birth - **MAY** be precise to the minute (CONF:4537-32418) (For cases where information about newborn's time of birth needs to be captured)"
//* recordTarget.patientRole.patient.birthTime ^comment = "This patient SHALL contain exactly one [1..1] birthTime (CONF:4537-5298)."
//* recordTarget.patientRole.patient.sdtcDeceasedInd ^short = "sdtc:deceasedInd"
//* recordTarget.patientRole.patient.sdtcDeceasedInd ^comment = "This patient MAY contain zero or one [0..1] sdtc:deceasedInd (CONF:4537-32990)."
* recordTarget.patientRole.patient.sdtcDeceasedTime obeys should-value-att and ts-shall-year and ts-should-day
* recordTarget.patientRole.patient.sdtcDeceasedTime ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/xml-namespace"
* recordTarget.patientRole.patient.sdtcDeceasedTime ^extension[=].valueUri = "urn:hl7-org:sdtc"
* recordTarget.patientRole.patient.sdtcDeceasedTime ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/xml-name"
* recordTarget.patientRole.patient.sdtcDeceasedTime ^extension[=].valueString = "deceasedTime"
//* recordTarget.patientRole.patient.sdtcDeceasedTime ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.sdtcDeceasedTime ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.sdtcDeceasedTime ^short = "𝗨𝗦𝗖𝗗𝗜: Date of Death"
//* recordTarget.patientRole.patient.sdtcDeceasedTime ^comment = "This patient MAY contain zero or one [0..1] sdtc:deceasedTime (CONF:4537-32988)."
* recordTarget.patientRole.patient.maritalStatusCode from $2.16.840.1.113883.1.11.12212 (required)
* recordTarget.patientRole.patient.maritalStatusCode ^comment = "This patient SHOULD contain zero or one [0..1] maritalStatusCode, which SHALL be selected from ValueSet Marital Status urn:oid:2.16.840.1.113883.1.11.12212 DYNAMIC (CONF:4537-5303)."
* recordTarget.patientRole.patient.religiousAffiliationCode from $2.16.840.1.113883.1.11.19185 (required)
* recordTarget.patientRole.patient.religiousAffiliationCode ^comment = "This patient MAY contain zero or one [0..1] religiousAffiliationCode, which SHALL be selected from ValueSet Religious Affiliation urn:oid:2.16.840.1.113883.1.11.19185 DYNAMIC (CONF:4537-5317)."
* recordTarget.patientRole.patient.raceCode 0..
* recordTarget.patientRole.patient.raceCode from $2.16.840.1.113883.4.642.2.575 (example)
//* recordTarget.patientRole.patient.raceCode ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.raceCode ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.raceCode ^short = "𝗨𝗦𝗖𝗗𝗜: Race"
* recordTarget.patientRole.patient.sdtcRaceCode from $2.16.840.1.113762.1.4.1267.25 (example)
* recordTarget.patientRole.patient.sdtcRaceCode ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/xml-namespace"
* recordTarget.patientRole.patient.sdtcRaceCode ^extension[=].valueUri = "urn:hl7-org:sdtc"
* recordTarget.patientRole.patient.sdtcRaceCode ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/xml-name"
* recordTarget.patientRole.patient.sdtcRaceCode ^extension[=].valueString = "raceCode"
//* recordTarget.patientRole.patient.sdtcRaceCode ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.sdtcRaceCode ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.sdtcRaceCode ^short = "𝗨𝗦𝗖𝗗𝗜: Race - The sdtc:raceCode is only used to record additional values when the patient has indicated multiple races or additional race detail beyond the five categories required for Meaningful Use Stage 2. The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the additional raceCode elements."
* recordTarget.patientRole.patient.ethnicGroupCode 0..
* recordTarget.patientRole.patient.ethnicGroupCode from $2.16.840.1.113883.4.642.40.2.48.3 (example)
//* recordTarget.patientRole.patient.ethnicGroupCode ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.ethnicGroupCode ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.ethnicGroupCode ^short = "𝗨𝗦𝗖𝗗𝗜: Ethnicity"
* recordTarget.patientRole.patient.sdtcEthnicGroupCode from $2.16.840.1.113883.4.642.40.2.48.1 (example)
* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/xml-namespace"
* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^extension[=].valueUri = "urn:hl7-org:sdtc"
* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/xml-name"
* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^extension[=].valueString = "ethnicGroupCode"
//* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.sdtcEthnicGroupCode ^short = "𝗨𝗦𝗖𝗗𝗜: Ethnicity"
* recordTarget.patientRole.patient.guardian obeys should-us-code and should-us-addr and should-us-telecom
* recordTarget.patientRole.patient.guardian ^comment = "This patient MAY contain zero or more [0..*] guardian (CONF:4537-5325)."
* recordTarget.patientRole.patient.guardian.code from $2.16.840.1.113883.11.20.12.1 (required)
* recordTarget.patientRole.patient.guardian.code ^comment = "The guardian, if present, SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:4537-5326)."
* recordTarget.patientRole.patient.guardian.addr MS
* recordTarget.patientRole.patient.guardian.telecom obeys should-use
* recordTarget.patientRole.patient.guardian.telecom ^comment = "The guardian, if present, SHOULD contain zero or more [0..*] telecom (CONF:4537-5382)."
* recordTarget.patientRole.patient.guardian.telecom.use ..1
* recordTarget.patientRole.patient.guardian.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* recordTarget.patientRole.patient.guardian.telecom.use ^comment = "The telecom, if present, SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7993)."
* recordTarget.patientRole.patient.guardian.guardianPerson 1..
* recordTarget.patientRole.patient.guardian.guardianPerson ^comment = "The guardian, if present, SHALL contain exactly one [1..1] guardianPerson (CONF:4537-5385)."
* recordTarget.patientRole.patient.guardian.guardianPerson.name 1..
* recordTarget.patientRole.patient.birthplace ^comment = "This patient MAY contain zero or one [0..1] birthplace (CONF:4537-5395)."
* recordTarget.patientRole.patient.birthplace.place ^comment = "The birthplace, if present, SHALL contain exactly one [1..1] place (CONF:4537-5396)."
* recordTarget.patientRole.patient.birthplace.place.addr 1..
* recordTarget.patientRole.patient.birthplace.place.addr obeys should-country
* recordTarget.patientRole.patient.birthplace.place.addr ^comment = "This place SHALL contain exactly one [1..1] addr (CONF:4537-5397)."
* recordTarget.patientRole.patient.birthplace.place.addr.item.country from Country2 (example)
* recordTarget.patientRole.patient.languageCommunication obeys should-proficiencyLevelCode and should-preferenceInd
//* recordTarget.patientRole.patient.languageCommunication ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
//* recordTarget.patientRole.patient.languageCommunication ^extension[=].valueBoolean = true
//* recordTarget.patientRole.patient.languageCommunication ^short = "𝗨𝗦𝗖𝗗𝗜: Preferred Language"
* recordTarget.patientRole.patient.languageCommunication.languageCode 1..
* recordTarget.patientRole.patient.languageCommunication.languageCode from Languages (required)
* recordTarget.patientRole.patient.languageCommunication.modeCode from $2.16.840.1.113883.1.11.12249 (required)
* recordTarget.patientRole.patient.languageCommunication.modeCode ^comment = "The languageCommunication, if present, MAY contain zero or one [0..1] modeCode, which SHALL be selected from ValueSet LanguageAbilityMode urn:oid:2.16.840.1.113883.1.11.12249 DYNAMIC (CONF:4537-5409)."
* recordTarget.patientRole.patient.languageCommunication.proficiencyLevelCode from $2.16.840.1.113883.1.11.12199 (example)
* recordTarget.patientRole.patient.languageCommunication.proficiencyLevelCode ^comment = "The languageCommunication, if present, SHOULD contain zero or one [0..1] proficiencyLevelCode, which SHALL be selected from ValueSet LanguageAbilityProficiency urn:oid:2.16.840.1.113883.1.11.12199 DYNAMIC (CONF:4537-9965)."
* recordTarget.patientRole.patient.languageCommunication.preferenceInd ^comment = "The languageCommunication, if present, SHOULD contain zero or one [0..1] preferenceInd (CONF:4537-5414)."
* recordTarget.patientRole.providerOrganization ^comment = "This patientRole MAY contain zero or one [0..1] providerOrganization (CONF:4537-5416)."
* recordTarget.patientRole.providerOrganization.id 1..
* recordTarget.patientRole.providerOrganization.id ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] id (CONF:4537-5417)."
* recordTarget.patientRole.providerOrganization.id.root obeys may-npi
* recordTarget.patientRole.providerOrganization.id.root ^comment = "Such ids MAY contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16820)."
* recordTarget.patientRole.providerOrganization.name 1..
* recordTarget.patientRole.providerOrganization.name ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] name (CONF:4537-5419)."
* recordTarget.patientRole.providerOrganization.telecom 1..
* recordTarget.patientRole.providerOrganization.telecom obeys should-use
* recordTarget.patientRole.providerOrganization.telecom ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:4537-5420)."
* recordTarget.patientRole.providerOrganization.telecom.use ..1
* recordTarget.patientRole.providerOrganization.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* recordTarget.patientRole.providerOrganization.telecom.use ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7994)."
* recordTarget.patientRole.providerOrganization.addr 1..
* author ^short = "The author element represents the creator of the clinical document.  The author may be a device or a person."
* author ^comment = "SHALL contain at least one [1..*] author (CONF:4537-5444)."
* author.time MS
* author.assignedAuthor obeys 4537-16790 and may-id-npi and should-us-code
* author.assignedAuthor ^comment = "Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:4537-5448)."
* author.assignedAuthor.id ^slicing.discriminator[+].type = #value
* author.assignedAuthor.id ^slicing.discriminator[=].path = "root"
* author.assignedAuthor.id ^slicing.rules = #open
* author.assignedAuthor.id ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] id (CONF:4537-32882) such that it, This assignedAuthor SHALL contain at least one [1..*] id (CONF:4537-5449)."
* author.assignedAuthor.id contains npi 0..1
* author.assignedAuthor.id[npi] obeys should-extension
* author.assignedAuthor.id[npi].nullFlavor ^short = "If NPI is unknown, set @nullFlavor to UNK"
* author.assignedAuthor.id[npi].root 1..
* author.assignedAuthor.id[npi].root = "2.16.840.1.113883.4.6"
* author.assignedAuthor.id[npi].root ^comment = "MAY contain exactly one [1..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-32884)."
* author.assignedAuthor.id[npi].extension ^comment = "SHOULD contain zero or one [0..1] @extension (CONF:4537-32885)."
* author.assignedAuthor.code ^short = "Only if this assignedAuthor is an assignedPerson should the assignedAuthor contain a code."
* author.assignedAuthor.code ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:4537-16787)."
* author.assignedAuthor.code.nullFlavor ..0
* author.assignedAuthor.code.code 1..
* author.assignedAuthor.code.code from $2.16.840.1.114222.4.11.1066 (preferred)
* author.assignedAuthor.addr 1..
* author.assignedAuthor.telecom 1..
* author.assignedAuthor.telecom obeys should-use
* author.assignedAuthor.telecom ^comment = "This assignedAuthor SHALL contain at least one [1..*] telecom (CONF:4537-5428)."
* author.assignedAuthor.telecom.use ..1
* author.assignedAuthor.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* author.assignedAuthor.telecom.use ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7995)."
* author.assignedAuthor.assignedPerson ^comment = "MAY contain assignedPerson"
* author.assignedAuthor.assignedPerson.name 1..
* author.assignedAuthor.assignedAuthoringDevice ^comment = "MAY contain assignedAuthoringDevice"
* author.assignedAuthor.assignedAuthoringDevice.manufacturerModelName 1..
* author.assignedAuthor.assignedAuthoringDevice.manufacturerModelName ^comment = "The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] manufacturerModelName (CONF:4537-16784)."
* author.assignedAuthor.assignedAuthoringDevice.softwareName 1..
* author.assignedAuthor.assignedAuthoringDevice.softwareName ^comment = "The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:4537-16785)."
* dataEnterer ^short = "The dataEnterer element represents the person who transferred the content, written or dictated, into the clinical document. To clarify, an author provides the content found within the header or body of a document, subject to their own interpretation; a dataEnterer adds an author's information to the electronic system."
* dataEnterer ^comment = "MAY contain zero or one [0..1] dataEnterer (CONF:4537-5441)."
* dataEnterer.time MS
* dataEnterer.assignedEntity ^comment = "The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5442)."
* dataEnterer.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5443)."
* dataEnterer.assignedEntity.id.root obeys may-npi
* dataEnterer.assignedEntity.id.root ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16821)."
* dataEnterer.assignedEntity.code from $2.16.840.1.114222.4.11.1066 (preferred)
* dataEnterer.assignedEntity.code ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-32173)."
* dataEnterer.assignedEntity.addr 1..
* dataEnterer.assignedEntity.addr MS 
* dataEnterer.assignedEntity.telecom 1..
* dataEnterer.assignedEntity.telecom obeys should-use
* dataEnterer.assignedEntity.telecom ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5466)."
* dataEnterer.assignedEntity.telecom.use ..1
* dataEnterer.assignedEntity.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* dataEnterer.assignedEntity.telecom.use ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7996)."
* dataEnterer.assignedEntity.assignedPerson 1..
* dataEnterer.assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5469)."
* dataEnterer.assignedEntity.assignedPerson.name 1..
* informant ^slicing.discriminator[+].type = #exists
* informant ^slicing.discriminator[=].path = "relatedEntity"
* informant ^slicing.discriminator[+].type = #exists
* informant ^slicing.discriminator[=].path = "assignedEntity"
* informant ^slicing.rules = #open
* informant ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-31355) such that it"
* informant contains
    provider 0..* and
    non-provider 0..*
* informant[provider] ^short = "The informant element describes an information source for any content within the clinical document. This informant is constrained for use when the source of information is an assigned health care provider for the patient."
* informant[provider] ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-8001) such that it"
* informant[provider].assignedEntity 1..
* informant[provider].assignedEntity ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8002)."
* informant[provider].assignedEntity.id ^short = "If assignedEntity/id is a provider then this id, **SHOULD** include zero or one [0..1] id where id/@root =\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-9946)."
* informant[provider].assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-9945)."
* informant[provider].assignedEntity.code from $2.16.840.1.114222.4.11.1066 (preferred)
* informant[provider].assignedEntity.code ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-32174)."
* informant[provider].assignedEntity.addr 1..
* informant[provider].assignedEntity.addr MS 
* informant[provider].assignedEntity.assignedPerson 1..
* informant[provider].assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-8221)."
* informant[provider].assignedEntity.assignedPerson.name 1..
* informant[provider].assignedEntity.assignedPerson.name MS 
* informant[provider].relatedEntity ..0
* informant[non-provider] ^short = "The informant element describes an information source (who is not a provider) for any content within the clinical document. This informant would be used when the source of information has a personal relationship with the patient or is the patient."
* informant[non-provider].assignedEntity ..0
* informant[non-provider].relatedEntity 1..
* informant[non-provider].relatedEntity ^comment = "SHALL contain exactly one [1..1] relatedEntity (CONF:4537-31356)."
* custodian ^short = "The custodian element represents the organization that is in charge of maintaining and is entrusted with the care of the document.\n\n  There is only one custodian per CDA document. Allowing that a CDA document may not represent the original form of the authenticated document, the custodian represents the steward of the original source document. The custodian may be the document originator, a health information exchange, or other responsible party."
* custodian ^comment = "SHALL contain exactly one [1..1] custodian (CONF:4537-5519)."
* custodian.assignedCustodian ^comment = "This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:4537-5520)."
* custodian.assignedCustodian.representedCustodianOrganization ^comment = "This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:4537-5521)."
* custodian.assignedCustodian.representedCustodianOrganization.id ^comment = "This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:4537-5522)."
* custodian.assignedCustodian.representedCustodianOrganization.id.root obeys may-npi
* custodian.assignedCustodian.representedCustodianOrganization.id.root ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" Provider Identifier (CONF:4537-16822)."
* custodian.assignedCustodian.representedCustodianOrganization.name 1..
* custodian.assignedCustodian.representedCustodianOrganization.name ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] name (CONF:4537-5524)."
* custodian.assignedCustodian.representedCustodianOrganization.telecom 1..
* custodian.assignedCustodian.representedCustodianOrganization.telecom obeys should-use
* custodian.assignedCustodian.representedCustodianOrganization.telecom ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] telecom (CONF:4537-5525)."
* custodian.assignedCustodian.representedCustodianOrganization.telecom.use ..1
* custodian.assignedCustodian.representedCustodianOrganization.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* custodian.assignedCustodian.representedCustodianOrganization.telecom.use ^comment = "This telecom SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7998)."
* custodian.assignedCustodian.representedCustodianOrganization.sdtcTelecom ^short = "The stdc:telecom extension can be used to provide additional telecom elements for the custodian organization."
* custodian.assignedCustodian.representedCustodianOrganization.addr 1..
* custodian.assignedCustodian.representedCustodianOrganization.addr MS 
* informationRecipient ^short = "The informationRecipient element records the intended recipient of the information at the time the document was created. In cases where the intended recipient of the document is the patient's health chart, set the receivedOrganization to the scoping organization for that chart."
* informationRecipient ^comment = "MAY contain zero or more [0..*] informationRecipient (CONF:4537-5565)."
* informationRecipient.intendedRecipient ^comment = "The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:4537-5566)."
* informationRecipient.intendedRecipient.id ^comment = "This intendedRecipient MAY contain zero or more [0..*] id (CONF:4537-32399)."
* informationRecipient.intendedRecipient.informationRecipient ^comment = "This intendedRecipient MAY contain zero or one [0..1] informationRecipient (CONF:4537-5567)."
* informationRecipient.intendedRecipient.informationRecipient.name 1..
* informationRecipient.intendedRecipient.receivedOrganization ^comment = "This intendedRecipient MAY contain zero or one [0..1] receivedOrganization (CONF:4537-5577)."
* informationRecipient.intendedRecipient.receivedOrganization.name 1..1
* informationRecipient.intendedRecipient.receivedOrganization.name ^comment = "The receivedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:4537-5578)."
* legalAuthenticator ^short = "The legalAuthenticator identifies the single person legally responsible for the document and must be present if the document has been legally authenticated. A clinical document that does not contain this element has not been legally authenticated. The act of legal authentication requires a certain privilege be granted to the legal authenticator depending upon local policy. Based on local practice, clinical documents may be released before legal authentication.  All clinical documents have the potential for legal authentication, given the appropriate credentials. Local policies MAY choose to delegate the function of legal authentication to a device or system that generates the clinical document. In these cases, the legal authenticator is a person accepting responsibility for the document, not the generating device or system. Note that the legal authenticator, if present, must be a person."
* legalAuthenticator ^comment = "SHOULD contain zero or one [0..1] legalAuthenticator (CONF:4537-5579)."
* legalAuthenticator.time MS 
* legalAuthenticator.signatureCode ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:4537-5583)."
* legalAuthenticator.signatureCode.code 1..
* legalAuthenticator.signatureCode.code = #S
* legalAuthenticator.signatureCode.code ^comment = "This signatureCode SHALL contain exactly one [1..1] @code=\"S\" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4537-5584)."
* legalAuthenticator.sdtcSignatureText ^short = "The signature can be represented either inline or by reference according to the ED data type. Typical cases for CDA are:\n1) Electronic signature: this attribute can represent virtually any electronic signature scheme.\n2) Digital signature: this attribute can represent digital signatures by reference to a signature data block that is constructed in accordance to a digital signature standard, such as XML-DSIG, PKCS#7, PGP, etc.\n The sdtc:signatureText extension provides a location in CDA for a textual or multimedia depiction of the signature by which the participant endorses and accepts responsibility for his or her participation in the Act as specified in the Participation.typeCode. Details of what goes in the field are described in the HL7 CDA Digital Signature Standard balloted in Fall 2013."
* legalAuthenticator.sdtcSignatureText ^comment = "The legalAuthenticator, if present, MAY contain zero or one [0..1] sdtc:signatureText (CONF:4537-30810)."
* legalAuthenticator.assignedEntity ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5585)."
* legalAuthenticator.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5586)."
* legalAuthenticator.assignedEntity.id.root ^short = "MAY contain '2.16.840.1.113883.4.6' (NPI)"
* legalAuthenticator.assignedEntity.id.root ^comment = "Such ids MAY contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16823)."
* legalAuthenticator.assignedEntity.code from $2.16.840.1.114222.4.11.1066 (preferred)
* legalAuthenticator.assignedEntity.code ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-17000)."
* legalAuthenticator.assignedEntity.addr 1..
* legalAuthenticator.assignedEntity.addr MS 
* legalAuthenticator.assignedEntity.telecom 1..
* legalAuthenticator.assignedEntity.telecom obeys should-use
* legalAuthenticator.assignedEntity.telecom ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5595)."
* legalAuthenticator.assignedEntity.telecom.use ..1
* legalAuthenticator.assignedEntity.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* legalAuthenticator.assignedEntity.telecom.use ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use  urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7999)."
* legalAuthenticator.assignedEntity.assignedPerson 1..
* legalAuthenticator.assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5597)."
* legalAuthenticator.assignedEntity.assignedPerson.name 1..
* authenticator ^short = "The authenticator identifies a participant or participants who attest to the accuracy of the information in the document."
* authenticator.time MS
* authenticator.signatureCode ^comment = "SHALL contain exactly one [1..1] signatureCode (CONF:4537-5610)."
* authenticator.signatureCode.code 1..
* authenticator.signatureCode.code = #S
* authenticator.signatureCode.code ^comment = "This signatureCode SHALL contain exactly one [1..1] @code=\"S\" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4537-5611)."
* authenticator.sdtcSignatureText ^short = "The signature can be represented either inline or by reference according to the ED data type. Typical cases for CDA are:\n1) Electronic signature: this attribute can represent virtually any electronic signature scheme.\n2) Digital signature: this attribute can represent digital signatures by reference to a signature data block that is constructed in accordance to a digital signature standard, such as XML-DSIG, PKCS#7, PGP, etc.\n The sdtc:signatureText extension provides a location in CDA for a textual or multimedia depiction of the signature by which the participant endorses and accepts responsibility for his or her participation in the Act as specified in the Participation.typeCode. Details of what goes in the field are described in the HL7 CDA Digital Signature Standard balloted in Fall of 2013."
* authenticator.sdtcSignatureText ^comment = "MAY contain zero or one [0..1] sdtc:signatureText (CONF:4537-30811)."
* authenticator.assignedEntity ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5612)."
* authenticator.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5613)."
* authenticator.assignedEntity.id.root obeys may-npi
* authenticator.assignedEntity.id.root ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" Provider Identifier  (CONF:4537-16824)."
* authenticator.assignedEntity.code ^comment = "This assignedEntity MAY contain zero or one [0..1] code (CONF:4537-16825)."
* authenticator.assignedEntity.code.code from $2.16.840.1.114222.4.11.1066 (preferred)
* authenticator.assignedEntity.code.code ^comment = "The code, if present, MAY contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-16826)."
* authenticator.assignedEntity.addr 1..
* authenticator.assignedEntity.addr MS
* authenticator.assignedEntity.telecom 1..
* authenticator.assignedEntity.telecom obeys should-use
* authenticator.assignedEntity.telecom ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5622)."
* authenticator.assignedEntity.telecom.use ..1
* authenticator.assignedEntity.telecom.use from $2.16.840.1.113883.11.20.9.20 (required)
* authenticator.assignedEntity.telecom.use ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-8000)."
* authenticator.assignedEntity.assignedPerson 1..
* authenticator.assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5624)."
* authenticator.assignedEntity.assignedPerson.name 1..
* authenticator.assignedEntity.assignedPerson.name MS 
* participant obeys 4537-10006 and 4537-10007
* participant ^short = "The participant element identifies supporting entities, including parents, relatives, caregivers, insurance policyholders, guarantors, and others related in some way to the patient. A supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)."
* participant ^comment = "SHOULD contain zero or more [0..*] RelatedPerson participant"
* participant.time MS
* participant.time ^comment = "MAY contain zero or one [0..1] time (CONF:4537-10004)."
* inFulfillmentOf ^short = "The inFulfillmentOf element represents orders that are fulfilled by this document such as a radiologists' report of an x-ray."
* inFulfillmentOf ^comment = "MAY contain zero or more [0..*] inFulfillmentOf (CONF:4537-9952)."
* inFulfillmentOf.order ^comment = "The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:4537-9953)."
* inFulfillmentOf.order.id ^comment = "This order SHALL contain at least one [1..*] id (CONF:4537-9954)."
* documentationOf ^comment = "MAY contain zero or more [0..*] documentationOf (CONF:4537-14835)."
* documentationOf.serviceEvent obeys should-us-performer
* documentationOf.serviceEvent ^short = "A serviceEvent represents the main act being documented, such as a colonoscopy or a cardiac stress study. In a provision of healthcare serviceEvent, the care providers, PCP, or other longitudinal providers, are recorded within the serviceEvent. If the document is about a single encounter, the providers associated can be recorded in the componentOf/encompassingEncounter template."
* documentationOf.serviceEvent ^comment = "The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:4537-14836)."
* documentationOf.serviceEvent.effectiveTime 1..
* documentationOf.serviceEvent.effectiveTime MS 
* documentationOf.serviceEvent.effectiveTime ^comment = "This serviceEvent SHALL contain exactly one [1..1] Date and Time (Interval) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:4537-14837)."
* documentationOf.serviceEvent.effectiveTime.low 1..
* documentationOf.serviceEvent.effectiveTime.low ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-14838)."
* documentationOf.serviceEvent.performer ^short = "The performer participant represents clinicians who actually and principally carry out the serviceEvent. In a transfer of care this represents the healthcare providers involved in the current or pertinent historical care of the patient. Preferably, the patient's key healthcare care team members would be listed, particularly their primary physician and any active consulting physicians, therapists, and counselors."
* documentationOf.serviceEvent.performer ^comment = "This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:4537-14839)."
* documentationOf.serviceEvent.performer.typeCode from $2.16.840.1.113883.1.11.19601 (required)
* documentationOf.serviceEvent.performer.typeCode ^comment = "The performer, if present, SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ServiceEventPerformer urn:oid:2.16.840.1.113883.1.11.19601 STATIC (CONF:4537-14840)."
* documentationOf.serviceEvent.performer.functionCode obeys should-code-attr
* documentationOf.serviceEvent.performer.functionCode ^comment = "The performer, if present, MAY contain zero or one [0..1] functionCode (CONF:4537-16818)."
* documentationOf.serviceEvent.performer.functionCode.code from $2.16.840.1.113762.1.4.1099.30 (preferred)
* documentationOf.serviceEvent.performer.functionCode.code ^comment = "The functionCode, if present, SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Care Team Member Function urn:oid:2.16.840.1.113762.1.4.1099.30 DYNAMIC (CONF:4537-32889)."
* documentationOf.serviceEvent.performer.time MS
* documentationOf.serviceEvent.performer.assignedEntity obeys should-us-code
* documentationOf.serviceEvent.performer.assignedEntity ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-14841)."
* documentationOf.serviceEvent.performer.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-14846)."
* documentationOf.serviceEvent.performer.assignedEntity.id.root obeys may-npi
* documentationOf.serviceEvent.performer.assignedEntity.id.root ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-14847)."
* documentationOf.serviceEvent.performer.assignedEntity.code from $2.16.840.1.114222.4.11.1066 (preferred)
* documentationOf.serviceEvent.performer.assignedEntity.code ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-14842)."
* authorization ^short = "The authorization element represents information about the patient's consent. The type of consent is conveyed in consent/code. Consents in the header have been finalized (consent/statusCode must equal Completed) and should be on file. This specification does not address how 'Privacy Consent' is represented, but does not preclude the inclusion of 'Privacy Consent'. The authorization consent is used for referring to consents that are documented elsewhere in the EHR or medical record for a health condition and/or treatment that is described in the CDA document."
* authorization ^comment = "MAY contain zero or more [0..*] authorization (CONF:4537-16792) such that it"
* authorization.consent ^comment = "SHALL contain exactly one [1..1] consent (CONF:4537-16793)."
* authorization.consent.id ^comment = "This consent MAY contain zero or more [0..*] id (CONF:4537-16794)."
* authorization.consent.code ^short = "The type of consent (e.g., a consent to perform the related serviceEvent) is conveyed in consent/code."
* authorization.consent.code ^comment = "This consent MAY contain zero or one [0..1] code (CONF:4537-16795)."
* authorization.consent.statusCode ^comment = "This consent SHALL contain exactly one [1..1] statusCode (CONF:4537-16797)."
* authorization.consent.statusCode.code ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-16798)."
* componentOf ^short = "The encompassing encounter represents the setting of the clinical encounter during which the document act(s) or ServiceEvent(s) occurred. In order to represent providers associated with a specific encounter, they are recorded within the encompassingEncounter as participants. In a CCD, the encompassingEncounter may be used when documenting a specific encounter and its participants. All relevant encounters in a CCD may be listed in the encounters section."
* componentOf ^comment = "MAY contain zero or one [0..1] componentOf (CONF:4537-9955)."
* componentOf.encompassingEncounter obeys should-responsibleParty
* componentOf.encompassingEncounter ^comment = "The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:4537-9956)."
* componentOf.encompassingEncounter.id 1..
* componentOf.encompassingEncounter.id ^comment = "This encompassingEncounter SHALL contain at least one [1..*] id (CONF:4537-9959)."
* componentOf.encompassingEncounter.code from $2.16.840.1.113762.1.4.1240.5 (preferred)
* componentOf.encompassingEncounter.code ^comment = "This encompassingEncounter MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Act Encounter Codes urn:oid:2.16.840.1.113762.1.4.1240.5 (CONF:1198-30873)."
* componentOf.encompassingEncounter.effectiveTime MS 
* componentOf.encompassingEncounter.responsibleParty ^comment = "This encompassingEncounter SHOULD contain zero or one [0..1] responsibleParty (CONF:1198-8391)."
* componentOf.encompassingEncounter.responsibleParty.assignedEntity obeys 1198-32905
* componentOf.encompassingEncounter.responsibleParty.assignedEntity ^comment = "The responsibleParty, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-32904)."


// clinical docuent Header elements
// * @classCode
//* @moodCode
//* realmCode
//* typeId
//* templateId
//* id
//* sdtcCategory
//* code
//* title
//* sdtcStatusCode
//* effectiveTime
//* confidentialityCode
//* languageCode
//* setId
//* versionNumber 	
//* copyTime
//* recordTarget
//* author
//* dataEnterer
//* informant
//* custodian
//* informationRecipient 	
//* legalAuthenticator
//* authenticator
//* participant
//* inFulfillmentOf
//* documentationOf
//* relatedDocument
//* authorization
//* componentOf
//* component











Invariant: 4537-6380
Description: "If setId is present versionNumber **SHALL** be present (CONF:4537-6380)."
* severity = #error
* expression = "setId.exists() implies versionNumber.exists()"

Invariant: 4537-6387
Description: "If versionNumber is present setId **SHALL** be present (CONF:4537-6387)."
* severity = #error
* expression = "versionNumber.exists() implies setId.exists()"

Invariant: should-legalAuthenticator
Description: "SHOULD contain legalAuthenticator"
* severity = #warning
* expression = "legalAuthenticator.exists()"

Invariant: should-relatedParticipant
Description: "Documents SHOULD contain a RelatedPerson participant"
* severity = #warning
* expression = "participant.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/RelatedPersonRelationshipAndNameParticipant').exists()"

Invariant: should-use
Description: "SHOULD contain @use"
* severity = #warning
* expression = "nullFlavor.exists() or use.exists()"

Invariant: 4537-32993
Description: "If sdtc:deceasedInd=\"true\", then sdtc:deceasedTime **SHALL** be present with either a @value or @nullFlavor=UNK (CONF:4537-32993)."
* severity = #error
* expression = "sdtcDeceasedInd.exists(value='true') implies sdtcDeceasedTime.exists()"

Invariant: 4537-21000
Description: "If sdtc:deceasedTime/@value is present, then sdtc:deceasedInd SHALL be present with value=true"
* severity = #error
* expression = "sdtcDeceasedTime.value.exists() implies sdtcDeceasedInd.exists(value='true')"

Invariant: should-maritalStatusCode
Description: "SHOULD contain maritalStatusCode"
* severity = #warning
* expression = "maritalStatusCode.exists()"

Invariant: should-us-languageCommunication
Description: "SHOULD contain languageCommunication"
* severity = #warning
* expression = "languageCommunication.exists()"

Invariant: ts-shall-year
Description: "**SHALL** be precise to at least the year"
* severity = #error
* expression = "nullFlavor.exists() or value.toString().length() >= 4"

Invariant: ts-should-day
Description: "**SHOULD** be precise to at least the day"
* severity = #warning
* expression = "nullFlavor.exists() or value.toString().length() >= 10"

Invariant: should-value-att
Description: "SHOULD contain @value"
* severity = #warning
* expression = "value.exists()"

Invariant: should-us-code
Description: "SHOULD contain code"
* severity = #warning
* expression = "code.exists()"

Invariant: should-us-addr
Description: "SHOULD contain addr"
* severity = #warning
* expression = "addr.exists()"

Invariant: should-us-telecom
Description: "SHOULD contain telecom"
* severity = #warning
* expression = "telecom.exists()"

Invariant: should-country
Description: "SHOULD contain country"
* severity = #warning
* expression = "nullFlavor.exists() or item.country.exists()"

Invariant: should-proficiencyLevelCode
Description: "SHOULD contain proficiencyLevelCode"
* severity = #warning
* expression = "proficiencyLevelCode.exists()"

Invariant: should-preferenceInd
Description: "SHOULD contain preferenceInd"
* severity = #warning
* expression = "preferenceInd.exists()"

Invariant: may-npi
Description: "MAY be NPI"
* severity = #warning
* expression = "$this = '2.16.840.1.113883.4.6'"

Invariant: 4537-16790
Description: "There **SHALL** be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:4537-16790)."
* severity = #error
* expression = "(assignedPerson | assignedAuthoringDevice).count() = 1"

Invariant: may-id-npi
Description: "May contain an id with root='2.16.840.1.113883.4.6' (NPI)"
* severity = #warning
* expression = "id.where(root = '2.16.840.1.113883.4.6')"

Invariant: should-extension
Description: "SHOULD contain extension"
* severity = #warning
* expression = "extension.exists()"

Invariant: 4537-10006
Description: "**SHALL** contain associatedEntity/associatedPerson *AND/OR* associatedEntity/scopingOrganization (CONF:4537-10006)."
* severity = #error
* expression = "associatedEntity.associatedPerson.exists() or associatedEntity.scopingOrganization.exists()"

Invariant: 4537-10007
Description: "When participant/@typeCode is *IND*, associatedEntity/@classCode **SHOULD** be selected from ValueSet 2.16.840.1.113883.11.20.9.33 INDRoleclassCodes *DYNAMIC* (CONF:4537-10007)."
* severity = #warning
* expression = "typeCode = 'IND' implies associatedEntity.classCode.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.9.33')"

Invariant: should-us-performer
Description: "SHOULD contain performer"
* severity = #warning
* expression = "performer.exists()"

Invariant: should-code-attr
Description: "SHOULD contain @code"
* severity = #warning
* expression = "code.exists()"

Invariant: should-responsibleParty
Description: "SHOULD contain responsibleParty"
* severity = #warning
* expression = "responsibleParty.exists()"

Invariant: 1198-32905
Description: "This assignedEntity SHALL contain an assignedPerson or a representedOrganization or both (CONF:1198-32905)."
* severity = #error
* expression = "assignedPerson.exists() or representedOrganization.exists()"















//Profile:        IHE_PCC_PSC_CS_ClinicalDocument_MedicalSummary
//Parent:         http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument
//Id:             IHE.PCC.PSC.CS.ClinicalDocument.MedicalSummary
//Title:          "IHE Paramedicine Summary of Care CDA Clinical Subset Document"
//Description:    """
//The Paramedicine Summary of Care – Clinical Subset contains the patient’s medical history, paramedicine care information and interventions that are relevant to clinical care.
//"""

//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.31.1"
//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.2"
//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.1"
//* code = $loinc#18842-5
// TBD update 

//* component.structuredBody 1..1 MS 

//* component.structuredBody.component ^slicing.discriminator.type = #pattern
//* component.structuredBody.component ^slicing.discriminator.path = "code"
//* component.structuredBody.component ^slicing.rules = #open
//* component.structuredBody.component ^slicing.description = "Paramedicine Summary of Care CDA Clinical Subset Sections"
//* component.structuredBody.component ^slicing.ordered = false
//* component.structuredBody.component contains 
//  sectionDetailedChiefComplaint  1..1 MS and
//  sectionDetailedChiefComplaint  1..1 MS and




//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.1"
// US Realm * templateId[+] = "2.16.840.1.113883.10.20.3"
//* typeId = $loinc#2.16.840.1.113883.6.1



//* confidentialityCode MS
//  * codeSystem = "2.16.840.1.113883.5.25"
//  * codeSystemName = "Confidentiality"
// TODO FInish metadata requirements if needed. need to figure out if the item is 1..1 do we need to make it MS? 
//* author 


//Profile:        IHE_PCC_MedicalSummary_ClinicalDocument
//Parent:         IHE.PCC.MD.ClinicalDocument.MedicalDocument
//Id:             IHE.PCC.MedicalSummary
//Title:          "IHE Medical Summary CDA"
//Description:    """
//TBD Pull from Profile 
//"""

//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.2"
//* typeId = $loinc#2.16.840.1.113883.6.1

//* componentOf 1..1 MS
//* component 1..1 MS
 // * structuredBody 1..1 MS 
  //  * component 3..*
   //   * ^slicing.discriminator[0].type = #profile
   //   * ^slicing.discriminator[=].path = "section"
   //   * ^slicing.rules = #open
   // * component contains
   //     allergies 1..1 MS and
   //     Medications 1..1 MS and 
    //    problems 1..1 MS and 
   //     payers 0..1
   // * component[allergies] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
   //   * section only IHEAllergiesAndOtherAdverseReactionsSection
        //* ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."
   // * component[Medications] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
   //   * section only IHEMedicationsSection
        //* ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."
  //  * component[problems] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
  //    * section only IHEActiveProbelmsSection
 //       //* ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."
 //   * component[payers] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30519)"
 //     * section only IHEPayersSection
        //* ^comment = "This component MAY contain one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30520)."




//Profile:        IHE_PCC_DischargeSummary
//Parent:         IHE.PCC.MedicalSummary
//Id:             IHE.PCC.DischargeSummary
//Title:          "IHE Medical Summary CDA"
//Description:    """
//TBD Pull from Profile 
//"""

//* templateId[+] = "1.3.6.1.4.1.19376.1.5.3.1.1.2"

 //   * component 4..
 //   * component contains









//Invariant: 1198-8469
//Description: "When participant/@typeCode is IND, associatedEntity/@classCode **SHALL** be selected from ValueSet 2.16.840.1.113883.11.20.9.33 INDRoleclassCodes STATIC 2011-09-30 (CONF:1198-8469)."
//Severity: #error
//Expression: "typeCode = 'IND' implies associatedEntity.classCode.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.9.33')"

//Invariant: 1198-32898
//Description: "This assignedEntity **SHALL** contain an assignedPerson or a representedOrganization or both (CONF:1198-32898)."
//Severity: #error
//Expression: "assignedPerson.exists() or representedOrganization.exists()"

//Invariant: 1198-32899
//Description: "This assignedEntity **SHALL** contain an assignedPerson or a representedOrganization or both (CONF:1198-32899)."
//Severity: #error
//Expression: "assignedPerson.exists() or representedOrganization.exists()"
