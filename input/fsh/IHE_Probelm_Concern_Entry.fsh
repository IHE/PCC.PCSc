Profile: IHE_Problem_Concern_Entry
Parent: IHE_PCC_Concern_Entry
Id: IHE.Problem.Concern.Entry
Title: "IHE Probelm Concern Entry"
Description: """
This entry is a specialization of the Concern Entry, wherein the subject of the concern is focused on a problem.

"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2024-05-01"
* ^status = #draft

* templateId contains ihe-prob-concern-entry 1..1
* templateId[ihe-prob-concern-entry].root 1..1
* templateId[ihe-prob-concern-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.2"

* entryRelationship[problem] 1..* 