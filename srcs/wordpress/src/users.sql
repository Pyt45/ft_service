INSERT INTO `wordpress`.`wp_users` (`user_login`, `user_pass`, `user_nicename`, `user_email`, `user_status`) VALUES ('user1', MD5('user1234'), 'dazai su', 'dazai@gmail.com', '0');
INSERT INTO `wordpress`.`wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES (NULL, (Select max(id) FROM wp_users), 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
INSERT INTO `wordpress`.`wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES (NULL, (Select max(id) FROM wpc7_users), 'wp_user_level', '10');

INSERT INTO `wordpress`.`wp_users` (`user_login`, `user_pass`, `user_nicename`, `user_email`, `user_status`) VALUES ('user2', MD5('user2134'), 'jaco ho', 'jaco@gmail.com', '0');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES (NULL, (Select max(id) FROM wp_users), 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES (NULL, (Select max(id) FROM wpc7_users), 'wp_user_level', '10');









INSERT INTO `wordpress`.`wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`,
`user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES ('1000', 'user1', MD5('user1234'), 'dazai', 'user1@gmail.com', '', '2014-11-04 00:00:00', '', '0', 'user1');

INSERT INTO `wordpress`.`wp_usermeta` (`umeta_id`, `user_id`, `meta_key`,
`meta_value`) VALUES (NULL, '1000', 'wp_capabilities', 
'a:1:{s:13:"administrator";s:1:"1";}'), (NULL, '1000', 'wp_user_level', '10');



INSERT INTO `wordpress`.`wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`,
`user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES ('1001', 'user2', MD5('user2134'), 'jaco', 'user2@gmail.com', '', '2014-11-05 00:00:00', '', '0', 'user2');

INSERT INTO `wordpress`.`wp_usermeta` (`umeta_id`, `user_id`, `meta_key`,
`meta_value`) VALUES (NULL, '1001', 'wp_capabilities', 
'a:1:{s:13:"administrator";s:1:"1";}'), (NULL, '1001', 'wp_user_level', '10');