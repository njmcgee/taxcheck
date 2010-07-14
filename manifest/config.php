<?php

	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '17',
			'allow_page_subscription' => '1',
			'lang' => 'en',
			'version' => '2.0.2',
			'build' => '375',
			'cookie_prefix' => 'sym-',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Taxcheck',
			'useragent' => 'Symphony/375',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
		),
		########


		###### DATABASE ######
		'database' => array(
			'driver' => 'mysql',
			'character_set' => 'utf8',
			'character_encoding' => 'utf8',
			'runtime_character_set_alter' => '1',
			'disable_query_caching' => 'no',
			'host' => 'mysql.taxcheck.com.au',
			'port' => '3306',
			'user' => 'njmcgee',
			'password' => 'electricity',
			'db' => 'taxcheck',
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'maintenance_mode' => 'no',
			'display_event_xml_in_source' => 'yes',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd F Y',
			'timezone' => 'Australia/Canberra',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0775',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0775',
		),
		########
	);
