<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" indent="no"/>
	<!-- 
		methode de presentation pour le noeud '/'
		declench�e automatiquement
		point de depart de la transfo
	-->
	<xsl:template match="/">numero de facture;date facture;idclient;nb de ligne;montant total ht;montant tva;montant ttc;
<xsl:for-each select="//facture">
	<xsl:value-of select="@numfacture"/>;<xsl:value-of select="@datefacture"/>;<xsl:value-of select="@idclient"/>;<xsl:value-of select="count(.//ligne)"/>;<xsl:call-template name="calcul-totaux">
		<!--appel avec un param existant et declar� dans le template-->
		<xsl:with-param name="total_ht" select="sum(.//stotligne)"/>
	</xsl:call-template>
</xsl:for-each>
</xsl:template>
<!--
	equivalant a une methode dans d'autres languages
	explicitement appel�e par <xsl:call-template name="calcul-totaux"/>
-->
<xsl:template name="calcul-totaux">
	<!--def d'un parametre d'entree a fournir lors de l'appele-->
	<xsl:param name="total_ht"/>
	<xsl:value-of select="$total_ht"/>;
</xsl:template>
</xsl:stylesheet>
