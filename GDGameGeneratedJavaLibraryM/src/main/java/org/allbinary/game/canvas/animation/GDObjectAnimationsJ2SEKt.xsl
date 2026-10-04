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

    <xsl:template name="j2seAnimationFactoryCalls" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="useExclusionList" />

//               this.logUtil.putF("scale: " + scale, this, this.commonStrings.PROCESS)

        //objectsAssign - j2seAnimationFactoryCalls - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />

            <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="contains($threedExclusionsFound, 'found') or $useExclusionList != 'true'" >

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:choose>
            <xsl:when test="$typeValue = 'Sprite'" >
                this.add<xsl:value-of select="name" />SpriteAnimations(imageCache)
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                this.add<xsl:value-of select="name" />TileMapAndParticleSystemAnimations(imageCache)
            </xsl:when>

            <xsl:when test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider'" >
                this.add<xsl:value-of select="name" />PanelSpriteSliderAnimations(imageCache)
            </xsl:when>

            <xsl:when test="$typeValue = 'Scrollbar::Scrollbar'" >
                this.add<xsl:value-of select="name" />ScrollbarScrollbarAnimations(imageCache)
            </xsl:when>

            <xsl:when test="$typeValue = 'TextObject::Text'" >
                this.add<xsl:value-of select="name" />TextObjectAnimations(imageCache)
            </xsl:when>

            <xsl:when test="$typeValue = 'TextInput::TextInputObject'" >
                this.add<xsl:value-of select="name" />TextInputObjectAnimations(imageCache)
            </xsl:when>

<!--
            <xsl:when test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />
            </xsl:when>
