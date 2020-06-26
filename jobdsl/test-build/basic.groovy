pipelineJob('basic') {
  parameters {
    booleanParam('TEST_FLAG', true)
    choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
  }
  definition {
    scriptPath("auth/Jenkinsfile")
  }
}
