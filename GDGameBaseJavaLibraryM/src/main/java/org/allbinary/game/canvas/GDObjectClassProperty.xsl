<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="objectsClassProperty" >
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objectsClassProperty - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
            //With tags <xsl:for-each select="tags" >?</xsl:for-each>
            //With variables <xsl:for-each select="variables" >?</xsl:for-each>
            //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
            </xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                
                final class <xsl:value-of select="name" /> extends GDObject {
                
                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }
                    
                };

                private GDObject[] <xsl:value-of select="name" />Array;
                private BasicArrayList <xsl:value-of select="name" />GDGameLayerList;
            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                
                final class <xsl:value-of select="name" /> extends GDObject {

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }

                    public int Width(final Graphics graphics) {
                        return <xsl:value-of select="name" />TextAnimation.getWidth();
                    }

                    public int Height(final Graphics graphics) {
                        return <xsl:value-of select="name" />TextAnimationSize;
                    }
                };

                private GDObject[]<xsl:text> </xsl:text><xsl:value-of select="name" />Array = new GDObject[1];
                private BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(1);
            </xsl:if>

        </xsl:for-each>

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
            //With tags <xsl:for-each select="tags" >?</xsl:for-each>
            //With variables <xsl:for-each select="variables" >?</xsl:for-each>
            //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
            </xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                private final String <xsl:value-of select="$NAME" /> = "<xsl:value-of select="name" />";
                //private final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                private final int <xsl:value-of select="name" />TextAnimationSize = (<xsl:value-of select="characterSize" /> * DisplayInfoSingleton.getInstance().getLastWidth()) / <xsl:value-of select="$windowWidth" />;
                private final CustomTextAnimation <xsl:value-of select="name" />TextAnimation = 
                new CustomTextAnimation("<xsl:value-of select="$stringValue" />", Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, <xsl:value-of select="name" />TextAnimationSize));

                <xsl:variable name="name2" >,<xsl:value-of select="name" />,</xsl:variable>
                
                <xsl:if test="not(contains($instancesAsString, $name2))" >
                private int <xsl:value-of select="name" />X = 0;
                private int <xsl:value-of select="name" />Y = 0;
                </xsl:if>
            </xsl:if>
            //private Rectangle <xsl:value-of select="name" />Rectangle = null;

        </xsl:for-each>
        //objectsClassProperty - END
        
    </xsl:template>

</xsl:stylesheet>