-->

            <xsl:when test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
            </xsl:when>
            <xsl:when test="$typeValue = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
            </xsl:when>
            <xsl:when test="$typeValue = 'SelectBox::SelectBox'" >
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED - probably not needed
            </xsl:when>

            <xsl:otherwise>
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
            </xsl:otherwise>

            </xsl:choose>

            </xsl:if>

        </xsl:for-each>
        //objectsAssign - j2seAnimationFactoryCalls - END
    </xsl:template>

    <xsl:template name="j2seAnimationFactory" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="lazy" />
        <xsl:param name="useExclusionList" />

        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />

        //objectsAssign - j2seAnimationFactory - START
        val NaN: Int = 0
        private val angleIncrement: Short = 1
        private val sequenceArray: IntArray = {-1}

        <xsl:for-each select="objects" >
            <xsl:variable name="objectIndex" select="position() - 1" />
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="nameInUpperCase" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

            <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="contains($threedExclusionsFound, 'found') or $useExclusionList != 'true'" >

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:choose>
            <xsl:when test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />SpriteAnimations(imageCache: ImageCache) {
                <xsl:if test="not(contains($name, 'btn_'))" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

                <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                <xsl:variable name="hasMoreThanOneImageOrRotationDisabled" ><xsl:if test="contains($hasMoreThanOneImage, 'found')" >found</xsl:if><xsl:if test="/game/properties/custom[name = name and rotation]" >found</xsl:if></xsl:variable>
                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>

                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position() - 1" />] =
                    <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                        <xsl:if test="contains($lazy, 'true')" >
                    LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    OneRowSpriteIndexedAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    PrimitiveIntUtil.getArrayInstance(),
                    //)
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth() / <xsl:value-of select="count(directions/sprites)" />, <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight()
                                <xsl:for-each select=".." >
                                    <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways.
                                        , 0, 0
                                    </xsl:if>
                                    <xsl:for-each select="instances" >
                                        <xsl:if test="name = $name" >
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                -<xsl:value-of select="$name" />ImageArray[0].getWidth(), -<xsl:value-of select="$name" />ImageArray[0].getHeight()
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not
                                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                                                    <xsl:if test="contains($hasOriginPointX, 'found')" >
                                                        //-<xsl:value-of select="$name" />ImageArray[0].getWidth(), -<xsl:value-of select="$name" />ImageArray[0].getHeight()
                                                        , 0, 0
                                                    </xsl:if>
                                                </xsl:if>
                                                <xsl:if test="height != 0 and width != 0" >
                                                    //-(<xsl:value-of select="width" /> / 2), -(<xsl:value-of select="height" /> / 2)
                                                    , 0, 0
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                </xsl:for-each>
                    //angleIncrement
                    </xsl:if>
                    <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found'))" >
                        <xsl:if test="contains($lazy, 'true')" >
                    LazyImageRotationAnimationFactory(<xsl:value-of select="$layoutIndex + 1" />, <xsl:value-of select="$objectIndex" />,
                        </xsl:if>
                    AllBinaryJ2SEImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    </xsl:if>
                    <xsl:for-each select="directions" >,
                    IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    </xsl:for-each>
                    <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found'))" >, true</xsl:if>)
                        <xsl:if test="contains($lazy, 'true')" >
                    )
                        </xsl:if>
                        <xsl:if test="$name = 'Background'" >
                            //Temp Hack for background
                    {
                        open public fun setInitialScale(scaleProperties: ScaleProperties) {
                            val scaleProperties1: ScaleProperties = ScaleProperties()
                            scaleProperties1.shouldScale = scaleProperties.shouldScale
                            scaleProperties1.scaleX = scaleProperties.scaleX * 116 / 100
                            scaleProperties1.scaleY = scaleProperties.scaleY * 116 / 100
                            scaleProperties1.scaleWidth = scaleProperties.scaleWidth * 116 / 100
                            scaleProperties1.scaleHeight = scaleProperties.scaleHeight * 116 / 100
                            //scaleProperties1.scaleX = scaleProperties.scaleX * 58 / 100
                            //scaleProperties1.scaleY = scaleProperties.scaleY * 58 / 100
                            //scaleProperties1.scaleWidth = scaleProperties.scaleWidth * 58 / 100
                            //scaleProperties1.scaleHeight = scaleProperties.scaleHeight * 58 / 100
                            super.setInitialScale(scaleProperties1)

                        }
                    }
                        </xsl:if>
                    <xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(
                                <xsl:if test="animations/directions/sprites/originPoint/x != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * 36 / 25) - (<xsl:value-of select="animations/directions/sprites/originPoint/x" />),
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >
                                0,
                                </xsl:if>
                                <xsl:if test="animations/directions/sprites/originPoint/y != 0" >
                                (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * 36 / 25) - </xsl:if> as <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                                <xsl:if test="animations/directions/sprites/originPoint/y = 0" >
                                0
                                </xsl:if>
                                ),
                                <xsl:if test="not(animations/directions/sprites/originPoint) or animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(<xsl:value-of select="animations/directions/sprites/originPoint/x" /> * animationScale).toInt(), (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> * animationScale).toInt()
                                //old - <xsl:for-each select=".." ><xsl:for-each select="instances" ><xsl:if test="name = $name" ><xsl:if test="height = 0 or width = 0 or not(height) or not(width)" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" ><xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()</xsl:if></xsl:if><xsl:if test="height != 0 and width != 0" ><xsl:value-of select="width" />, <xsl:value-of select="height" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each>
                                <!--
                                -->
                                <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways.
                                        <xsl:if test="contains($hasOriginPointX, 'found')" >
                                        <xsl:value-of select="$name" />ImageArray[0].getHeight(), <xsl:value-of select="$name" />ImageArray[0].getHeight()
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:for-each select="instances" >
                                        <xsl:if test="name = $name" >
                                        <xsl:if test="not(preceding-sibling::instances[name = $name])" >
                                            <xsl:if test="contains(name, 'btn_')" >
                                                //btn_ - found
                                                (<xsl:value-of select="$name" />ImageArray[0].getWidth() * scaleTouchButtons).toInt(), (<xsl:value-of select="$name" />ImageArray[0].getHeight() * scaleTouchButtons).toInt()
                                            </xsl:if>
                                            <xsl:if test="not(contains(name, 'btn_'))" >
                                                //btn_ - not 2
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
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="animationName1" ><xsl:for-each select="animations" ><xsl:if test="position() = 1" ><xsl:value-of select="$name" /><xsl:value-of select="name" />1</xsl:if></xsl:for-each></xsl:variable>

                <xsl:for-each select="animations" >
<!--                 //Animation name = <xsl:value-of select="name" />-->
<!--                         or contains($name, 'MaskEnemy')-->
                    <xsl:if test="not(name or contains($name, 'Attack') or contains($name, 'Projectile')) or string-length(name) = 0 or $name = 'Player'" >
                    //Not (Attack or Projectile) or Name Empty or Player
                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:variable name="animationPosition" ><xsl:value-of select="position()" /></xsl:variable>
                    <xsl:variable name="animationTotal" ><xsl:value-of select="last()" /></xsl:variable>

                    <xsl:variable name="hasCustomCollisionMask" >
                        <xsl:for-each select="directions" >
                            <xsl:for-each select="sprites" >
                                <xsl:if test="hasCustomCollisionMask = 'true'" >
                                    <xsl:if test="position() = 1" >found</xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:if test="$animationPosition = 1" >
                        <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(0) }
                        </xsl:if>
                        <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found'))" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(360) }
                        </xsl:if>

