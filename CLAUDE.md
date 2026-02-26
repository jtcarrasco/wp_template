# wp_template

Classic WordPress + Lando template. WordPress core is NOT in git — run setup.sh after first start.

## Stack

- WordPress (latest), classic theme structure
- Lando: PHP 8.3, nginx, MariaDB 10.6, Node 22
- WP-CLI available via `lando wp`

## First-Time Setup

```bash
lando start
bash scripts/setup.sh
```

## Commands

```bash
lando start              # Start environment
lando stop               # Stop environment
lando wp <cmd>           # WP-CLI
lando wp plugin list
lando wp post list
lando db-import <file>   # Import DB dump
```

## Local URL

http://wp-template.lndo.site

Admin: http://wp-template.lndo.site/wp-admin (admin / admin)

## Structure

- `src/themes/wp-starter/` — custom starter theme (committed)
- `wordpress/` — WP core (NOT committed, downloaded by setup.sh)
- `scripts/setup.sh` — first-run setup script

## Theme Development

Edit files in `src/themes/wp-starter/`. After editing, copy to WordPress:

```bash
cp -r src/themes/wp-starter wordpress/wp-content/themes/
```
