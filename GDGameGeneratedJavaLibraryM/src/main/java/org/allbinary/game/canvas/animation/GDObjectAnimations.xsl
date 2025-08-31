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

    <xsl:template name="getSetSizeForObject" >
        <xsl:param name="name" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ResizableCapability::ResizableBehavior::SetSize'" >
                    <xsl:if test="parameters[1] = $name" >
                        //Action -  ResizableCapability::ResizableBehavior::SetSize - <xsl:value-of select="parameters[1]" />/<xsl:value-of select="$name" />
                        <xsl:text>&#10;</xsl:text>
                        <xsl:value-of select="parameters[3]" />, <xsl:value-of select="parameters[4]" />
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="getSetSizeForObject" >
                <xsl:with-param name="name" select="$name" />
            </xsl:call-template>

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="touchAnimationFactory" >
        <xsl:param name="platform" />
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="lazy" />
        
        //objectsAssign - touchAnimationFactory - START
        final int NaN = 0;
        final short angleIncrement = 1;
        <xsl:for-each select="objects" >
            <xsl:variable name="objectIndex" select="position() - 1" />
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="nameInUpperCase" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="contains($name, 'btn_')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    logUtil.put("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT);
                }    
                
<!--                <xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each>-->
                <xsl:variable name="hasMoreThanOneImage" >found</xsl:variable>
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>
                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position() - 1" />] = ;
                    <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                        <xsl:if test="contains($lazy, 'true')" >
                    new LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    //<xsl:value-of select="$platform" />
                    new OneRowSpriteIndexedAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />]
                    //,
                    //-<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth() / 2,
                    //-<xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight() / 2
                    //angleIncrement
                    </xsl:if>
                    <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
                        <xsl:if test="contains($lazy, 'true')" >
                    new LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>                        
                    new AllBinary<xsl:value-of select="$platform" />ImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    </xsl:if>
                    <xsl:for-each select="directions" >,
                    new IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    </xsl:for-each>
                    )
                        <xsl:if test="contains($lazy, 'true')" >
                    )
                        </xsl:if>
                    <xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(
                                <xsl:if test="animations/directions/sprites/originPoint/x != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />), 
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >
                                0, 
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/y" />)
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y = 0" >
                                0
                                </xsl:if>
                                ),
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(int) (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * animationScale), (int) (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * animationScale)
                                //old - <xsl:for-each select=".." ><xsl:for-each select="instances" ><xsl:if test="name = $name" ><xsl:if test="height = 0 or width = 0 or not(height) or not(width)" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" ><xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()</xsl:if></xsl:if><xsl:if test="height != 0 and width != 0" ><xsl:value-of select="width" />, <xsl:value-of select="height" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each>
                                <!--
                                -->
                                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                                <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways. - probably should not set instance values here anyways.
                                        0, 0
                                    </xsl:if>
                                    <xsl:for-each select="instances" >
                                        <xsl:if test="name = $name" >
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        (int) (<xsl:value-of select="$name" />ImageArray[0].getWidth() * scaleTouchButtons), (int) (<xsl:value-of select="$name" />ImageArray[0].getHeight() * scaleTouchButtons)
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    <xsl:value-of select="width" />, <xsl:value-of select="height" />
                                                </xsl:if>
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        <xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    <xsl:value-of select="width" />, <xsl:value-of select="height" />
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <!--
                                <xsl:for-each select="/game" >
                                    <xsl:for-each select="layouts" >
                                <xsl:call-template name="getSetSizeForObject" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                                </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:for-each>
                                -->
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
                this.addRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);
                
                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
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
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="contains($name, 'btn_')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    logUtil.put("<xsl:value-of select="name" />ImageArray found", this, commonStrings.INIT);
                }    
                    
                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    NullRotationAnimationFactory.getFactoryInstance()
                };

                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray));
                this.add(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray));
                
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.getInstance(0, 0),
                                0, 0
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
                this.addRectangle(specialAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo);

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >new Group[] {globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >new Group[] {<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface}</xsl:if>
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
            </xsl:if>

            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            </xsl:if>

            <xsl:if test="$typeValue = 'TextEntryObject::String'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = new GDConditionWithGroupActions();

            </xsl:if>

        </xsl:for-each>
        //objectsAssign = touchAnimationFactory - END
    </xsl:template>

    <xsl:template name="animationNames" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />

        //objects - all - //objectsAssign - animationNames - START
        <xsl:for-each select="objects" >
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

                <xsl:variable name="stringValue" select="string" />
                //Animation Total: <xsl:value-of select="count(animations)" />

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME = "<xsl:value-of select="name" />_image_array";

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME = "<xsl:value-of select="name" />_animation";

                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_PROCEDURAL_ANIMATION_NAME = "<xsl:value-of select="name" />_procedural_animation";
                
                public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME = "<xsl:value-of select="name" />_rectangle";

        </xsl:for-each>
        //objects - all - //objectsAssign - animationNames - END
    </xsl:template>

</xsl:stylesheet>
