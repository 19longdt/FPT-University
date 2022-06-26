<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Horse.xsl
    Created on : June 4, 2022, 3:45 PM
    Author     : 19longdt
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="Race">
        <html>
            <head>
                <title>Race</title>
                <link rel="stylesheet" href="Horse.css" type="text/css"></link>
            </head>
            <body>
                <p id="Race"><xsl:value-of select="@date"/> - <xsl:value-of select="@name"/></p>
                <table>
                    <tr>
                        <td>Course</td>
                        <td>
                            <xsl:for-each select="Course">
                                <p id="courseName">
                                    <xsl:value-of select="CourseName"/> - <xsl:value-of select="Address"/>
                                </p>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <td>Horses</td>
                        <td >  
                            <table id="horse">
                                <xsl:for-each select="Horses/Horse">
                                    <tr>
                                        <td style="background-color: #7ee1cd;">Name: <xsl:value-of select="@Name"/></td>
                                    </tr>
                                    <tr  >
                                        <td>Value: <xsl:value-of select="Value"/>
                                            <br></br>
                                            Date_Of_Birth: <xsl:value-of select="DateOfBirth"/>
                                            <br></br>
                                            Gender: <xsl:value-of select="Gender"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </td>
                        
                    </tr>
                </table>
                
                
                
                
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
