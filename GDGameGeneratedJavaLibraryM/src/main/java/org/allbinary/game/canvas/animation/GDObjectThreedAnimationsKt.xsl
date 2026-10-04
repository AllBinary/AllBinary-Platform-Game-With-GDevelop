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

    <xsl:template name="threedAnimationFactoryCalls" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

//               this.logUtil.putF("scale: " + scale, this, this.commonStrings.PROCESS)

        //objectsAssign - threedAnimationFactoryCalls - START

        <xsl:variable name="foundTileMap" >
            <xsl:for-each select="objects" >
                <xsl:variable name="typeValue" select="type" />
                <xsl:if test="$typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite'" >found</xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:if test="contains($foundTileMap, 'found')" >
                this.add(this.specialAnimationResources.MAP_CELL_MODEL_IMAGE,
                    ThreedAnimationSingletonFactory(min3dSceneResourcesFactory.get(
                        this.specialAnimationResources.MAP_CELL_MODEL_IMAGE)[0])
                )
        </xsl:if>

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />

            <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="not(contains($threedExclusionsFound, 'found'))" >

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:choose>
            <xsl:when test="$typeValue = 'Sprite'" >
                this.add<xsl:value-of select="name" />SpriteAnimations(imageCache, level)
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite'" >
                this.add<xsl:value-of select="name" />TileMapAnimations(imageCache, level)
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::CollisionMask'" >
                this.add<xsl:value-of select="name" />TileMapCollisionMaskAnimations(imageCache, level)
            </xsl:when>

            <xsl:when test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                this.add<xsl:value-of select="name" />ParticleSystemAnimations(imageCache, level)
            </xsl:when>

            <xsl:when test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider'" >
                this.add<xsl:value-of select="name" />PanelSpriteSliderAnimations(imageCache, level)
            </xsl:when>

            <xsl:when test="$typeValue = 'TextObject::Text'" >
                this.add<xsl:value-of select="name" />TextObjectAnimations(imageCache, level)
            </xsl:when>

            <xsl:when test="$typeValue = 'TextInput::TextInputObject'" >
                this.add<xsl:value-of select="name" />TextInputObjectAnimations(imageCache, level)
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
        //objectsAssign - androidThreedAnimationFactoryCalls - END
    </xsl:template>

    <xsl:template name="threedAnimationFactory" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />

        //objectsAssign - threedAnimationFactory - START
        private val angleIncrement: Short = 1
        private val sequenceArray: IntArray = {-1}

        <xsl:for-each select="objects" >
            <xsl:variable name="objectIndex" select="position() - 1" />
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="nameInUpperCase" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

            <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="not(contains($threedExclusionsFound, 'found'))" >

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:variable name="hasMoreThanOneImage" ><xsl:for-each select="animations" ><xsl:for-each select="directions/sprites/image" ><xsl:if test="position() != 1" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:choose>
            <xsl:when test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />SpriteAnimations(imageCache: ImageCache, level: Int) {
                <xsl:if test="not(contains($name, 'btn_'))" >
                //Animation Total: <xsl:value-of select="count(animations)" />

        <xsl:choose>
            <xsl:when test="/game/properties/custom[name = $name and texture]" >
                <xsl:for-each select="/game/properties/custom" >
                    <xsl:if test="name = $name" >
                //name=<xsl:value-of select="name" /> texture=<xsl:value-of select="texture" />
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/game/properties/custom[name = 'all' and texture]" >
                <xsl:for-each select="/game/properties/custom" >
                    <xsl:if test="name = 'all'" >
                //name=<xsl:value-of select="name" /> texture=<xsl:value-of select="texture" />
                //TWB - replace this logic with a animation to texture mapping for each md2
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>

                val <xsl:value-of select="name" />List: BasicArrayList = BasicArrayListD()
                val <xsl:value-of select="name" />Object3dArray: Array&lt;Object3d&gt; = min3dSceneResourcesFactory.get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME)
                val loopTotalArray: IntArray = {<xsl:for-each select="animations" ><xsl:for-each select="directions" ><xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>,</xsl:for-each></xsl:for-each>}
                val frameDelayTime: LongArray = {<xsl:for-each select="animations" ><xsl:for-each select="directions" ><xsl:value-of select="timeBetweenFrames * 1000" />,</xsl:for-each></xsl:for-each>}
                val <xsl:value-of select="name" />Size: Int = <xsl:value-of select="name" />Object3dArray.length
                var object3d: Object3d
                //AnimationObject3d animationObject3d
                for(index in 0 until <xsl:value-of select="name" />Size) {
                    object3d = <xsl:value-of select="name" />Object3dArray[index]
                    if(object3d.getType() == 1) {

                    //animationObject3d = object3d as AnimationObject3d

                    <xsl:for-each select="/game/properties/threedAnimationAdjustment" >
                        <xsl:if test="scale" >
                        val scaleNumber3d: Number3d = object3d.getScale()
                        scaleNumber3d.x = <xsl:value-of select="scale/x" />f
                        scaleNumber3d.y = <xsl:value-of select="scale/y" />f
                        scaleNumber3d.z = <xsl:value-of select="scale/z" />f
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>

                        <xsl:value-of select="name" />List.add(<xsl:if test="/game/properties/threedAnimationAdjustment" >Adjustable</xsl:if>ThreedMorphingAnimationSingletonFactory(
                                object3d, loopTotalArray[index], frameDelayTime[index],
                        arrayOf&lt;String&gt;(
                                    specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME,
                                    //TWB - Use this as a second animation for now
                                    //specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME
                    ),
                    arrayOf&lt;MorphingProcessor&gt;(
                        //FirstFrameMorphingProcessor.getInstance(),
                        PlayMorphingProcessor.getInstance()
                        )<xsl:if test="/game/properties/threedAnimationAdjustment" >,
                                positionNumber3d, rotationNumber3d</xsl:if>
                        ))
                    } else {
                        <xsl:value-of select="name" />List.add(<xsl:if test="/game/properties/threedAnimationAdjustment" >Adjustable</xsl:if>ThreedAnimationSingletonFactory(
                                object3d, 1<xsl:for-each select="/game/properties/custom" ><xsl:if test="(name = $name or name = 'all') and param" ><xsl:value-of select="param" /></xsl:if></xsl:for-each><xsl:if test="/game/properties/threedAnimationAdjustment" >, positionNumber3d, rotationNumber3d</xsl:if>
                        ))
                    }
                }

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = <xsl:value-of select="name" />List.toArrayType(arrayOfNulls&lt;AnimationInterfaceFactoryInterface&gt;(<xsl:value-of select="name" />Size)) as Array&lt;AnimationInterfaceFactoryInterface&gt;
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
                                <xsl:variable name="hasOriginPointX" ><xsl:if test="animations/directions/sprites/originPoint/x = 0" >found</xsl:if></xsl:variable>
                                <xsl:for-each select=".." >
                                    <xsl:variable name="hasInstance" ><xsl:for-each select="instances" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="not(contains($hasInstance, 'found'))" >
                                        //No instance available - probably should not set instance values here anyways.
                                        <xsl:if test="contains($hasOriginPointX, 'found')" >
                                        //<xsl:value-of select="$name" />ImageArray[0].getHeight(), <xsl:value-of select="$name" />ImageArray[0].getHeight()<xsl:text>&#10;</xsl:text>
                                        0, 0
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
                                                        //<xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()<xsl:text>&#10;</xsl:text>
                                                        0, 0
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

                    <xsl:if test="$animationPosition = 1 and contains($hasCustomCollisionMask, 'found')" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(360) }
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

                var <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle

                if(AndroidUtil.isAndroid()) {

                    val widthF: Float = ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) / hackScale)
                    val heightF: Float = ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) / hackScale)
                    <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> - widthF * 3 / 4).toInt(), (<xsl:value-of select="array[1]/y" /> - heightF * 3 / 4).toInt()),
                                widthF.toInt() * 13 / 10, heightF.toInt() * 13 / 10)

                } else {
                    <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> * hackScale).toInt(), (<xsl:value-of select="array[1]/y" /> * hackScale).toInt()),
                                    ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * hackScale).toInt(), ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * hackScale).toInt()
                                )
                }

