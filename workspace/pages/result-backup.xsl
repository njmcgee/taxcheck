<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<xsl:param name="tax">
		<xsl:choose>
			<xsl:when test="$type = 'tax'">
				<xsl:value-of select="$amount"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$amount &lt;= 6000">
						0
					</xsl:when>
					<xsl:when test="$amount &gt; 6000 and $amount &lt;= 35000">
						<xsl:value-of select="0.15*($amount - 6000) "/>
					</xsl:when>
					<xsl:when test="$amount &gt; 35000 and $amount &lt;= 80000">
						<xsl:value-of select="4350 + 0.30*($amount - 35000) "/>
					</xsl:when>
					<xsl:when test="$amount &gt; 80000 and $amount &lt;= 180000">
						<xsl:value-of select="17850 + 0.38*($amount - 80000) "/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="55850 + 0.45*($amount - 180000)"/>
					</xsl:otherwise>
				</xsl:choose>				
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<div class="span-10 prepend-1">
		<table>
			<tbody>
				<tr id="top">
					<th class="wide">Your<br/>income tax</th>
					<th></th>
					<th>Total<br/>gov spending</th>
				</tr>
				<tr id="totals">
					<th>$<xsl:value-of select='format-number($tax, "###,###,###")'/></th>
					<th></th>
					<th>$<xsl:value-of select='format-number(sum(/data/categories/entry/amount), "###,###,###")'/>m</th>
				</tr>
				<xsl:apply-templates select="categories/entry">
					<xsl:with-param name="total-spending" select="sum(/data/categories/entry/amount)"/>
					<xsl:with-param name="user-tax" select="$tax"/>
				</xsl:apply-templates>
			</tbody>
		</table>
		<H2>Deficit information</H2>
		<xsl:variable name="deficit-share" select="($tax div sum(/data/categories/entry/amount) * /data/other-variables/entry[@id=304]/value)"/>
		<table>
			<tbody>
		  		<tr>
				    <th>
						$<xsl:value-of select='format-number($deficit-share, "###,###,###")'/>				
					</th>
				    <th>Budget deficit &amp; implied borrowing on your behalf</th>
				    <th>$<xsl:value-of select='format-number(/data/other-variables/entry[@id=304]/value, "###,###,###")'/>m</th>
				</tr>
			</tbody>
		</table>
		<div class="fine-print span-6 prepend-2">
			<xsl:copy-of select="fine-print/entry/content"/>
		</div>
	</div>
</xsl:template>


<xsl:template match="entry">
	<xsl:param name="user-tax" />
	<xsl:param name="total-spending" />
	
	<xsl:variable name="factor" select="amount div $total-spending"/>	
	<xsl:variable name="current-cat" select="name/@handle"/>
		
	<tr>
		<th>			
			<xsl:choose>
				<xsl:when test="round($factor * $user-tax) &lt; 10">
					$<xsl:value-of select='format-number($factor * $user-tax, "###,###,###.##")'/>
				</xsl:when>
				<xsl:otherwise>
					$<xsl:value-of select='format-number(round($factor * $user-tax), "###,###,###")'/>
				</xsl:otherwise>
			</xsl:choose>			
		</th>
		<th><xsl:value-of select="name"/></th>
		<th>$<xsl:value-of select='format-number(amount,"###,###,###")'/>m</th>	
	</tr>

	<xsl:for-each select="/data/sub-categories/entry[parent/item/@handle = $current-cat]">
		<xsl:variable name="current-sub" select="name/@handle"/>
		<xsl:variable name="sub-factor" select="amount div $total-spending"/>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="round($sub-factor * $user-tax) &lt; 10">
						$<xsl:value-of select='format-number($sub-factor * $user-tax, "###,###,###.##")'/>
					</xsl:when>
					<xsl:otherwise>
						$<xsl:value-of select='format-number(round($sub-factor * $user-tax), "###,###,###")'/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td><xsl:value-of select="name"/></td>
			<td>$<xsl:value-of select='format-number(amount,"###,###,###")'/>m</td>			
		</tr>
		<xsl:for-each select="/data/minor-categories/entry[parent/item/@handle = $current-sub]">
			<xsl:variable name="current-minor" select="name/@handle"/>
			<xsl:variable name="minor-factor" select="amount div $total-spending"/>
			<tr class="minor">
				<td>
					<xsl:choose>
						<xsl:when test="round($minor-factor * $user-tax) &lt; 10">
							$<xsl:value-of select='format-number($minor-factor * $user-tax, "###,###,###.##")'/>
						</xsl:when>
						<xsl:otherwise>
							$<xsl:value-of select='format-number(round($minor-factor * $user-tax), "###,###,###")'/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td><em><xsl:value-of select="name"/></em></td>
				<td>$<xsl:value-of select='format-number(amount,"###,###,###")'/>m</td>			
			</tr>
		</xsl:for-each>
	</xsl:for-each>	
		
		
</xsl:template>


</xsl:stylesheet>