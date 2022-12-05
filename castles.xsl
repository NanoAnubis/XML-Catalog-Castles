<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Catalog of castles in Bulgaria</title>
				<link rel="stylesheet" href="./castles.css" type="text/css"/>
			</head>
			<body>
				<div class="container">
					<h1 class="catalog-title">Catalog of castles in Bulgaria</h1>
					<label for="sortBy" class="sort-by-label">Sort by:</label>
					<select name="sortBy" id="sortBy">
						<option value="typeASC">Type (ascending)</option>
						<option value="typeDSC">Type (descending)</option>
						<option value="regionASC">Region (ascending)</option>
						<option value="regionDSC">Region (descending)</option>
						<option value="conditionASC">Condition (ascending)</option>					
						<option value="conditionDSC">Condition (descending)</option>
						<option value="nameASC">Name (ascending)</option>
						<option value="nameDSC">Name (descending)</option>
					</select>				
					<div class="catalog-container">
						<xsl:for-each select="castle_catalog/castles/castle">
							<xsl:sort select="./type/@id" order="ascending"/>
							<xsl:sort select="./region" order="ascending"/>
							<xsl:sort select="./condition" order="ascending"/>
							<div id="" class="castle-container">
								<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
								<xsl:variable name="castle_type" select="./type/@id"/>
								<xsl:variable name="castle_region" select="./region/text()"/>
								
								<h2 class="castle-title"><xsl:value-of select="title"/></h2>							
								<img class="castle-image">
									<xsl:attribute name="src">
										<xsl:value-of select="unparsed-entity-uri(image/@href)"/>
									</xsl:attribute>
								</img>
								<h3 class="castle-type">Тип на крепостта -
									<xsl:value-of 
									select="/castle_catalog/types/type[type_id='$castle-type']/type_name/text()"/>
								</h3>
								<h4 class="castle-region">Намира се в
									<xsl:value-of 
									select="/castle_catalog/regions/region[region_id='$castle_region']/region_name/text()"/>
								</h4>
								<p class="castle-condition"><xsl:value-of select="condition"/></p>		   
								<p class="castle-description"><xsl:value-of select="description"/></p>					
							</div>						
						</xsl:for-each>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>