//                this.logUtil.putF("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, this.commonStrings.PROCESS)

                                    </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            <xsl:if test="not(hasCustomCollisionMask = 'true')" >
                                <xsl:if test="../../directions/sprites/originPoint/x != 0" >
                var <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle
                if(AndroidUtil.isAndroid()) {

                    <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = Rectangle(
                                pointFactory.createXY(
                        <xsl:for-each select=".." >
                            <xsl:for-each select=".." >
                    <xsl:if test="directions/sprites/originPoint/x != 0" >(-<xsl:value-of select="directions/sprites/originPoint/x" /> <xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and scale3d" > * <xsl:value-of select="scale3d" /></xsl:if></xsl:for-each>).toInt(), </xsl:if>
                    <xsl:if test="directions/sprites/originPoint/y != 0" >(-<xsl:value-of select="directions/sprites/originPoint/y" /> <xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and scale3d" > * <xsl:value-of select="scale3d" /></xsl:if></xsl:for-each>).toInt()), </xsl:if>
                    <xsl:if test="directions/sprites/originPoint/x != 0" >(<xsl:value-of select="directions/sprites/originPoint/x" /> * 2 <xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and scale3d" > * <xsl:value-of select="scale3d" /></xsl:if></xsl:for-each>).toInt(), </xsl:if>
                    <xsl:if test="directions/sprites/originPoint/y != 0" >(<xsl:value-of select="directions/sprites/originPoint/y" /> * 2 <xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and scale3d" > * <xsl:value-of select="scale3d" /></xsl:if></xsl:for-each>).toInt()) </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>

                    val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(360) }
                    rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$animationName1" />CollisionMask
                    for(index2 in 0 until <xsl:value-of select="$animationTotal" />) {
                        for(index in 0 until 360) {
                            rectangleArrayOfArrays[index2][index] = <xsl:value-of select="$animationName1" />CollisionMask
                        }
                    }

                    this.addRectangleArrayOfArrays(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, rectangleArrayOfArrays)

                }
                                </xsl:if>
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

<!--                            <xsl:if test="position() = 1" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = new Rectangle[<xsl:value-of select="last()" />];
                            </xsl:if>-->

                            <xsl:for-each select="customCollisionMask" >

                                <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$animationName1" />CollisionMask
                                </xsl:if>
                                <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
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

                    <xsl:if test="$animationPosition = last() and contains($hasCustomCollisionMask, 'found')" >
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

                    <xsl:if test="$animationPosition = 1 and contains($hasCustomCollisionMask, 'found')" >
                val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt; = Array(<xsl:value-of select="$animationTotal" />) { arrayOfNulls&lt;Rectangle&gt;(360) }
                    </xsl:if>

                    <xsl:for-each select="directions" >
                        <xsl:for-each select="sprites" >
                            <xsl:if test="hasCustomCollisionMask = 'true'" >

                            <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>
                            <xsl:variable name="last" ><xsl:value-of select="last()" /></xsl:variable>
                            //customCollisionMask - <xsl:value-of select="image" /> - Attack

<!--                            <xsl:if test="position() = 1" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />] = new Rectangle[<xsl:value-of select="last()" />];
                            </xsl:if>-->

                            <xsl:for-each select="customCollisionMask" >

                var <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask: Rectangle

                if(AndroidUtil.isAndroid()) {
                                    <xsl:if test="$name != 'Player'" >
                                        //non Player
                                        val hackScale: Float = scale
                                    </xsl:if>
                                    <xsl:if test="$name = 'Player'" >
                                        //Player
                                        val hackScale: Float = 0.125f * scale
                                    </xsl:if>

                    val widthF: Float = ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) / hackScale)
                    val heightF: Float = ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) / hackScale)
                    <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> - widthF * 3 / 4).toInt(), (<xsl:value-of select="array[1]/y" /> - heightF * 3 / 4).toInt()),
                                widthF.toInt() * 13 / 10, heightF.toInt() * 13 / 10)

                } else {

                    <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask = Rectangle(
                                pointFactory.createXY((<xsl:value-of select="array[1]/x" /> * scale).toInt(), (<xsl:value-of select="array[1]/y" /> * scale).toInt()),
                                    ((<xsl:value-of select="array[3]/x" /> - <xsl:value-of select="array[1]/x" />) * scale).toInt(), ((<xsl:value-of select="array[4]/y" /> - <xsl:value-of select="array[1]/y" />) * scale).toInt()
                                )

                }

