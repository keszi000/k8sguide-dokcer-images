pipelineJob('test-build') {
  parameters {
    booleanParam('TEST_FLAG', true)
    choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
  }
  definition {
    cpsScm {
        scm {
          git {
            remote {
              url ('https://github.com/keszi000/k8sguide-dokcer-images.git')
              credentials('defaultgit')
            }
          }
        }
        scriptPath("jobdsl/test-build/Jenkinsfile")
    }
  }
}
