elifePipeline {
    def commit
    stage 'Checkout', {
        checkout scm
        commit = elifeGitRevision()
    }

    stage 'Project tests', {
        lock('elife-ink--ci') {
            builderDeployRevision 'elife-ink--ci', commit
            builderSmokeTests 'elife-ink--ci', '/srv/elife-ink'
        }
    }

    elifeMainlineOnly {
        stage 'Deploy on demo', {
            lock('elife-ink--demo') {
                builderDeployRevision 'elife-ink--demo', commit
                builderSmokeTests 'elife-ink--demo', '/srv/elife-ink'
            }
        }

        stage 'Approval', {
            elifeGitMoveToBranch commit, 'approved'
        }

        stage 'Merge into master', {
            // will be done in Jenkinsfile.prod when a prod server is created
            elifeGitMoveToBranch commit, 'master'
        }
    }
}
