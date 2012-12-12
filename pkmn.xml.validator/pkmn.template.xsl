<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
	XSL Transformation document: Roster/Pokemon XML transformation
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
	
	<!-- Template section for a pokemon xml element -->
	<xsl:template match="pokemon">
<link rel="stylesheet" type="text/css" href="pkmn.template.css" />
<li class="pokemon" id="{@nickname}-{@name}-{@dexid}">
	<header>
		<img src="./pokemon/icons/{@dexid}.png" class="badge" alt="Pokedex Entry #{@dexid} icon" title="{@nickname}" />
		<xsl:value-of select="@nickname"/>
		<aside class="species {@gender}">#<xsl:value-of select="@dexid"/></aside>
	</header>
	<section class="details">
		<aside class="photo {@shiny}">
			<img src="./pokemon/main-sprites/black-white/{@shiny}/{@dexid}.png" alt="#{@dexid}" title="{@nickname} carrying {@item}" />
			<xsl:if test="@level">Lv.<xsl:value-of select="@level"/></xsl:if>
		</aside>

			<xsl:if test="./types">
		<ul class="type">
			<xsl:for-each select="./types/type">
			<li class="{@name}"><xsl:value-of select="@name" /></li>
			</xsl:for-each>
		</ul>
			</xsl:if>
			<xsl:if test="./stats">
		<ul class="stats">
			<xsl:for-each select="./stats/stat">
			<li title="EV: {@ev}, IV: {@iv}"><label><xsl:value-of select="@name" /></label><xsl:value-of select="@value" /></li>
			</xsl:for-each>
		</ul>
			</xsl:if>
	</section>
		<xsl:if test="@ability or @nature">
	<ul class="characteristics">
		<xsl:if test="@ability"><li><label>Ability:</label><xsl:value-of select="@ability" /></li></xsl:if>
		<xsl:if test="@nature"><li><label>Nature:</label><xsl:value-of select="@nature" /></li></xsl:if>
	</ul>
		</xsl:if>
		<xsl:if test="./moveset">
	<ul class="move type">
			<xsl:for-each select="./moveset/move">
		<li class="{@style} {@type}" title="{@pp} pp available"><xsl:value-of select="@name" /></li>
			</xsl:for-each>
	</ul>
		</xsl:if>
	<footer><xsl:value-of select="notes"/></footer>
</li>
	</xsl:template>
	<!-- /End of pokemon xml element template -->

	<!-- Template section for a roster element of pokemon elements -->
	<xsl:template match="/roster">
		<xsl:apply-templates select="pokemon" />
	</xsl:template>
	<!-- End of roster element template -->
</xsl:stylesheet>
