ValueSet: Severity_Value_Code_VS
Title: "Severity Value Code VS"
Description: "If coded, the Severity Entry value SHOULD use the HL7 SeverityObservation vocabulary (codeSystem='2.16.840.1.113883.5.1063') containing three values (H, M, and L), representing high, moderate and low severity depending upon whether the severity is life threatening, presents noticeable adverse consequences, or is unlikely substantially affect the situation of the subject."
Id: Severity.Value.Code.VS
* ^experimental = false
* $ObservationValue#L   "Low"
* $ObservationValue#H   "High"
* $ObservationValue#M   "Moderate"


ValueSet: ProblemStatusObservation_Value_VS
Title: "Problem Status Observation Value"
Description: "If coded, the Severity Entry value SHOULD use the HL7 SeverityObservation vocabulary (codeSystem='2.16.840.1.113883.5.1063') containing three values (H, M, and L), representing high, moderate and low severity depending upon whether the severity is life threatening, presents noticeable adverse consequences, or is unlikely substantially affect the situation of the subject."
Id: ProblemStatusObservation.Value.VS
* ^experimental = false
* $sct#55561003   "Active"
* $sct#73425007   "Inactive"
* $sct#90734009   "Chronic"
* $sct#7087005    "Intermittent"
* $sct#255227004    "Recurrent"
* $sct#415684004    "Rule out"
* $sct#410516002    "Ruled out"
* $sct#413322009    "Resolved"