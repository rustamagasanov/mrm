Multipurpose Registry Manager

###### Use this tool carefully and check the tag twice before removing it from the registry.

## Installation

```
gem install mrm
```

## Prerequisites

Supply your registry credentials in `config.yml` file.

## Usage

```
mrm -h                        # Shows help
mrm -v                        # Shows version
mrm check                     # Checks if the registry is accessible
mrm list                      # Lists repositories of the registry
mrm list *repo*               # Lists tags of the specific repository
get *repo* *reference*        # Pulls a manifest for the image
mrm delete *repo* *reference* # Deletes an image from the specific repository
```

