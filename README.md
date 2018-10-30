Dockerfile to build sast-slave image in order to connect as Kubernetes Jenkins slave

## There are the following packages:
- spotbugs tool
- findsecbugs-plugin plugin
- python-pip util
- defectdojo_api pip package
- dojo_upload.py script

## dojo_upload.py script
The dojo_upload.py script uploads security report to DefectDojo vulnerability manager.
It is required in the Jenkins Nightly Pipeline to send reports about
- SpotBugs analysis
- OWASP dependency checks
- Anchore analysis

The dojo_upload.py script requires the following parameters as OS environment variables:

```
export DOJO_API_HOST=https://defect-dojo-edp-cicd-vlg1.epam-dev.aws-rgn-vlgn.com // or 'defect-dojo' service in Jenkins Pipelines
export DOJO_API_KEY=your_api_key_from_DefectDojo // take it from https://defect-dojo-edp-cicd-vlg1.epam-dev.aws-rgn-vlgn.com/api/key
export DOJO_API_USER=admin

export DOJO_ENGAGEMENT_ID='RGN SAST' // DefectDojo engagement id which should be already created via UI
export DOJO_SCAN_TYPE='SpotBugs Scan' // Scan type which should exist in DefectDojo
export DOJO_API_FILE=$HOME/spotbugs-report-all.xml // path to report file
export DOJO_API_ACTIVATE='True'
export DOJO_API_DATE=$(date +%F)
```
