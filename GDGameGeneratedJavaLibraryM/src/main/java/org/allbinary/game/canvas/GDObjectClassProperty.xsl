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

        <xsl:variable name="behaviorsAsString" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:value-of select="type" />,</xsl:for-each></xsl:for-each></xsl:variable>

        //behaviorsAsString=<xsl:value-of select="$behaviorsAsString" />
        <xsl:if test="contains($behaviorsAsString, 'DestroyOutsideBehavior::DestroyOutside,')" >
            public final GDBehavior destroyOutsideBehavior = new DestroyOutsideBehavior();
        </xsl:if>
            
        //objectsClassProperty - START
        <xsl:for-each select="objects" >
            
            <xsl:for-each select="animations" >
                <xsl:for-each select="directions" >
                //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    <xsl:for-each select="sprites" >
                    //image=<xsl:value-of select="image" /> hasCustomCollisionMask=<xsl:value-of select="hasCustomCollisionMask" />
                    //OriginPoint name=<xsl:value-of select="originPoint/name" /> x=<xsl:value-of select="originPoint/x" /> y=<xsl:value-of select="originPoint/y" />
                    //CenterPoint name=<xsl:value-of select="centerPoint/name" /> x=<xsl:value-of select="centerPoint/x" /> y=<xsl:value-of select="centerPoint/y" /> automatic=<xsl:value-of select="centerPoint/automatic" />
                    //customCollisionMask, array, x, y                            
                            <xsl:for-each select="points" >
                        //Point name=<xsl:value-of select="name" /> x=<xsl:value-of select="x" /> y=<xsl:value-of select="y" />
            //public final GPoint <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_POINT = PointFactory.getInstance().getInstance(<xsl:value-of select="x" />, <xsl:value-of select="y" />, 0);
            public final GPoint <xsl:value-of select="name" /> = PointFactory.getInstance().getInstance(<xsl:value-of select="x" />, <xsl:value-of select="y" />, 0);
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
            </xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //private BasicArrayList <xsl:value-of select="name" />List = ZERO_GD_OBJECT;
                //private BasicArrayList <xsl:value-of select="name" />GDGameLayerList;
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                public final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();
            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="name" />";
                public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
            </xsl:if>

        </xsl:for-each>

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                //Sprite - create properties
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                public final String <xsl:value-of select="$NAME" /> = "<xsl:value-of select="name" />";
                //public final GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory;
            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                //TextObject::Text - create properties
                <xsl:variable name="stringValue" select="string" />
                public final int <xsl:value-of select="name" />TextAnimationSize = (<xsl:value-of select="characterSize" /> * DisplayInfoSingleton.getInstance().getLastWidth()) / <xsl:value-of select="$windowWidth" />;
                public final CustomTextAnimation <xsl:value-of select="name" />TextAnimation =
                new CustomTextAnimation("<xsl:value-of select="$stringValue" />", Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, <xsl:value-of select="name" />TextAnimationSize));

                <xsl:variable name="name2" >,<xsl:value-of select="name" />,</xsl:variable>

            </xsl:if>
            //public Rectangle <xsl:value-of select="name" />Rectangle = null;

        </xsl:for-each>
        //objectsClassProperty - END

    </xsl:template>

</xsl:stylesheet>