<!--                //<xsl:value-of select="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" /> and <xsl:value-of select="contains($hasCustomCollisionMask, 'found')" />-->
                        <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found')) and not(contains($hasCustomCollisionMask, 'found'))" >
                //Auto generated CollisionMask for RotationAnimations
                val autoScale: Float = 1.0f
                //this.logUtil.putF("<xsl:value-of select="$name" /> autoScale: " + autoScale, this, this.commonStrings.INIT)
                val newX: Float = (<xsl:value-of select="$name" />LayerInfo.getWidth() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getWidth()) / 2
                val newY: Float = (<xsl:value-of select="$name" />LayerInfo.getHeight() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getHeight()) / 2
                val <xsl:value-of select="$name" />RotationCollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((newX * 3 * autoScale).toInt(), (newY * 3 * autoScale).toInt()), (<xsl:value-of select="$name" />LayerInfo.getWidth() * 3 * autoScale).toInt(), (<xsl:value-of select="$name" />LayerInfo.getHeight() * 3 * autoScale).toInt()
                                )
                for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                    for(index in 0 until 360) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$name" />RotationCollisionMask
                    }
                }
                        </xsl:if>
                    </xsl:if>

                    <xsl:if test="position() = 1" >

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >

                            <xsl:variable name="image" ><xsl:value-of select="image" /></xsl:variable>
                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:for-each select="customCollisionMask" >
                //customCollisionMask - <xsl:value-of select="$image" />
                                    <xsl:if test="$position = 1" >
                                    <xsl:if test="$name != 'Player'" >
                                        //non Player
                                        val hackScale: Float = scale
                                    </xsl:if>
                                    <xsl:if test="$name = 'Player'" >
                                        //Player
                                        val hackScale: Float = 0.125f * scale
                                    </xsl:if>
                val <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> * hackScale).toInt(), (<xsl:value-of select="array[1]/y" /> * hackScale).toInt()),
                                    ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * hackScale).toInt(), ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * hackScale).toInt()
                                )

//                this.logUtil.putF("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, this.commonStrings.PROCESS)

                                    </xsl:if>

                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    </xsl:if>

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >

                            <xsl:variable name="image" ><xsl:value-of select="image" /></xsl:variable>
                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:if test="position() = 1" >
                                <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = arrayOfNulls&lt;Rectangle&gt;(<xsl:value-of select="last()" />)
                                </xsl:if>
                            </xsl:if>

                            <xsl:for-each select="customCollisionMask" >
                                <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$animationName1" />CollisionMask
                                </xsl:if>
                                <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found'))" >
                for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                    for(index in 0 until 360) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$animationName1" />CollisionMask
                    }
                }
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:if test="$animationPosition = last() and (contains($hasCustomCollisionMask, 'found') or not(contains($hasMoreThanOneImageOrRotationDisabled, 'found') and contains($hasCustomCollisionMask, 'found')))" >
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays)
                    </xsl:if>

                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="animations" >
                    <xsl:if test="string-length(name) > 0" >
                    <xsl:if test="$name != 'Player'" >
