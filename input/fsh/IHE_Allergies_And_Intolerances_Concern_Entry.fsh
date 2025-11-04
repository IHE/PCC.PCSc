Profile: IHE_Allergies_And_Intolerances_Concern_Entry
Parent: IHE_PCC_Concern_Entry
Id: IHE.Allergies.And.Intolerances.Concern.Entry
Title: "IHE Allergies and Intolerances Concern Entry"
Description: """
TBD
"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2024-05-01"
* ^status = #draft

* templateId contains ihe-allergy-concern-entry 1..1
* templateId[ihe-allergy-concern-entry].root 1..1
* templateId[ihe-allergy-concern-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.3"

* entryRelationship[allergies-and-ntolerances-entry] 1..* MS 