# Email Integration with Jenkins

### Configure Email service in Jenkins

Go to `Manage Jenkins` -> `System` -> `` then, add the mail credentails



#### Goal

On `post build`, send mail to author/developer/testing team.

#### Steps for pipeline

Add the following setps to your pipeline to send mails,

```bash
post {
    failure {
        mail to: "developer@thirumal.com",
        subject: "Production - ${env.JOB_NAME} - build - ${currentBuild.currentResult} ",
        body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}"
        // attachLog: true
    }
    success {
        mail to: "developer@thirumal.com",
        subject: "Production - ${env.JOB_NAME} - build - ${currentBuild.currentResult}: ",
        body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}"
        //attachLog: false
    }
}
```