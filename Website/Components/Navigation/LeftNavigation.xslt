<?xml version="1.0" encoding="UTF-8"?>

<!--=============================================================
    File: LeftNavigation.xslt                                                   
    Created by: sitecore\admin                                       
    Created: 15-05-2010 04:59:57                                               
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

  
<!-- entry point -->
<xsl:template match="*">
  <xsl:apply-templates select="$sc_item" mode="main"/>
</xsl:template>

<!--==============================================================-->
<!-- main                                                         -->
<!--==============================================================-->
<xsl:template match="*" mode="main">
  <div class="LeftNavigation">
    <xsl:variable name="home" select="ancestor-or-self::item[sc:IsItemOfType('_menuRoot',.)]"></xsl:variable>

    <xsl:call-template name="TraverseChildren">
      <xsl:with-param name="level" select="0"/>
      <xsl:with-param name="item" select="$home"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template name="TraverseChildren">
  <xsl:param name="level"></xsl:param>
  <xsl:param name="item"></xsl:param>

  <xsl:variable name="RenderableChildren" select="$item/item[sc:fld('Navigation_ShowInMenu',.) = '1']"/>
  <xsl:if test="count($RenderableChildren) > 0">
    <xsl:variable name="LevelCssClass" select="concat('MenuLevel',$level)"></xsl:variable>
    <ul class="{$LevelCssClass}">
      <xsl:for-each select="$RenderableChildren">
        <xsl:variable name="selected">
          <xsl:if test="current()/@id = $sc_currentitem/@id">
            Selected
          </xsl:if>
        </xsl:variable> 
        <xsl:call-template name="RenderItem">
          <xsl:with-param name="Item" select="."></xsl:with-param>
          <xsl:with-param name="Selected" select="$selected"></xsl:with-param>
        </xsl:call-template>

        <xsl:if test="current()/@id = $sc_currentitem/ancestor-or-self::item/@id">
          <xsl:call-template name="TraverseChildren">
            <xsl:with-param name="level" select="$level+1"/>
            <xsl:with-param name="item" select="."/>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </ul>
  </xsl:if>
</xsl:template>
  
  
  
  
<xsl:template name="RenderItem">
  <xsl:param name="Item"/>
  <xsl:param name="Selected"></xsl:param>

  <li class="{$Selected}">
    <sc:link select="$Item">
      <sc:text select="$Item" field="Navigation_Title"/>
    </sc:link>
    
  </li>
</xsl:template>

</xsl:stylesheet>