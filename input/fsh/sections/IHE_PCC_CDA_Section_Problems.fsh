Profile: IHE_PCC_Active_Problems_Section 
Parent: $Section
Id: IHE.PCC.Active.Problems.Section
Title: "IHE Active Problems Section"
Description: """
The active problem section shall contain a narrative description of the conditions currently being monitored for the patient. It shall include entries for patient conditions as described in the Entry Content Module.

"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2015-08-01"
* ^status = #draft

* obeys ihe-shall-problem-concern-act
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    astm-ection 1..1 MS and 
    activeProblemsSection 1..1 MS
* templateId[astm-section].root 1..1 MS 
* templateId[astm-section].root = "2.16.840.1.113883.10.20.1.11"
* templateId[activeProblemsSection].root 1..1 MS 
* templateId[activeProblemsSection].root = ".3.6.1.4.1.19376.1.5.3.1.3.6"

* code 1..1 MS 
* code ^short = "Problem list - Reported"
* code.code 1..1 MS 
* code.code = $loinc#11450-4
* code.codeSystem 1..1 MS 
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.codeSystemName = "LOINC"

* title MS 
* text MS 
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "act"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "observation"
* entry ^slicing.rules = #open
* entry ^short = "If section/@nullFlavor is not present:"
* entry ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-9183)"
* entry contains problem-Concern-Entry 1..* MS 

* entry[problem-Concern-Entry].act only IHE_Problem_Concern_Entry