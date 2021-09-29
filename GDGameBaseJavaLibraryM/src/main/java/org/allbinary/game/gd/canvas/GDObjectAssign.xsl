<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : GDObjectClassProperty.xsl
    Created on : September 26, 2021, 10:02 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="objectsAssign" >
        <xsl:param name="index" />
        <xsl:param name="windowWidth" />
        
        //objectsAssign - START
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
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
                //Animation Total: <xsl:value-of select="count(animations)" />
                <xsl:variable name="imageWithExtension" select="animations/directions/sprites/image" />
                <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
                final String <xsl:value-of select="name" />Resource = GDResources.getInstance().<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>;
                final InputStream <xsl:value-of select="name" />InputStream = resourceUtil.getResourceAsStream(<xsl:value-of select="name" />Resource);
                final Image <xsl:value-of select="name" />Image = Image.createImage(<xsl:value-of select="name" />InputStream);
                
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position()" />] = ;
                    new AllBinaryAndroidImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />Image, <xsl:value-of select="$name" />Image.getWidth(), <xsl:value-of select="$name" />Image.getHeight()
                    <xsl:for-each select="directions" >
                        //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                        <xsl:for-each select="sprites" >
                            //image=<xsl:value-of select="image" /> hasCustomCollisionMask=<xsl:value-of select="hasCustomCollisionMask" />
                            <xsl:for-each select="points" >
                                //Point name=<xsl:value-of select="name" /> x=<xsl:value-of select="x" /> y=<xsl:value-of select="y" />
                            </xsl:for-each>
                            //OriginPoint name=<xsl:value-of select="originPoint/name" /> x=<xsl:value-of select="originPoint/x" /> y=<xsl:value-of select="originPoint/y" />
                            //CenterPoint name=<xsl:value-of select="centerPoint/name" /> x=<xsl:value-of select="centerPoint/x" /> y=<xsl:value-of select="centerPoint/y" /> automatic=<xsl:value-of select="centerPoint/automatic" />
                            //customCollisionMask, array, x, y
                        </xsl:for-each>
                    </xsl:for-each>
                    )<xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup();
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(0, 0),
                                <xsl:value-of select="animations/directions/sprites/originPoint/x" />, <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                                );
                <xsl:value-of select="name" />GDGameLayerFactory = new GDGameLayerFactory(
                    new Group[] {this.gdGroupHelper.get(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>), <xsl:value-of select="name" />GroupInterface},
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo);
                
                this.<xsl:value-of select="name" /> = new GDObject(null, 0, 0, null);
                this.<xsl:value-of select="name" />GDGameLayer = <xsl:value-of select="name" />GDGameLayerFactory.create(this.<xsl:value-of select="name" />);
                allBinaryGameLayerManager.append(this.<xsl:value-of select="name" />GDGameLayer);
                
            </xsl:if>
            <xsl:if test="$index = 1" >
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                
                //final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup();
                //final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = new AnimationInterfaceFactoryInterface[0];
                //final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                //final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                //PointFactory.getInstance().getInstance(0, 0),
                                //0, 0
                                //);

                //<xsl:value-of select="name" />GDGameLayerFactory = new GDGameLayerFactory(
                    //<xsl:value-of select="name" />GroupInterface,
                    //<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    //<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    //<xsl:value-of select="name" />LayerInfo);
                    
                <xsl:value-of select="name" />GDGameLayerFactory = new NullGDGameLayerFactory();
                
            </xsl:if>
            </xsl:if>
            
        </xsl:for-each>        
        //objectsAssign - END
    </xsl:template>

</xsl:stylesheet>
