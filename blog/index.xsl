<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:sets="http://exslt.org/sets"
                xmlns:exsl="http://exslt.org/common"
                xmlns:str="http://exslt.org/strings"
                extension-element-prefixes="exsl sets str"
                exclude-result-prefixes="xhtml"
                >

  <xsl:output method='xml' encoding="UTF-8" omit-xml-declaration="yes" />

  <xsl:param name="maxItem" />

  <xsl:template match="news">

    <xsl:for-each select="item[position() &lt;= $maxItem]">

      <section class="blog-header">
        <div>
          <h2>
            <xsl:apply-templates select="title/child::node()" mode="id"/>
          </h2>
          <time>
            <xsl:attribute name="datetime">
              <xsl:value-of select="substring(pubDate, 6, 11)" />
            </xsl:attribute>
            <xsl:value-of select="substring(pubDate, 6, 11)" />
          </time>
        </div>
      </section>

      <section class="blog-article">
          <xsl:copy-of select="description/child::node()" />
      </section>

    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
