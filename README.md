TSSC Disconnected Installer
============================

This utility sets up the git repositories, container images, and application dependencies required to use TSSC in a disconnected environment.

The typical work flow is to:
1. Outside, the disconnected environment, use the installer to create an installer package while connected to the internet. This downloads all required binaries and creates an archive.
2. Manually copy the archive into the disconnected environment.
3. Expand the archive
4. Run the included install script.

# Pre-reqs

These instructions assume that the package is created on one machine and installed from another. There different pre-reqs for the two machines.

## The Machine Used to Create the Package

1. Ansible 2.9.12 or later (earlier versions may work)
2. git 2.25.4 or later (earlier versions may work)
3. Network connectivity to the upstream repositories (or mirrors).
4. Git credentials configured for passwordless cloning of the upstream repositories.
5. maven 5.7 or later (earlier versions may work)
6. Network connectivity to maven central OR network connectivity and maven configuration for an enterprise repository with the required application dependencies.
7. skopeo 1.1.1 or later (earlier versions may work)
8. Network connectivity to quay.io. Alternatively, network connectivity and any required credentials for an enterprise container image repository with the required container images.
9. Enough disk space to hold the unpackaged repositories, images and dependencies, and also the created package.

Open Internet access satisfies all network connectivity requirements.

The upstream repositories are:
git@github.com:rhtconsulting/tssc-python-package.git
git@github.com:rhtconsulting/tssc-jenkins-library.git
ssh://gitea@gitea.tssc.rht-set.com:2022/tssc-references/tssc-reference-app-quarkus-rest-json.git
ssh://gitea@gitea.tssc.rht-set.com:2022/tssc-references/tssc-reference-app-quarkus-rest-json-config.git

## The Machine Used to Install the Package
1. Network connectivity to the git server, container registry, and artifact repository in the disconnected environment.
2. Ansible, git, maven and skopeo client binaries.
3. A gitea API token with permission to create repositories OR pre-existing manually created repositories for each upstream git repository.
4. Any credentials required to push images to the container registry.
5. Credentials and maven configuration for deploying application dependencies to the maven repository OR administrative access to manually upload the dependencies.

# Installer Phases

## Create Package

1. Clone Git Repos
2. Download Application Dependencies
3. Download Container Images

## Install Package

1. Create Gitea Repos
 - curl -X POST "https://giteaserver/api/v1/user/repos?access_token=TOKEN" -H "accept: application/json" -H "content-type: application/json" -d "{\"name\":\"repsitory_name\", \"description\": \"Sample description\", .... }"
2. Initialize Gitea Repos
3. Publish Application Dependencies
4. Upload Container Images
