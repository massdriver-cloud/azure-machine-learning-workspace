[![Massdriver][logo]][website]

# azure-machine-learning-workspace

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]



---

## Design

For detailed information, check out our [Operator Guide](operator.mdx) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle

<!-- COMPLIANCE:START -->

Security and compliance scanning of our bundles is performed using [Bridgecrew](https://www.bridgecrew.cloud/). Massdriver also offers security and compliance scanning of operational infrastructure configured and deployed using the platform.

| Benchmark                                                                                                                                                                                                                                                       | Description                        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |

| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-machine-learning-workspace/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-machine-learning-workspace&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |

<!-- COMPLIANCE:END -->

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`compute`** *(object)*: The compute resources to create in the workspace.
  - **`cluster`** *(array)*: The compute clusters to create in the workspace. Default: `[]`.
    - **Items** *(object)*
      - **`idle_duration`** *(string)*: The Idle time before scaling down the cluster to the minimum node count. Cannot be changed after deployment of the cluster. Default: `PT2M`.
        - **One of**
          - 1 minute
          - 2 minutes
          - 5 minutes
          - 10 minutes
          - 15 minutes
          - 30 minutes
          - 45 minutes
          - 1 hour
          - 2 hours
          - 3 hours
          - 6 hours
          - 12 hours
          - 1 day
      - **`max_nodes`** *(integer)*: The maximum number of nodes in the compute cluster. Cannot be changed after deployment of the cluster. Default: `1`.
      - **`min_nodes`** *(integer)*: The minimum number of nodes in the compute cluster. Cannot be changed after deployment of the cluster. Default: `0`.
      - **`name`** *(string)*: The name of the compute cluster. Cannot be changed after deployment of the cluster.
      - **`size`** *(string)*: The size of the compute cluster. Cannot be changed after deployment of the cluster. Default: `STANDARD_DS11_V2`.
        - **One of**
          - 2 cores, 14 GB RAM, 28 GB storage
          - 4 cores, 16 GB RAM, 32 GB storage
          - 4 cores, 32 GB RAM, 64 GB storage
          - 4 cores, 8 GB RAM, 32 GB Storage
  - **`instance`** *(array)*: The compute instances to create in the workspace. Default: `[]`.
    - **Items** *(object)*
      - **`name`** *(string)*: The name of the compute instance. Cannot be changed after deployment of the instance.
      - **`size`** *(string)*: The size of the compute instance. Cannot be changed after deployment of the instance. Default: `STANDARD_DS11_V2`.
        - **One of**
          - 2 cores, 14 GB RAM, 28 GB storage
          - 4 cores, 16 GB RAM, 32 GB storage
          - 4 cores, 32 GB RAM, 64 GB storage
          - 4 cores, 8 GB RAM, 32 GB Storage
- **`registry`** *(object)*: The registry to use for the workspace.
  - **`create_registry`** *(boolean)*: Create a new Azure Container Registry for the workspace? If not, you will need to provide an existing registry. This cannot be changed after deployment. Default: `True`.
- **`workspace`** *(object)*
  - **`high_business_impact`** *(boolean)*: If your workspace contains sensitive data, you can enable high business impact features to help protect your data. This controls the amount of data Microsoft collects for diagnostic purposes and enables additional encryption in Microsoft managed environments.\. Default: `False`.
  - **`location`** *(string)*: The region of the workspace. This cannot be changed after the workspace is created.
## Examples

  ```json
  {
      "__name": "Development"
  }
  ```

  ```json
  {
      "__name": "Production"
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`azure_service_principal`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`client_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

    - **`client_secret`** *(string)*
    - **`subscription_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

    - **`tenant_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

  - **`specs`** *(object)*
<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/azure-machine-learning-workspace/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]

<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg

[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=linkedin

[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/azure-machine-learning-workspace.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/azure-machine-learning-workspace/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/azure-machine-learning-workspace.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/azure-machine-learning-workspace/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/azure-machine-learning-workspace.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/azure-machine-learning-workspace/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/azure-machine-learning-workspace.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/azure-machine-learning-workspace/issues
[release_url]: https://github.com/massdriver-cloud/azure-machine-learning-workspace/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/azure-machine-learning-workspace.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/azure-machine-learning-workspace.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/azure-machine-learning-workspace/blob/main/LICENSE

[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2

[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=azure-machine-learning-workspace&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