<!--                         or contains($name, 'MaskEnemy')-->
                    <xsl:if test="contains($name, 'Attack') or contains($name, 'Projectile')" >

                    //Has Name and not Player and (Attack or Projectile)
                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:variable name="animationPosition" ><xsl:value-of select="position()" /></xsl:variable>
                    <xsl:variable name="animationTotal" ><xsl:value-of select="last()" /></xsl:variable>

                    <xsl:variable name="hasCustomCollisionMask" >
                        <xsl:for-each select="directions" >
                            <xsl:for-each select="sprites" >
                                <xsl:if test="hasCustomCollisionMask = 'true'" >
                                    <xsl:if test="position() = 1" >found</xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:variable>

                    <xsl:if test="$animationPosition = 1" >
                        <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(0) }
                        </xsl:if>
                        <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found'))" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(360) }
                        </xsl:if>

                        <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found')) and not(contains($hasCustomCollisionMask, 'found'))" >
                //Auto generated CollisionMask for RotationAnimations
                val autoScale: Float = 1.0f
                //this.logUtil.putF("<xsl:value-of select="$name" /> autoScale: " + autoScale, this, this.commonStrings.INIT)
                val newX: Float = (<xsl:value-of select="$name" />LayerInfo.getWidth() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getWidth()) / 2
                val newY: Float = (<xsl:value-of select="$name" />LayerInfo.getHeight() * 1.44f - <xsl:value-of select="$name" />LayerInfo.getHeight()) / 2
                val <xsl:value-of select="$name" />RotationCollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((newX * 3 * autoScale).toInt(), (newY * 3 * autoScale).toInt()), (<xsl:value-of select="$name" />LayerInfo.getWidth() * 3 * autoScale).toInt(), (<xsl:value-of select="$name" />LayerInfo.getHeight() * 3 * autoScale).toInt()
                                )
                for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                    for(index in 0 until 360) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$name" />RotationCollisionMask
                    }
                }
                         </xsl:if>
                    </xsl:if>

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            //customCollisionMask - <xsl:value-of select="image" /> - Attack

                            <xsl:if test="position() = 1" >
                                <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = arrayOfNulls&lt;Rectangle&gt;(<xsl:value-of select="last()" />)
                                </xsl:if>
                            </xsl:if>

                            <xsl:for-each select="customCollisionMask" >
                val <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> * scale).toInt(), (<xsl:value-of select="array[1]/y" /> * scale).toInt()),
                                    ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * scale).toInt(), ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * scale).toInt()
                                )

