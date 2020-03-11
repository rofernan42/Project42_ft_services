<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

 /**
 * List of env variables
 */
$vars = array(
    'DB_NAME',
	'DB_USER',
	'DB_PASSWORD',
	'DB_HOST'
);

/**
 * Stock env variables in tab
 */
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', $_ENV['DB_NAME'] );

/** MySQL database username */
define( 'DB_USER', $_ENV['DB_USER'] );

/** MySQL database password */
define( 'DB_PASSWORD', $_ENV['DB_PASSWORD'] );

/** MySQL hostname */
define( 'DB_HOST', $_ENV['DB_HOST'] );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

// define('WP_HOME', 'http://IP:5050' );
// define('WP_SITEURL', 'http://IP:5050' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ')<60@1vh2}};ZF10BN(-/tou,,A( /EP5uqLOGD%??Rp+~lMrr/k}_KVyo[ahfT<' );
define( 'SECURE_AUTH_KEY',  'Uc6l.HHEFL&xYei<6H9/XC<&bDv![gvOp8=W{N<]K/;se>bX)M!*g5{Tp@NJQu)V' );
define( 'LOGGED_IN_KEY',    'kBbp17_a^|r%P9+_P> ,isPR$%Hk*DH8{,X!az)U0qANB-Jl)+OJF_@E~=P$F co' );
define( 'NONCE_KEY',        'Y&-@;dZx4;SeYFNk?Hx#k:3n%p*1`A7|${JXz7VL] 9>d4M/CNnFtaxl?p-_,2VZ' );
define( 'AUTH_SALT',        '# ]Q<qr&tp%m&ovg_SXf+~Iqvo}c|:mqluKr<RU4x?:dR{C&4,$$k2Bop@Af^>97' );
define( 'SECURE_AUTH_SALT', 'R!JlCingY|vJmx1<}%:_y@`yw{RHg(R<Bxi>snkB3T~!DU?]5#+NH<cUm)[F:pk@' );
define( 'LOGGED_IN_SALT',   'wg,({n~AO#_}+kPrqk0+` ,UkLA&u;jvUps_U;%26zk)hqS5B-9.A6S**<^AQSBy' );
define( 'NONCE_SALT',       '5,A$rKMNO#/*L@AY0m}yjUwX`dHClW5Z/kdI`_QQS5^]L`2H8ODNAw6z+=,+-L1k' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
