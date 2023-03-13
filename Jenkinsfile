pipeline {
    agent any

    stages {
        stage('ci') {
            steps {
                zip -r khyathi.zip ./index.html
                aws s3 cp khyathi.zip s3://repeatedkhyathicicd/

            }
        },
        stage('cd') {
            steps {
                aws s3 cp s3://repeatedkhyathicicd/khyathi.zip .
                unzip khyathi.zip
                scp -r index.html root@172.31.87.98/var/www/html
                
            }
        }
    }
}