//              this.logUtil.putF("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, this.commonStrings.PROCESS)

                                <xsl:if test="contains($hasMoreThanOneImageOrRotationDisabled, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask
                                </xsl:if>
                                <xsl:if test="not(contains($hasMoreThanOneImageOrRotationDisabled, 'found'))" >
               for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                    for(index in 0 until 360) {
                        rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask
                    }
                }
                                </xsl:if>

                            </xsl:for-each>

                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>

                    <xsl:if test="$animationPosition = last()" >
                this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays)
                    </xsl:if>

                    </xsl:if>
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />TileMapAndParticleSystemAnimations(imageCache: ImageCache) {
                <xsl:if test="not(contains($name, 'btn_'))" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    NullRotationAnimationFactory.getFactoryInstance()
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(0, 0),
                                0, 0
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
            }
            </xsl:when>

            <xsl:when test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider'" >
            private fun add<xsl:value-of select="name" />PanelSpriteSliderAnimations(imageCache: ImageCache) {
                val <xsl:value-of select="$name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="$name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="$name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="$name" />ImageArray found", this, this.commonStrings.INIT)
                }

                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Label" >
                val <xsl:value-of select="$name" />TextAnimationSize: Int = (<xsl:value-of select="characterSize" />)
                    </xsl:for-each>
                </xsl:for-each>

                <xsl:variable name="hasMirrorFillBarBehavior" >
                <xsl:for-each select="behaviors" ><xsl:if test="type = 'MirrorFillBarExtension::MirrorFillBarBehavior'" >found</xsl:if></xsl:for-each>
                </xsl:variable>

                val <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray0: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Background" >
                    //Background
                    AllBinaryJ2SEImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[0],
                        <xsl:value-of select="$name" />ImageArray[0].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[0].getHeight(),
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    , true)
                    ,
                    </xsl:for-each>
                    <xsl:for-each select="FillBar" >
                    //FillBar
                    LeftToRightImageAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[1],
                        sequenceArray,
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[1].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[1].getHeight()) / 2,
                        AnimationBehaviorFactory.getInstance()
                    )
                    ,
                        <xsl:if test="not(contains($hasMirrorFillBarBehavior, 'found'))" >
                    //MirrorFillBarExtension::MirrorFillBarBehavior
                    NullRotationAnimationFactory(),
                        </xsl:if>
                        <xsl:for-each select="../../behaviors" >
                            <xsl:if test="type = 'MirrorFillBarExtension::MirrorFillBarBehavior'" >
                    RightToLeftImageAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[2],
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[2].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[2].getHeight()) / 2,
                        AnimationBehaviorFactory.getInstance()
                    )
                    ,
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each select="Thumb" >
                    //Thumb
                    AllBinaryJ2SEImageRotationAnimationFactory.createDXY(
                        <xsl:value-of select="$name" />ImageArray[4],
                        <xsl:value-of select="$name" />ImageArray[4].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[4].getHeight(),
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[2].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[4].getHeight()) / 2,
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    , true)
                    ,
                    </xsl:for-each>
                    <xsl:for-each select="Label" >
                    //Label
                    object : CustomTextAnimationFactory(stringUtil.EMPTY_STRING, <xsl:value-of select="$name" />TextAnimationSize, AnimationBehaviorFactory.getInstance()) {

                        open public fun setInitialScale(scaleProperties: ScaleProperties) {
                            //super.setInitialScale(scaleProperties)
                            this.dx = 0
                            this.dy = -1
                            this.scaleProperties = scaleProperties
                            //this.logUtil.put(StringMaker().append("setInitialScale - font: ").append(scaleProperties.scaleHeight).toString(), this, this.commonStrings.PROCESS)
                            //this.scaleWidth = scaleProperties.scalwWidth
                            val fontSize: Int = scaleProperties.scaleHeight
                            scaleProperties.scaleHeight = fontSize.toInt() - (fontSize / 2)
                            this.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, scaleProperties.scaleHeight)
                            this.logUtil.putF(StringMaker().append("setInitialScale - font: ").append(font.getSize()).toString(), this, this.commonStrings.PROCESS)
                        }

                    },
                    </xsl:for-each>
                </xsl:for-each>
                }

                val <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    SliderAnimationInterfaceFactory(
                        <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray0,
                        <xsl:value-of select="$name" />ImageArray[1].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[1].getHeight()
                    ) {
                        open public fun setInitialScale(scaleProperties: ScaleProperties) {
                            val scaleProperties1: ScaleProperties = ScaleProperties()
                            scaleProperties1.shouldScale = scaleProperties.shouldScale
                            scaleProperties1.scaleX = scaleProperties.scaleX
                            scaleProperties1.scaleY = scaleProperties.scaleY
                            scaleProperties1.scaleWidth = (scaleProperties.scaleWidth * 253 / 265) - (scaleProperties.scaleWidth * 22 / 265)
                            scaleProperties1.scaleHeight = scaleProperties.scaleHeight
                            super.setInitialScale(scaleProperties1)

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[0].setInitialScale(scaleProperties)

                            val scaleProperties2: ScaleProperties = ScaleProperties()
                            scaleProperties2.shouldScale = scaleProperties.shouldScale
                            scaleProperties2.scaleX = scaleProperties.scaleX
                            scaleProperties2.scaleY = scaleProperties.scaleY
                            scaleProperties2.scaleWidth = scaleProperties.scaleWidth * 253 / 265
                            scaleProperties2.scaleHeight = scaleProperties.scaleHeight * 16 / 34

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[1].setInitialScale(scaleProperties2)
                            this.basicAnimationInterfaceFactoryInterfaceArrayP[2].setInitialScale(scaleProperties2)

                            val scaleProperties3: ScaleProperties = ScaleProperties()
                            scaleProperties3.shouldScale = scaleProperties.shouldScale
                            scaleProperties3.scaleX = scaleProperties.scaleX
                            scaleProperties3.scaleY = scaleProperties.scaleY
                            scaleProperties3.scaleWidth = scaleProperties.scaleWidth * 22 / 265
                            scaleProperties3.scaleHeight = scaleProperties.scaleHeight * 22 / 34

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[3].setInitialScale(scaleProperties3)

                            val scaleProperties4: ScaleProperties = ScaleProperties()
                            scaleProperties4.shouldScale = scaleProperties.shouldScale
                            scaleProperties4.scaleX = scaleProperties.scaleX
                            scaleProperties4.scaleY = scaleProperties.scaleY
                            scaleProperties4.scaleWidth = scaleProperties.scaleWidth
                            scaleProperties4.scaleHeight = scaleProperties.scaleHeight

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[4].setInitialScale(scaleProperties4)
                        }
                    }
                }

                val <xsl:value-of select="$name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="$name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="$name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(0, 0),
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Background" >
                        <xsl:value-of select="width" />, <xsl:value-of select="height" />
                    </xsl:for-each>
               </xsl:for-each>
                                )

                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="$name" />LayerInfo)

                //final GDConditionWithGroupActions <xsl:value-of select="$name" />GDConditionWithGroupActions = GDConditionWithGroupActions()
            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="stringValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&quot;'" /></xsl:with-param><xsl:with-param name="replacementText" >\"</xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="multilineString" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue2" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&#10;'" /></xsl:with-param><xsl:with-param name="replacementText" >\n").append("</xsl:with-param></xsl:call-template></xsl:variable>

            private fun add<xsl:value-of select="name" />TextObjectAnimations(imageCache: ImageCache) {
                val <xsl:value-of select="name" />TextAnimationSize: Int = (<xsl:value-of select="characterSize" /> * 3 / 2)

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    CustomTextAnimationFactory(
                        <xsl:if test="$multilineString = ''" >stringUtil.EMPTY_STRING</xsl:if>
                        <xsl:if test="$multilineString = '&quot;&quot;'" >stringUtil.EMPTY_STRING</xsl:if>
                        <xsl:if test="not($multilineString = '' or $multilineString = '&quot;&quot;') and not(contains($multilineString, '.append('))" >"<xsl:value-of select="$multilineString" />"</xsl:if>
                        <xsl:if test="not($multilineString = '' or $multilineString = '&quot;&quot;') and contains($multilineString, '.append(')" >StringMaker().append("<xsl:value-of select="$multilineString" />").toString()</xsl:if>
                        ,
                        <xsl:value-of select="name" />TextAnimationSize, AnimationBehaviorFactory.getInstance())
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(0, 0),
                                <xsl:value-of select="name" />TextAnimationSize * (12 - 1), <xsl:value-of select="name" />TextAnimationSize
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = GDConditionWithGroupActions()
            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TextInput::TextInputObject'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />TextInputObjectAnimations(imageCache: ImageCache) {
                val maxLength: Int = if (<xsl:if test="content/maxLength" >(<xsl:value-of select="content/maxLength" /> == 0)) 8 else <xsl:value-of select="content/maxLength" />;</xsl:if><xsl:if test="not(content/maxLength)" >8</xsl:if>
                val <xsl:value-of select="name" />TextInputAnimationSize: Int = <xsl:value-of select="content/fontSize" />
                //final int <xsl:value-of select="name" />TextInputAnimationSize = <xsl:value-of select="content/fontSize" /> / 2

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    CustomTextBoxIndexedAnimationFactory(<xsl:value-of select="name" />TextInputAnimationSize, maxLength)
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(0, 0),
                                <xsl:value-of select="name" />TextInputAnimationSize * (12 - 1), <xsl:value-of select="name" />TextInputAnimationSize
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = GDConditionWithGroupActions()

            }
            </xsl:when>

            <xsl:when test="$typeValue = 'Scrollbar::Scrollbar'" >
                <xsl:text>&#10;</xsl:text>
            private fun add<xsl:value-of select="name" />ScrollbarScrollbarAnimations(imageCache: ImageCache) {
            //This impl is not done
            if(true) throw RuntimeException()

                val <xsl:value-of select="$name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="$name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="$name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="$name" />ImageArray found", this, this.commonStrings.INIT)
                }

                <xsl:for-each select="content" >
                //ThumbLengthMin=<xsl:value-of select="ThumbLengthMin" />
                </xsl:for-each>

