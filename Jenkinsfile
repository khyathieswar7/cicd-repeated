pipeline {
    agent any

    stages {
        stage('ci') {
            steps {
                zip -r khyathi.zip ./index.html
                aws s3 cp khyathi.zip s3://mondaycicd/

            }
        }
        stage('cd') {
            steps {
                aws s3 cp s3://mondaycicd/khyathi.zip .
                unzip khyathi.zip
                scp -r index.html ec2-user@184.73.68.57/var/www/html

            }
        }
    }
}