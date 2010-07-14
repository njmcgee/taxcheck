<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">

	<p class="home">How much <em>income tax</em> do you expect to pay in 2010/2011?</p>
  	<form method="post" action="" enctype="multipart/form-data">
	  <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
	  <label><span>$</span>
	    <input name="amount" type="text" />
	  </label>
	  <input name="type" type="hidden" value="tax" />
      <input type="hidden" name="der-url-params" value="type/amount"/>
      <input type="hidden" name="redirect" value="/result/"/>
	  <input name="" type="submit" value="Submit" />
	</form>
	<p class="or">OR</p>
	<p class="home">How much do you expect to <em>earn</em> in 2010/2011?</p>
	<form method="post" action="" enctype="multipart/form-data">
	  <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
	  <label><span>$</span>
	    <input name="amount" type="text" />
	  </label>
   	  <input name="type" type="hidden" value="earnings" />
      <input type="hidden" name="der-url-params" value="type/amount"/>
      <input type="hidden" name="redirect" value="/result/"/>
	  <input name="" type="submit" value="Submit" />
	</form>

</xsl:template>

</xsl:stylesheet>