<!--                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Label" >
                final int <xsl:value-of select="$name" />TextAnimationSize = (<xsl:value-of select="characterSize" />);
                    </xsl:for-each>
                </xsl:for-each>

                <xsl:variable name="hasMirrorFillBarBehavior" >
                <xsl:for-each select="behaviors" ><xsl:if test="type = 'MirrorFillBarExtension::MirrorFillBarBehavior'" >found</xsl:if></xsl:for-each>
                </xsl:variable>-->

                val <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray0: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Background" >
                    //Background
                    AllBinaryJ2SEImageRotationAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[0],
                        <xsl:value-of select="$name" />ImageArray[0].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[0].getHeight(),
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    , true)
                    ,
                    </xsl:for-each>
                    <xsl:for-each select="FillBar" >
                    //FillBar
                    TopToBottomImageAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[1],
                        sequenceArray,
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[1].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[1].getHeight()) / 2,
                        AnimationBehaviorFactory.getInstance()
                    )
                    ,
<!--                        <xsl:if test="not(contains($hasMirrorFillBarBehavior, 'found'))" >
                    new NullRotationAnimationFactory(),
                        </xsl:if>
                        <xsl:for-each select="../../behaviors" >
                            <xsl:if test="type = 'MirrorFillBarExtension::MirrorFillBarBehavior'" >
                    new BottomToTopImageAnimationFactory(
                        <xsl:value-of select="$name" />ImageArray[2],
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[2].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[2].getHeight()) / 2,
                        AnimationBehaviorFactory.getInstance()
                    )
                    ,
                            </xsl:if>
                        </xsl:for-each>
