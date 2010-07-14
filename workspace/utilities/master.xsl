<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>

<xsl:template match="/">

<html>
	<head>
		<meta name="verify-v1" content="8GEl39LHMZCsmz47LcXc4l8Bp82f3jwr7V43Ko+YLDg=" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="Content-Language" content="en" />

		<meta name="description" content="Taxcheck" />
	    <meta name="keywords" content="Taxcheck, tax, income tax, government spending, australia, taxation, australian government, government, budget" />
	    <meta name="author" content="Robert Arculus, Nathan McGinness"/>		
		
		<title>
			<xsl:call-template name="page-title"/>
		</title>
		<!-- <link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" /> -->
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/_lib/css/compressed.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/_lib/css/screen.css" />
		
		<xsl:text disable-output-escaping="yes"><![CDATA[
		<script type="text/javascript">
		//<![CDATA[
		  /* 
			Javascript to style odd/even table rows
			Derived from 'Zebra Tables' by David F. Miller (http://www.alistapart.com/articles/zebratables/)

			Modified by Jop de Klein, february 2005
			jop at validweb.nl
			http://validweb.nl/artikelen/javascript/better-zebra-tables/
		*/

		var stripe = function() {
			var tables = document.getElementsByTagName("table");	

			for(var x=0;x!=tables.length;x++){
				var table = tables[x];
				if (! table) { return; }

				var tbodies = table.getElementsByTagName("tbody");

				for (var h = 0; h < tbodies.length; h++) {
					var even = true;
					var trs = tbodies[h].getElementsByTagName("tr");

					for (var i = 0; i < trs.length; i++) {
						trs[i].onmouseover=function(){
							this.className += " ruled"; return false
						}
						trs[i].onmouseout=function(){
							this.className = this.className.replace("ruled", ""); return false
						}

						if(even)
							trs[i].className += " even";

						even = !even;
					}
				}
			}
		}

		window.onload = stripe;
		//]]>]]&gt;
		&lt;/script>
		</xsl:text>

	  	<style type="text/css">
		

			
			tr td{
			
				background: #3b2934;
			}
			<!-- thead td{
						color: #fff;
						background-color: #C8C028;
						font-weight: bold;
						border-bottom: 1px solid #999;
					} -->
			<!-- tbody td{
								border-left: 1px solid #D9D9D9;
						} -->
			tbody tr.even td{
				background: #2c2c2c;
			}
			<!-- tbody tr.selected td{
							background: #3d80df;
							color: #ffffff;
							font-weight: bold;
							border-left: 1px solid #346DBE;
							border-bottom: 1px solid #7DAAEA;
						}
						tbody tr.ruled td{
							color: #000;
							background-color: #C6E3FF; 
							font-weight: bold;
							border-color: #3292FC;
						}

						/* Opera fix */
						head:first-child+body tr.ruled td{
							background-color: #C6E3FF; 
						} -->
			</style>
		
	</head>
		
	
	<body>
	
	
		<div class="container">
			<h1>
				<a href="{$root}"><xsl:value-of select="$website-name"/></a>
			</h1>
			<p class="intro">Taxcheck uses the 2010/2011 budget forecast to estimate how your tax dollars will be spent.</p>


			<div id="content">
				<xsl:apply-templates/>
			</div>
		</div>
		<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script type="text/javascript">
		try {
		var pageTracker = _gat._getTracker("UA-3517986-3");
		pageTracker._trackPageview();
		} catch(err) {}</script>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>