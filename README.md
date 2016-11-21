Multipurpose Registry Manager

###### Use this tool carefully and check the tag twice before removing it from the registry.

## Installation

```
gem install mrm
```

## Prerequisites

Run

```
mrm config
```

and supply your registry credentials. The data provided will be then stored in `~/.mrmconfig` file and can be changed anytime by rerunning `mrm config`.

## CLI

```
mrm -h                        # Shows help
mrm -v                        # Shows version
mrm config                    # Saves registry credentials
mrm check                     # Checks if the registry is accessible
mrm list                      # Lists repositories of the registry
mrm list *repo*               # Lists tags of the specific repository
mrm get *repo* *reference*    # Pulls a manifest for the image
mrm delete *repo* *reference* # Deletes an image from the specific repository
```

## Client

```
client = MRM::Client.new
client.version_check
client.get_manifest(name, reference)
client.list_repositories
client.list_tags(name)
client.delete_image(name, reference)
```