-->
                    </xsl:for-each>
                    <xsl:for-each select="Thumb" >
                    //Thumb
                    AllBinaryJ2SEImageRotationAnimationFactory.createDXY(
                        <xsl:value-of select="$name" />ImageArray[4],
                        <xsl:value-of select="$name" />ImageArray[4].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[4].getHeight(),
                        (<xsl:value-of select="$name" />ImageArray[0].getWidth() - <xsl:value-of select="$name" />ImageArray[2].getWidth()) / 2,
                        (<xsl:value-of select="$name" />ImageArray[0].getHeight() - <xsl:value-of select="$name" />ImageArray[4].getHeight()) / 2,
                        angleIncrement,
                        AnimationBehaviorFactory.getInstance()
                        //IndexedAnimationBehaviorFactory(<xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>, <xsl:value-of select="timeBetweenFrames * 1000" />)
                    , true)
                    ,
                    </xsl:for-each>
<!--                    <xsl:for-each select="Label" >
                    //Label
                    new CustomTextAnimationFactory(stringUtil.EMPTY_STRING, <xsl:value-of select="$name" />TextAnimationSize, AnimationBehaviorFactory.getInstance()) {

                        public void setInitialScale(final ScaleProperties scaleProperties) {
                            //super.setInitialScale(scaleProperties);
                            this.dx = 0;
                            this.dy = -1;
                            this.scaleProperties = scaleProperties;
                            //this.logUtil.put(new StringMaker().append("setInitialScale - font: ").append(scaleProperties.scaleHeight).toString(), this, this.commonStrings.PROCESS);
                            //this.scaleWidth = scaleProperties.scalwWidth;
                            final int fontSize = scaleProperties.scaleHeight;
                            scaleProperties.scaleHeight = (int) fontSize - (fontSize / 2);
                            this.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, scaleProperties.scaleHeight);
                            this.logUtil.putF(new StringMaker().append("setInitialScale - font: ").append(font.getSize()).toString(), this, this.commonStrings.PROCESS);
                        }

                    },
                    </xsl:for-each>-->
                </xsl:for-each>
                }

                val <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    ScrollBarAnimationInterfaceFactory(
                        <xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray0,
                        <xsl:value-of select="$name" />ImageArray[1].getWidth(),
                        <xsl:value-of select="$name" />ImageArray[1].getHeight()
                    ) {
                        open public fun setInitialScale(scaleProperties: ScaleProperties) {
                            val scaleProperties1: ScaleProperties = ScaleProperties()
                            scaleProperties1.shouldScale = scaleProperties.shouldScale
                            scaleProperties1.scaleX = scaleProperties.scaleX
                            scaleProperties1.scaleY = scaleProperties.scaleY
                            scaleProperties1.scaleWidth = (scaleProperties.scaleWidth * 253 / 265) - (scaleProperties.scaleWidth * 22 / 265)
                            scaleProperties1.scaleHeight = scaleProperties.scaleHeight
                            super.setInitialScale(scaleProperties1)

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[0].setInitialScale(scaleProperties)

                            val scaleProperties2: ScaleProperties = ScaleProperties()
                            scaleProperties2.shouldScale = scaleProperties.shouldScale
                            scaleProperties2.scaleX = scaleProperties.scaleX
                            scaleProperties2.scaleY = scaleProperties.scaleY
                            scaleProperties2.scaleWidth = scaleProperties.scaleWidth * 253 / 265
                            scaleProperties2.scaleHeight = scaleProperties.scaleHeight * 16 / 34

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[1].setInitialScale(scaleProperties2)
                            this.basicAnimationInterfaceFactoryInterfaceArrayP[2].setInitialScale(scaleProperties2)

                            val scaleProperties3: ScaleProperties = ScaleProperties()
                            scaleProperties3.shouldScale = scaleProperties.shouldScale
                            scaleProperties3.scaleX = scaleProperties.scaleX
                            scaleProperties3.scaleY = scaleProperties.scaleY
                            scaleProperties3.scaleWidth = scaleProperties.scaleWidth * 22 / 265
                            scaleProperties3.scaleHeight = scaleProperties.scaleHeight * 22 / 34

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[3].setInitialScale(scaleProperties3)

                            val scaleProperties4: ScaleProperties = ScaleProperties()
                            scaleProperties4.shouldScale = scaleProperties.shouldScale
                            scaleProperties4.scaleX = scaleProperties.scaleX
                            scaleProperties4.scaleY = scaleProperties.scaleY
                            scaleProperties4.scaleWidth = scaleProperties.scaleWidth
                            scaleProperties4.scaleHeight = scaleProperties.scaleHeight

                            this.basicAnimationInterfaceFactoryInterfaceArrayP[4].setInitialScale(scaleProperties4)
                        }
                    }
                }

                val <xsl:value-of select="$name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="$name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

                val <xsl:value-of select="$name" />LayerInfo: Rectangle = Rectangle(
                                pointFactory.createXY(0, 0),
                <xsl:for-each select="childrenContent" >
                    <xsl:for-each select="Background" >
                        <xsl:value-of select="width" />, <xsl:value-of select="height" />
                    </xsl:for-each>
               </xsl:for-each>
                                )

                this.addRectangle(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="$name" />LayerInfo)

                //final GDConditionWithGroupActions <xsl:value-of select="$name" />GDConditionWithGroupActions = GDConditionWithGroupActions()
            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                //final GDConditionWithGroupActions <xsl:value-of select="name" />GDConditionWithGroupActions = GDConditionWithGroupActions()

            </xsl:when>

            <xsl:when test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
            </xsl:when>
            <xsl:when test="$typeValue = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
            </xsl:when>
            <xsl:when test="$typeValue = 'SelectBox::SelectBox'" >
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED - probably not needed
            </xsl:when>

            <xsl:otherwise>
                <xsl:text>&#10;</xsl:text>
                //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
            </xsl:otherwise>

            </xsl:choose>

            </xsl:if>

        </xsl:for-each>
        //objectsAssign - j2seAnimationFactory - END
    </xsl:template>

</xsl:stylesheet>
