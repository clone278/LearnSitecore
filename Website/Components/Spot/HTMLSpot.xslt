<?xml version="1.0" encoding="UTF-8"?>

<!--=============================================================
    File: HTMLSpot.xslt                                                   
    Created by: sitecore\admin                                       
    Created: 02-08-2010 23:16:14                                               
    Copyright notice at bottom of file
==============================================================-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:sc="http://www.sitecore.net/sc" 
  xmlns:dot="http://www.sitecore.net/dot"
  exclude-result-prefixes="dot sc">

<!-- output directives -->
<xsl:output method="html" indent="no" encoding="UTF-8" />

<!-- parameters -->
<xsl:param name="lang" select="'en'"/>
<xsl:param name="id" select="''"/>
<xsl:param name="sc_item"/>
<xsl:param name="sc_currentitem"/>

<!-- variables -->
<!-- Uncomment one of the following lines if you need a "home" variable in you code -->
<!--<xsl:variable name="home" select="sc:item('/sitecore/content/home',.)" />-->
<!--<xsl:variable name="home" select="/*/item[@key='content']/item[@key='home']" />-->
<!--<xsl:variable name="home" select="$sc_currentitem/ancestor-or-self::item[@template='site root']" />-->


<!-- entry point -->
<xsl:template match="*">
  <xsl:apply-templates select="$sc_item" mode="main"/>
</xsl:template>

<!--==============================================================-->
<!-- main                                                         -->
<!--==============================================================-->
<xsl:template match="*" mode="main">
  <div class="Spot">
    <div class="HTMLSpot">
      <div class="SpotTitle">
        <sc:text field="Spot_Title"/>
      </div>
      <div class="SpotText">
        <sc:html field="Spot_Text"/>
      </div>
      <div class="SpotLink">
        <sc:link field="Spot_Link">
          <sc:text field="Spot_LinkText"/>
        </sc:link>
      </div>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>