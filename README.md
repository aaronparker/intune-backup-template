# Microsoft Intune backup

A template repository that you can clone to enable a Microsoft Intune tenant backup and report using [IntuneCD](https://github.com/almenscorner/IntuneCD) and [md-to-pdf](https://github.com/simonhaenisch/md-to-pdf).

To learn how to use this repository, see this article: [Automate Microsoft Intune As-Built Documentation on GitHub](https://stealthpuppy.com/automate-intune-documentation-github/).

## Workflows

After cloning the repository, you'll need to enable the Actions to run via the repository settings, and add the secrets required by the workflows.

This template repository includes the following workflows:

* `intune-backup.yml` - performs the export from the Intune tenant to create a backup, and generates a markdown version of the as-built document, and tags the release
* `intune-release.yml` - generates PDF and HTML versions of the markdown document, creates a release, and adds the documents to the release as assets
* `remove-releases.yml` - prunes the release assets to keep the last 60 releases

## Example report

The generated as-built documentation will look something like:

![As-built documentation screenshot](asbuilt-sample.png)
