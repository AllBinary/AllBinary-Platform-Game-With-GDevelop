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

    <xsl:template name="objectsAssign" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - START
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
            //With tags <xsl:for-each select="tags" >?</xsl:for-each>
            //With variables <xsl:for-each select="variables" >?</xsl:for-each>
            //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                final String[] <xsl:value-of select="name" />ResourceArray = {
                <xsl:for-each select="animations" >
                    <xsl:variable name="imageWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
                    GDResources.getInstance().<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>,
                </xsl:for-each>
                };

                final InputStream[] <xsl:value-of select="name" />InputStreamArray =
                {
                <xsl:for-each select="animations" >
                    resourceUtil.getResourceAsStream(<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]),
                </xsl:for-each>
                };

                final Image[] <xsl:value-of select="name" />ImageArray =
                {
                <xsl:for-each select="animations" >
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    Image.createImage(<xsl:value-of select="$name" />InputStreamArray[<xsl:value-of select="position() - 1" />]),
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    ImageCopyUtil.getInstance().createImage(Image.createImage(<xsl:value-of select="$name" />InputStreamArray[<xsl:value-of select="position() - 1" />]), 1.44f, true),
                    </xsl:if>
                </xsl:for-each>
                };

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position()" /> - 1] = ;
                    new AllBinaryAndroidImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    (short) 1
                    //angleIncrement
                    )<xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup();
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />), 
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/y" />)),
                                <xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 2, <xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 2
                                );
                <xsl:value-of select="name" />GDGameLayerFactory = new GDGameLayerFactory(
                    new Group[] {this.gdGroupHelper.get(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>), <xsl:value-of select="name" />GroupInterface},
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo);

            </xsl:if>
            <xsl:if test="$layoutIndex = 1" >
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                /*
                final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup();
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = new AnimationInterfaceFactoryInterface[0];
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(0, 0),
                                0, 0
                                );

                <xsl:value-of select="name" />GDGameLayerFactory = new GDGameLayerFactory(
                    new Group[] {<xsl:value-of select="name" />GroupInterface},
                    <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                    <xsl:value-of select="name" />LayerInfo);

                final GDConditionCollidableBehavior <xsl:value-of select="name" />GDConditionCollidableBehavior = new GDConditionCollidableBehavior();
                final GDGameLayer <xsl:value-of select="name" />GDGameLayer = <xsl:value-of select="name" />GDGameLayerFactory.create(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>, <xsl:value-of select="name" />, <xsl:value-of select="name" />GDConditionCollidableBehavior);

                this.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);
                */

                <xsl:value-of select="name" />GDGameLayerFactory = new NullGDGameLayerFactory();

            </xsl:if>
            </xsl:if>

        </xsl:for-each>
        //objectsAssign - END
    </xsl:template>

</xsl:stylesheet>