//              this.logUtil.putF("Rectangle: " + <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask, this, this.commonStrings.PROCESS)

                                <xsl:if test="contains($hasMoreThanOneImage, 'found')" >
                rectangleArrayOfArrays[<xsl:value-of select="$animationPosition - 1" />][<xsl:value-of select="$position - 1" />] = <xsl:value-of select="$name" /><xsl:value-of select="$animationName" /><xsl:value-of select="$position" />CollisionMask
                                </xsl:if>
                                <xsl:if test="not(contains($hasMoreThanOneImage, 'found'))" >
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

            <xsl:when test="$typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
            private fun add<xsl:value-of select="name" />TileMapAnimations(imageCache: ImageCache, level: Int) {
                //Animation Total: <xsl:value-of select="count(animations)" />

<!--
                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT);
                }
-->

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

                val threedTiledLayerResourcesFactory: ThreedTiledLayerResourcesFactory = ThreedTiledLayerResourcesFactory.getInstance()

                <xsl:if test="not(type = 'TiledSpriteObject::TiledSprite')" >
                    <xsl:if test="not(/game/properties/tileMap/columns)" >
                if(true) throw RuntimeException()
                val columns: Int = -1
                val rows: Int = -1
                    </xsl:if>
                    <xsl:if test="/game/properties/tileMap/columns" >
                val columns: Int = <xsl:value-of select="/game/properties/tileMap/columns" />
                val rows: Int = <xsl:value-of select="/game/properties/tileMap/rows" />
                    </xsl:if>
                val total: Int = columns * rows

                val animationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;AnimationInterfaceFactoryInterface&gt;(total)

                val animationArray: Array&lt;Animation&gt; = arrayOfNulls&lt;Animation&gt;(total)

                //final FeaturedAnimationInterfaceFactoryInterfaceFactory featuredAnimationInterfaceFactoryInterfaceFactory =
                    //FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()

                for(index in 0 until total) {

                    //animationInterfaceFactoryInterfaceArray[index] = featuredAnimationInterfaceFactoryInterfaceFactory.get(this.specialAnimationResources.MAP_CELL_MODEL_IMAGE)
                    animationInterfaceFactoryInterfaceArray[index] = this.getHashtable().get(this.specialAnimationResources.MAP_CELL_MODEL_IMAGE) as AnimationInterfaceFactoryInterface
                    animationArray[index] = animationInterfaceFactoryInterfaceArray[index].getInstance(0)

                }

                val raceTrackThreedDataOne: RaceTrackThreedData = RaceTrackThreedData()

                raceTrackThreedDataOne.setAnimationInterfaceFactoryInterfaceArray(animationInterfaceFactoryInterfaceArray)
                raceTrackThreedDataOne.setAnimationArray(animationArray)

                threedTiledLayerResourcesFactory.add(level, raceTrackThreedDataOne)
                </xsl:if>
            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::CollisionMask'" >
            private fun add<xsl:value-of select="name" />TileMapCollisionMaskAnimations(imageCache: ImageCache, level: Int) {
                //Animation Total: <xsl:value-of select="count(animations)" />

<!--
                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT);
                }
