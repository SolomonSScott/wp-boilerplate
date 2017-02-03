# WordPress Boilerplate

## Creating a new WordPress site
Create a directory for your site and open it
```
mkdir wordpress-site && cd wordpress-site
```

In terminal, run:
```
curl -L https://raw.githubusercontent.com/SolomonSScott/wp-boilerplate/master/wp-install.sh | sh
```

This will download the latest version of WordPress and the environments configuration.

Finally, add your environment details:

```
<?php
// config/environments/development.php

...

$WP_ENVIRONMENT = array(
  'db_name' => 'database',
  'db_user' => 'root',
  'db_password' => 'root',
  'db_host' => 'localhost',
  'wp_lang' => '',
  'wp_debug' => true,
  'name' => 'development'
);
?>
```