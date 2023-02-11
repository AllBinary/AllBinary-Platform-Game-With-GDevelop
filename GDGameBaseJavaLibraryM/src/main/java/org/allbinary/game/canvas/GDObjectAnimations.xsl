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

    <xsl:template name="imageProperties" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objects - SPRITES - START
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
                public final String[] <xsl:value-of select="name" />ResourceArray;

                public final InputStream[] <xsl:value-of select="name" />InputStreamArray;

                public final Image[] <xsl:value-of select="name" />ImageArray;

            </xsl:if>

        </xsl:for-each>
        //objects - SPRITES - END
    </xsl:template>

    <xsl:template name="imageCache" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objects - SPRITES - cache - START
                final Hashtable hashTable = imageCache.getHashtable();

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

                this.<xsl:value-of select="name" />ResourceArray = new String[] {
                <xsl:for-each select="animations" >
                    <xsl:variable name="imageWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>,
                </xsl:for-each>
                };

                this.<xsl:value-of select="name" />InputStreamArray = new InputStream[] {
                <xsl:for-each select="animations" >
                    resourceUtil.getResourceAsStream(<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]),
                </xsl:for-each>
                };

                this.<xsl:value-of select="name" />ImageArray = new Image[] {
                <xsl:for-each select="animations" >
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    Image.createImage(<xsl:value-of select="$name" />InputStreamArray[<xsl:value-of select="position() - 1" />]),
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    imageCopyUtil.createImage(Image.createImage(<xsl:value-of select="$name" />InputStreamArray[<xsl:value-of select="position() - 1" />]), 1.44f, true),
                    </xsl:if>
                </xsl:for-each>
                };

                hashTable.put(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME, <xsl:value-of select="name" />ImageArray);
            </xsl:if>

        </xsl:for-each>
        //objects - SPRITES - cache - END
    </xsl:template>

    <xsl:template name="animationFactory" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - START
        final short angleIncrement = 1;
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

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtable().get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    LogUtil.put(LogFactory.getInstance("<xsl:value-of select="name" />ImageArray found", this, CommonStrings.getInstance().INIT));
                }    

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position()" /> - 1] = ;
                    new AllBinaryImageArrayRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    )<xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />), 
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/y" />)),
                                <xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 2, <xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 2
                                );

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:variable name="groupName">
                                                    <xsl:value-of select="name" />
                                                </xsl:variable>
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="name = $layerName" >
                                                        <xsl:value-of select="$groupName" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                </xsl:variable>
                this.addRectangle(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, globals.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {globals.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                </xsl:variable>
                
                //objectsGroupsGDGameLayer - START
                <xsl:for-each select="/game">
                    <xsl:for-each select="layouts" >
                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                            
                            <xsl:for-each select="objectsGroups" >
                                <xsl:variable name="groupName">
                                    <xsl:value-of select="name" />
                                </xsl:variable>
                                <xsl:for-each select="objects" >
                                    <xsl:if test="name = $layerName" >
                //globals.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
                
            </xsl:if>
            <xsl:if test="$layoutIndex = 1" >
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                /*
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = new AnimationInterfaceFactoryInterface[0];
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(0, 0),
                                0, 0
                                );

                */

                final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            </xsl:if>
            </xsl:if>

        </xsl:for-each>
        //objectsAssign - END
    </xsl:template>

    <xsl:template name="androidAnimationFactory" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - START
        final short angleIncrement = 1;
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

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtable().get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    LogUtil.put(LogFactory.getInstance("<xsl:value-of select="name" />ImageArray found", this, CommonStrings.getInstance().INIT));
                }

                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position()" /> - 1] = ;
                    new AllBinaryAndroidImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    )<xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />), 
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/y" />)),
                                <xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 2, <xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 2
                                );

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:variable name="groupName">
                                                    <xsl:value-of select="name" />
                                                </xsl:variable>
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="name = $layerName" >
                                                        <xsl:value-of select="$groupName" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                </xsl:variable>
                this.addRectangle(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, globals.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {globals.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                </xsl:variable>
                
                //objectsGroupsGDGameLayer - START
                <xsl:for-each select="/game">
                    <xsl:for-each select="layouts" >
                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >
                            
                            <xsl:for-each select="objectsGroups" >
                                <xsl:variable name="groupName">
                                    <xsl:value-of select="name" />
                                </xsl:variable>
                                <xsl:for-each select="objects" >
                                    <xsl:if test="name = $layerName" >
                //globals.<xsl:value-of select="$layerName" />GroupInterface = <xsl:value-of select="$layerName" />GroupInterface;
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>

                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                //objectsGroupsGDGameLayer - END
                
            </xsl:if>
            <xsl:if test="$layoutIndex = 1" >
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                /*
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = new AnimationInterfaceFactoryInterface[0];
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                PointFactory.getInstance().getInstance(0, 0),
                                0, 0
                                );

                */

                final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            </xsl:if>
            </xsl:if>

        </xsl:for-each>
        //objectsAssign - END
    </xsl:template>

    <xsl:template name="animationNames" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
            //With tags <xsl:for-each select="tags" >?</xsl:for-each>
            //With variables <xsl:for-each select="variables" >?</xsl:for-each>
            //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                //Animation Total: <xsl:value-of select="count(animations)" />

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME = "<xsl:value-of select="name" />_image_array";

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME = "<xsl:value-of select="name" />_animation";

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME = "<xsl:value-of select="name" />_procedural_animation";
                
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME = "<xsl:value-of select="name" />_rectangle";
            </xsl:if>

        </xsl:for-each>
        //objectsAssign - END
    </xsl:template>

</xsl:stylesheet>
