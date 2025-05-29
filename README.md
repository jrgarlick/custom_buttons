# Redmine Custom Buttons Plugin

This plugin lets administrators add custom action buttons to issue pages depending on the Tracker. The buttons use a templating engine 

## Supported Versions

Built on Redmine 5.1 and should work with 6.x too.

## Installation

1. Clone this repository into your Redmine's plugin/ directory.
2. Run `rake redmine:plugins:migrate` to perform the database migration.
3. Restart Redmine.

## Configuration

This plugin adds a new Admin page called, 'Custom Buttons'. You use this screen to add, change, or remove templated links for Trackers.

The screen has a section of links for each tracker. Each link has a row that configures a link. Each link has configuration items for:

* **Title** - Template for the title of the Button
* **URL** - Template for the URL of the Button
* **Location** - Options for positioning the Button on the Issue page (Under the **Details** section, or under the **Description** section)
* **Icon** - Options for adding a standar Redmine icon next to the Button on the Issue page.
* **Position** - Indicates the order the icon shows up in the section.
* **Active** - Enable or disable the button

### Templating

The Custom Buttons plugin uses the Mustache templating engine to render the text for the Link Title and the Link URL. The templating engine is provided with a context that includes the issue and the project. Here are some examples for building templates:

You can use the following placeholders in Title and URL templates:

```
    {{issue.id}} - Issue ID
    {{issue.subject}} - Issue subject/title
    {{issue.project.name}} - Project name
    {{issue.status.name}} - Issue status
    {{issue.project.identifier}} - Project slug/identifier
    {{custom_fields.Your Custom Field}} - Custom field by label
    {{custom_fields_by_id.123}} - Custom field by ID (e.g., 123)

URL Example: https://crm.example.com/search?q={{custom_fields.Customer ID}}

```
*Note: There is a bug with storing UTF-8 Characters in certain MySQL databases and may throw a 500 error.

## License

The source code for the site is licensed under the MIT license, which you can find in the LICENSE.txt file.