<?php
define('DB_NAME', 'egitimarastirma_db');
define('DB_USER', 'egitimarastirma_user');
define('DB_PASSWORD', '7TfuOAnqC8GLcm5ospNnyspopsb6Uvew');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'jK#3x9{Q-+M,Fj67VuNZLwXOC25LOYugDafS2R3vsRhI946Wb510DGL8');
define('SECURE_AUTH_KEY',  'PvLsQM4ddEZpIh8nby}y}82oYYVxjK;eoqz.UsT:r6MS5,');
define('LOGGED_IN_KEY',    '32M9:]VcThwh@#m62L/gx)U>3_^?@SSl}5c]&R1`|&).a%v+KWip&r7}?');
define('NONCE_KEY',        'FRd]+IhA}S^O$bUf$>`0d+yZe3z-kd#%+euU^x(D7SgdWzo_:jgV:c(#c6#~dzHp');
define('AUTH_SALT',        '4|<P-NWKeX~+EWGwRPow||3KI.h~|NUI?YdbsXCtAhwBl^o[e8B5AQ72f`Dq;');
define('SECURE_AUTH_SALT', 'sHEx?noL*+$N62GJf3h3c=D=4i$nmTufns22V_4@EMz^Wqgz?a&vn|1x?zH!+1r');
define('LOGGED_IN_SALT',   'S|8>v+Tb3&oCx0]@FC/#jm7kiusXS@Y:dEg#8]E,o|G&7ZwVaOP|krVRH<OLd?');
define('NONCE_SALT',       'biS>]B+~Uzl?[^-|v=j-uIYvPhx,U?`mpNG%?xsqOnO0-[H-frRgBTT7YUxy}');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if ( ! defined('ABSPATH') ) {
    define('ABSPATH', __DIR__ . '/');
}

require_once ABSPATH . 'wp-settings.php';
