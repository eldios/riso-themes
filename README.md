# riso-themes

The theme catalog `riso` reads.

`index.json` is a flat list of themes, published as static JSON. A client
downloads it, finds a name, and clones the repository it points at. There is
no server: the index is a file, and hosting it costs nothing.

## Adding a theme

Open a pull request adding an entry:

```json
{
  "name": "your-theme",
  "repo": "https://github.com/you/riso-theme-your-theme.git",
  "description": "One line, no marketing",
  "rev": "v1.0.0"
}
```

`rev` is optional and pins a tag or commit. Without it the tip of the default
branch is used, and the clone is shallow.

Every submission is validated before it is merged: a theme must be data and
nothing else, which means no executable files, no directives that name a
program to run, no symlinks, and no paths that leave the theme directory.
Run the same check yourself first:

```bash
riso theme validate path/to/your-theme
```

## Withdrawing a theme

Entries are never deleted, they are marked:

```json
{ "name": "gone", "repo": "...", "yanked": "reason" }
```

A client that already installed it is told at the next update. Removing the
line instead would leave those clients with no way to find out.
