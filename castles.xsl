<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Каталог на крепостите в България</title>
				<link rel="stylesheet" type="text/css" href="./castles.css"/>
				<script type="text/javascript" src="./castles.js"></script>
			</head>
			<body>
				<h1 class="catalog-title">Каталог на крепостите в България</h1>
				<div class="container">
					<label for="sortBy" class="sort-by-label">Сортиране по:</label>
					<select name="sortBy" id="sortBy" onchange="sortCastles(this);">
						<option value="type_ASC">Тип (възх.)</option>
						<option value="type_DSC">Тип (низх.)</option>
						<option value="region_ASC">Регион (възх.)</option>
						<option value="region_DSC">Регион (низх.)</option>
						<option value="condition_ASC">Състояние (възх.)</option>
						<option value="condition_DSC">Състояние (низх.)</option>
						<option value="title_ASC">Име (възх.)</option>
						<option value="title_DSC">Име (низх.)</option>
					</select>
					<div id="catalogContainer" class="catalog-container">
						<xsl:for-each select="castle_catalog/castles/castle">
							<xsl:sort select="./type/@id" order="ascending"/>
							<xsl:sort select="./region" order="ascending"/>
							<xsl:sort select="./condition" order="ascending"/>
							<div class="castle-container">
								<!--XSL id variables-->
								<xsl:variable name="castle_type" select="./type/@id"/>
								<xsl:variable name="castle_region" select="./region/text()"/>
								
								<!--div attributes-->
								<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
								<xsl:attribute name="sorting-properties">
									<xsl:value-of select="title"/>;<xsl:value-of select="/castle_catalog/types/type[type_id=$castle_type]/type_name/text()"/>;<xsl:value-of select="/castle_catalog/regions/region[region_id=$castle_region]/region_name/text()"/>;<xsl:value-of select="condition"/>
								</xsl:attribute>
								
								<h2 class="castle-title"><xsl:value-of select="title"/></h2>							
								<img class="castle-image">
									<xsl:attribute name="src">
										<xsl:value-of select="unparsed-entity-uri(image/@href)"/>
									</xsl:attribute>
								</img>
								<h3 class="castle-type">Тип на крепостта:
									<xsl:value-of select="/castle_catalog/types/type[type_id=$castle_type]/type_name/text()"/>
								</h3>
								<h4 class="castle-region">Местонахождение:
									<xsl:value-of select="/castle_catalog/regions/region[region_id=$castle_region]/region_name/text()"/>
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