-->

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

            }
            </xsl:when>

            <xsl:when test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
            private fun add<xsl:value-of select="name" />ParticleSystemAnimations(imageCache: ImageCache, level: Int) {
                <xsl:variable name="stringValue" select="string" />
                <xsl:if test="not(contains($name, 'btn_'))" >
                //Animation Total: <xsl:value-of select="count(animations)" />

        <xsl:choose>
            <xsl:when test="/game/properties/custom[name = $name and texture]" >
                <xsl:for-each select="/game/properties/custom" >
                    <xsl:if test="name = $name" >
                //name=<xsl:value-of select="name" /> texture=<xsl:value-of select="texture" />
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/game/properties/custom[name = 'all' and texture]" >
                <xsl:for-each select="/game/properties/custom" >
                    <xsl:if test="name = 'all'" >
                //name=<xsl:value-of select="name" /> texture=<xsl:value-of select="texture" />
                //TWB - replace this logic with a animation to texture mapping for each md2
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                animationToTextureFactory.add(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, threedAnimationResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>)
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>

                val <xsl:value-of select="name" />List: BasicArrayList = BasicArrayListD()
                val <xsl:value-of select="name" />Object3dArray: Array&lt;Object3d&gt; = min3dSceneResourcesFactory.get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME)
                val loopTotalArray: IntArray = {<xsl:for-each select="animations" ><xsl:for-each select="directions" ><xsl:if test="looping = 'true'" >-1</xsl:if><xsl:if test="looping = 'false'" >1</xsl:if>,</xsl:for-each></xsl:for-each>}
                val frameDelayTime: LongArray = {<xsl:for-each select="animations" ><xsl:for-each select="directions" ><xsl:value-of select="timeBetweenFrames * 1000" />,</xsl:for-each></xsl:for-each>}
                val <xsl:value-of select="name" />Size: Int = <xsl:value-of select="name" />Object3dArray.length
                var object3d: Object3d
                //AnimationObject3d animationObject3d
                for(index in 0 until <xsl:value-of select="name" />Size) {
                    object3d = <xsl:value-of select="name" />Object3dArray[index]
                    if(object3d.getType() == 1) {

                        //animationObject3d = object3d as AnimationObject3d

                        object3d.getScale().x = 20.0f
                        object3d.getScale().y = object3d.getScale().x
                        object3d.getScale().z = object3d.getScale().x

                        <xsl:value-of select="name" />List.add(<xsl:if test="/game/properties/threedAnimationAdjustment" >Adjustable</xsl:if>ThreedMorphingAnimationSingletonFactory(
                                object3d, loopTotalArray[index], frameDelayTime[index],
                        arrayOf&lt;String&gt;(
                                    specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME,
                                    //TWB - Use this as a second animation for now
                                    //specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME
                    ),
                    arrayOf&lt;MorphingProcessor&gt;(
                        //FirstFrameMorphingProcessor.getInstance(),
                        PlayMorphingProcessor.getInstance()
                        )<xsl:if test="/game/properties/threedAnimationAdjustment" >,
                                positionNumber3d, rotationNumber3d</xsl:if>
                        ))
                    } else {
                        <xsl:value-of select="name" />List.add(<xsl:if test="/game/properties/threedAnimationAdjustment" >Adjustable</xsl:if>ThreedAnimationSingletonFactory(
                            object3d, 1<xsl:for-each select="/game/properties/custom" ><xsl:if test="(name = $name or name = 'all') and param" ><xsl:value-of select="param" /></xsl:if></xsl:for-each><xsl:if test="/game/properties/threedAnimationAdjustment" >, positionNumber3d, rotationNumber3d</xsl:if>
                        ))
                    }
                }

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = <xsl:value-of select="name" />List.toArrayType(arrayOfNulls&lt;AnimationInterfaceFactoryInterface&gt;(<xsl:value-of select="name" />Size)) as Array&lt;AnimationInterfaceFactoryInterface&gt;
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
                private fun add<xsl:value-of select="name" />PanelSpriteSliderAnimations(imageCache: ImageCache, level: Int) {
                }
            </xsl:when>

            <xsl:when test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="stringValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&quot;'" /></xsl:with-param><xsl:with-param name="replacementText" >\"</xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="multilineString" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$stringValue2" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&#10;'" /></xsl:with-param><xsl:with-param name="replacementText" >\n").append("</xsl:with-param></xsl:call-template></xsl:variable>

            private fun add<xsl:value-of select="name" />TextObjectAnimations(imageCache: ImageCache, level: Int) {
                val <xsl:value-of select="name" />TextAnimationSize: Int = (<xsl:value-of select="characterSize" />)

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
            private fun add<xsl:value-of select="name" />TextInputObjectAnimations(imageCache: ImageCache, level: Int) {
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
        //objectsAssign - threedAnimationFactory - END
    </xsl:template>

    <xsl:template name="androidThreedAnimationFactory" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />

        //objectsAssign - androidThreedAnimationFactory - START
        val angleIncrement: Short = 1
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="nameInUpperCase" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="not(contains($threedExclusionsFound, 'found'))" >

            <xsl:choose>
            <xsl:when test="$typeValue = 'Sprite'" >
            private fun add<xsl:value-of select="name" />SpriteAnimations(imageCache: ImageCache) {
                <xsl:variable name="stringValue" select="string" />
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>

                    //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position() - 1" />] =
                    AllBinaryAndroidImageRotationAnimationFactory(
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />],
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getWidth(),
                    <xsl:value-of select="$name" />ImageArray[<xsl:value-of select="position() - 1" />].getHeight(),
                    angleIncrement
                    )<xsl:if test="position() != last()" >,</xsl:if>
                </xsl:for-each>
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

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
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" >//</xsl:if>(<xsl:value-of select="animations/directions/sprites/originPoint/x" /> / scale).toInt(), (<xsl:value-of select="animations/directions/sprites/originPoint/y" /> / scale).toInt()
                                <xsl:if test="animations/directions/sprites/originPoint/x = 0" ><xsl:value-of select="$name" />ImageArray[0].getWidth(), <xsl:value-of select="$name" />ImageArray[0].getHeight()</xsl:if>
                                )

                                <xsl:variable name="layerName" ><xsl:value-of select="name" /></xsl:variable>

                                <xsl:variable name="parentGroupIfAny" >
                                    <xsl:call-template name="getGroupsForLayer" >
                                        <xsl:with-param name="layerName" ><xsl:value-of select="$layerName" /></xsl:with-param>
                                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                this.addRectangle(<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />TileMapAnimations(imageCache: ImageCache, level: Int) {
                //Animation Total: <xsl:value-of select="count(animations)" />

<!--
                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT);
                }
-->
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

                val threedTiledLayerResourcesFactory: ThreedTiledLayerResourcesFactory = ThreedTiledLayerResourcesFactory.getInstance()

                val raceTrackThreedDataOne: RaceTrackThreedData = object : RaceTrackThreedData() {
                }

                threedTiledLayerResourcesFactory.add(level, raceTrackThreedDataOne)

            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TileMap::CollisionMask'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />TileMapCollisionMaskAnimations(imageCache: ImageCache, level: Int) {
                //Animation Total: <xsl:value-of select="count(animations)" />

<!--
                final Image[] <xsl:value-of select="name" />ImageArray = (Image[]) imageCache.getHashtableP().get(specialAnimationResources.<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME);

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw new Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)");
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT);
                }
