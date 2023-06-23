# Email Integration with Jenkins

### Configure Email service in Jenkins

Go to `Manage Jenkins` -> `System` -> `` then, add the mail credentails

##### On `Extended E-mail Notification` give the following details

!> If you are using gmail, add `APP` password

The below details are for gmail

```bash
SMTP server : smtp.gmail.com
SMTP Port   : 465
Use SSL     : true
Default Content Type : html
```
##### On `E-mail Notification `:

```bash
SMTP server             : smtp.gmail.com
Use SMTP Authentication : true
User Name               : 
Password (App password) :
Use SSL                 : true
SMTP Port               : 465
Charset                 : UTF-8
```

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