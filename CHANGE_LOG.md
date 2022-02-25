# v0.1.0

- Initial release to upload scans

# v0.2.0

- Changed $HOST to $THREADFIX_HOST
- Added $ threadfix version
- Added $ threadfix applications lookup

# v0.2.1

- Print ID in upload command

# v0.3.0

- Added feature to fetch ID for a given app name

# v0.3.1

- Fetch ID ignores app name case
- Added Debug logging with DEBUG env var
Updates to support breaking API change
- Updated API version
- USAGE CHANGE: for compatibility with the newer API the THREADFIX_HOST must also include '/threadfix' e.g.  'http://example.com/threadfix'
