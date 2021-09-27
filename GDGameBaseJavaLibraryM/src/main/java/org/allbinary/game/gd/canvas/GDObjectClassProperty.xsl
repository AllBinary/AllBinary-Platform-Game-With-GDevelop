<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : GDObjectClassProperty.xsl
    Created on : September 26, 2021, 10:02 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="objectsClassProperty" >
        <xsl:param name="windowWidth" />

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
                private final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
                private Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup();
                private GDObject <xsl:value-of select="name" />;
                private GDGameLayer <xsl:value-of select="name" />GDGameLayer;
            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                private final int <xsl:value-of select="name" />TextAnimationSize = (<xsl:value-of select="characterSize" /> * DisplayInfoSingleton.getInstance().getLastWidth()) / <xsl:value-of select="$windowWidth" />;
                private final CustomTextAnimation <xsl:value-of select="name" />TextAnimation = 
                new CustomTextAnimation("<xsl:value-of select="$stringValue" />", Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, <xsl:value-of select="name" />TextAnimationSize));
                
                final class <xsl:value-of select="name" /> extends GDObject {

                public <xsl:value-of select="name" />() {
                super(null, 0, 0, null);
                }

                public int Width(final Graphics graphics) {
                return <xsl:value-of select="name" />TextAnimation.getWidth();
                }

                public int Height(final Graphics graphics) {
                return <xsl:value-of select="name" />TextAnimationSize;
                }
                }

                final GDObject<xsl:text> </xsl:text><xsl:value-of select="name" /> = new <xsl:value-of select="name" />();
                
            </xsl:if>
            private Rectangle <xsl:value-of select="name" />Rectangle = null;
            private int <xsl:value-of select="name" />X = 0;
            private int <xsl:value-of select="name" />Y = 0;

        </xsl:for-each>
        //objectsClassProperty - END
        
    </xsl:template>

</xsl:stylesheet>
