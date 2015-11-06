<?xml version="1.0" encoding="UTF-8"?>

<!--=============================================================
    File: GlobalNavigation.xslt                                                   
    Created by: sitecore\admin                                       
    Created: 12-06-2010 17:47:08                                               
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
  <div class="GlobalNavigation">
    <xsl:variable name="root" select="ancestor-or-self::item[sc:IsItemOfType('_menuRoot',.)]/item[sc:IsItemOfType('_globalMenuRoot',.)]"/>
    <xsl:variable name="children" select="$root/item[sc:fld('Navigation_ShowInMenu',.)='1']"/>
    <xsl:if test="count($children) > 0">
      <ul>
        <xsl:for-each select="$children">
          <li>
            <sc:link select=".">
              <sc:text field="Navigation_Title"/>
            </sc:link>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    [This is the global navigation]
  </div>
</xsl:template>

</xsl:stylesheet>