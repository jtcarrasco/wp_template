<?php
function wp_starter_setup() {
    add_theme_support( 'title-tag' );
    add_theme_support( 'post-thumbnails' );
    register_nav_menus( [ 'primary' => 'Primary Menu' ] );
}
add_action( 'after_setup_theme', 'wp_starter_setup' );

function wp_starter_enqueue() {
    wp_enqueue_style( 'wp-starter', get_stylesheet_uri() );
}
add_action( 'wp_enqueue_scripts', 'wp_starter_enqueue' );
