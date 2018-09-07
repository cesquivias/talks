<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" />

    <xsl:key name="files" match="file" use="." />

    <xsl:template match="problems">
        <xsl:apply-templates select="problem/file[generate-id() = generate-id(key('files', .)[1])]"/>
    </xsl:template>

    <xsl:template match="file">
        <xsl:variable name="current_file" select="." />
sed -i -e '<xsl:for-each select="key('files', $current_file)">
            <xsl:value-of select="../line" />d<xsl:if test="position() != last()">;</xsl:if></xsl:for-each>' <xsl:value-of select="substring($current_file, 22)" />
    </xsl:template>
</xsl:stylesheet>