-->
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

            }
            </xsl:when>

            <xsl:when test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
            private fun add<xsl:value-of select="name" />ParticleSystemAnimations(imageCache: ImageCache, level: Int) {
                <xsl:variable name="stringValue" select="string" />
                //Animation Total: <xsl:value-of select="count(animations)" />

                val <xsl:value-of select="name" />ImageArray: Array&lt;Image&gt; = imageCache.getHashtableP().get(<xsl:value-of select="$nameInUpperCase" />_IMAGE_ARRAY_NAME) as Array&lt;Image&gt;

                if(<xsl:value-of select="name" />ImageArray == null) {
                    throw Exception("<xsl:value-of select="name" />ImageArray was null (This happens 1 time during the initial loading)")
                } else {
                    this.logUtil.putF("<xsl:value-of select="name" />ImageArray found", this, this.commonStrings.INIT)
                }

                val <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt; = {
                    NullRotationAnimationFactory.getFactoryInstance()
                }

                val <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt; = arrayOfNulls&lt;ProceduralAnimationInterfaceFactoryInterface&gt;(0)

                this.add(<xsl:value-of select="$nameInUpperCase" />_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray))
                this.add(<xsl:value-of select="$nameInUpperCase" />_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(<xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray))

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
                this.addRectangle(<xsl:value-of select="$nameInUpperCase" />_RECTANGLE_NAME, <xsl:value-of select="name" />LayerInfo)

                <xsl:variable name="groupInterfaceArray" >
                    <xsl:if test="string-length($parentGroupIfAny) > 0" >arrayOf&lt;Group&gt;(globals.<xsl:value-of select="$parentGroupIfAny" />GroupInterface, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface)</xsl:if>
                    <xsl:if test="string-length($parentGroupIfAny) = 0" >arrayOf&lt;Group&gt;</xsl:if> as <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GroupInterface
                </xsl:variable>

                    <xsl:call-template name="objectsGroupsGDGameLayer" >
                        <xsl:with-param name="layerName" ><xsl:value-of select="$name" /></xsl:with-param>
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                    </xsl:call-template>

            }
            </xsl:when>

            <xsl:when test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
            private fun add<xsl:value-of select="name" />TextObjectAnimations(imageCache: ImageCache) {
                /*
<!--                final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                    NullRotationAnimationFactory.getFactoryInstance()
                };
                final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                final Rectangle <xsl:value-of select="name" />LayerInfo = new Rectangle(
                                pointFactory.createXY(0, 0),
                                0, 0
                                );
-->
                */

            }
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
        //objectsAssign - androidThreedAnimationFactory - END
    </xsl:template>

</xsl:stylesheet>
