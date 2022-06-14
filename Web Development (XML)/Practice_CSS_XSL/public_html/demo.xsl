<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : demo.xsl
    Created on : May 24, 2022, 10:21 AM
    Author     : ADMIN
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="catalog">
        <html>
            <head>
                <title>demo.xsl</title>
            </head>
            <body>
                <table>
                    <th>Title</th>
                    <xsl:for-each select="book">
                        <td >
                            <xsl:value-of select="title">
                                
                            </xsl:value-of>
                        </td>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
