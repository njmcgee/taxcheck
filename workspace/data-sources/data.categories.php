<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcecategories extends Datasource{
		
		public $dsParamROOTELEMENT = 'categories';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '200';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'amount';
		public $dsParamSTARTPAGE = '1';
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'amount'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Categories',
					 'author' => array(
							'name' => 'Nathan McGinness',
							'website' => 'http://taxcheck.com.au',
							'email' => 'nathanmcginness@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-22T01:27:04+00:00');	
		}
		
		public function getSource(){
			return '12';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

