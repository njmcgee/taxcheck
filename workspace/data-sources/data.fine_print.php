<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcefine_print extends Datasource{
		
		public $dsParamROOTELEMENT = 'fine-print';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'id' => '388',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'content'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Fine print',
					 'author' => array(
							'name' => 'Nathan McGinness',
							'website' => 'http://taxcheck.com.au',
							'email' => 'nathanmcginness@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-20T03:46:25+00:00');	
		}
		
		public function getSource(){
			return '17';
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

