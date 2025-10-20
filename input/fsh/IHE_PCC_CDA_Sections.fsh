Profile: IHEMedicationsSection
Parent: $Section
Id: IHEMedicationsSection
Title: "IHE Medications Section"
Description: """
The medications section shall contain a description of the relevant medications for the patient, e.g., an ambulatory prescription list. It shall include entries for medications as described in the Entry Content Module.
"""
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09"
//* ^status = #draft
* obeys shall-med-activity
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId ^slicing.discriminator[0].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    section 1..1 and
    ccdASTMsection 1..1 and 
    iheMedicationsSection 1..1
* templateId[section].root 1..
* templateId[section].root = "2.16.840.1.113883.10.20.22.2.1.1"
* templateId[section].extension 1..
* templateId[section].extension = "2014-06-09"
* templateId[ccdASTMsection].root 1..
* templateId[ccdASTMsection].root = "2.16.840.1.113883.10.20.1.8"
* templateId[iheMedicationsSection].root 1..
* templateId[iheMedicationsSection].root = "1.3.6.1.4.1.19376.1.5.3.1.3.19"
* templateId[iheMedicationsSection].extension 1..
* templateId[iheMedicationsSection].extension = "2007‑04‑01"
* code 1..
* code ^short = "History of Medication use Narrative"
* code.code 1..
* code.code = #10160-0
* code.codeSystem 1..
* code.codeSystem = "2.16.840.1.113883.6.1"
* title 1..
* text 1..
//* entry ^slicing.discriminator[0].type = #profile
//* entry ^slicing.discriminator[=].path = "substanceAdministration"
//* entry ^slicing.rules = #open
//* entry ^short = "If section/@nullFlavor is not present:"
//* entry contains medications 1..*
//* entry[medications] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-7572) such that it"
//* entry[medications].substanceAdministration 1..
//* entry[medications].substanceAdministration only $Medications
//* entry[medications].substanceAdministration ^comment = "SHALL contain exactly one [1..1] Medications (identifier: oid:1.3.6.1.4.1.19376.1.5.3.1.4.7)."