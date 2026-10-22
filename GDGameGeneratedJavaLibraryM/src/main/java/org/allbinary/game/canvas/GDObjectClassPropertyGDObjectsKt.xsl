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

    <xsl:template name="variablesForGDObject" >
        <xsl:param name="layoutIndex" />
        
                    <xsl:for-each select="variables" >
                        <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                    //Object - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    public var <xsl:value-of select="name" />: String = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    public var <xsl:value-of select="name" />: Float = <xsl:value-of select="value" />
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="contains($name, 'speed')" >
                    //TWB - speed hack
                                <xsl:if test="contains($name, '_speed')" >
                    public var <xsl:value-of select="name" />: Float = if (<xsl:value-of select="value" /> * GDConfig.getInstance().getScaleHack()
                                </xsl:if>
                                <xsl:if test="contains($name, 'speed') and not(contains($name, '_speed'))" >
                    public var <xsl:value-of select="name" />: Int = if (<xsl:value-of select="value" /> * GDConfig.getInstance().getScaleHack()
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed') or contains(name, 'score'))" >
                    public var <xsl:value-of select="name" />: Int = <xsl:value-of select="value" />
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains(name, 'score')" >
                                <xsl:if test="value != '9223372036854776000'" >
                    public var <xsl:value-of select="name" />: Long = <xsl:value-of select="value" />
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                    //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                    public var <xsl:value-of select="name" />: Long = 9223372036854775807L
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    public var <xsl:value-of select="name" />: Boolean = <xsl:value-of select="value" />
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    public var <xsl:value-of select="name" />: BooleanArray = booleanArrayOf(
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                    )
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    public var <xsl:value-of select="name" />: IntArray = intArrayOf(
                            <xsl:for-each select="children" >
                                <xsl:if test="contains(value, ';')" >
                        basicColorUtil.getARGB(255, <xsl:value-of select="translate(translate(value, '\&quot;', ''), ';', ',')" />),
                                </xsl:if>
                                <xsl:if test="not(contains(value, ';'))" >
                        <xsl:value-of select="value" />,
                                </xsl:if>
                            </xsl:for-each>
                    )
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                        public var <xsl:value-of select="name" />: LongArray = longArrayOf(
                            <xsl:for-each select="children" >
                            <xsl:value-of select="value" />,
                            </xsl:for-each>
                        )
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                    public var <xsl:value-of select="name" />Index: Int = 0
                    public var <xsl:value-of select="name" />: Array&lt;String?&gt; = arrayOf(
                            <xsl:variable name="kotlinArrayItems88" >                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each></xsl:variable><xsl:call-template name="kotlinRemoveTrailingComma" ><xsl:with-param name="text" select="$kotlinArrayItems88" /></xsl:call-template>
                    )
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
    </xsl:template>

    <xsl:template name="variablesResetForGDObject" >
                    <xsl:for-each select="variables" >
                        <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                    //Object - //reset - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="contains(name, 'scale')" >
                    //Skip resetting scale
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'scale'))" >
                            <xsl:if test="contains($name, 'speed')" >
                    //TWB - speed hack
                    this.<xsl:value-of select="name" /> = if (<xsl:value-of select="value" /> * GDConfig.getInstance().getScaleHack()
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'time') or contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed'))" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                            </xsl:if>
                            <xsl:if test="contains(name, 'time') or contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                    //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                    this.<xsl:value-of select="name" /> = 9223372036854775807L
                                </xsl:if>
                            </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = booleanArrayOf(
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    )
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = intArrayOf(
                            <xsl:for-each select="children" >
                                <xsl:if test="contains(value, ';')" >
                        basicColorUtil.getARGB(255, <xsl:value-of select="translate(translate(value, '\&quot;', ''), ';', ',')" />),
                                </xsl:if>
                                <xsl:if test="not(contains(value, ';'))" >
                        <xsl:value-of select="value" />,
                                </xsl:if>
                            </xsl:for-each>
                    )
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                    this.<xsl:value-of select="name" /> = longArrayOf(
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                    )
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                    this.<xsl:value-of select="name" /> = arrayOf(
                            <xsl:variable name="kotlinArrayItems165" >                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each></xsl:variable><xsl:call-template name="kotlinRemoveTrailingComma" ><xsl:with-param name="text" select="$kotlinArrayItems165" /></xsl:call-template>
                    )
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
    </xsl:template>

    <xsl:template name="gdObject" >
        <xsl:param name="name" />
        <xsl:variable name="hasObjectInObjectsGroups" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        <xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" ><xsl:value-of select="$objectsGroupsName" /></xsl:if></xsl:for-each></xsl:for-each><xsl:if test="not(contains($hasObjectInObjectsGroups, 'found'))" >GDObject</xsl:if>
    </xsl:template>

    <xsl:template name="objectsClassPropertyGDObjects" >
        <xsl:param name="layoutIndex" />

        //ObjectsGroups - GDObject
        <xsl:for-each select="/game/layouts/objectsGroups" >
        open inner class <xsl:value-of select="name" /> : GDObject {

            public constructor(width: Int, height: Int, name: String, type: String) : super(width, height, name, type) {
            }

            <xsl:for-each select="objects" >
                <xsl:if test="position() = 1" >
                <xsl:variable name="objectName" select="name" />

            <xsl:for-each select="/game/layouts/objects" >
                <xsl:variable name="name" select="name" />

                    <xsl:if test="name = $objectName" >
                        <xsl:call-template name="variablesForGDObject" >
                            <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>

            </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

            //objectsClassPropertyGDObjects
            override fun reset() {
            <xsl:for-each select="objects" >
                <xsl:if test="position() = 1" >
                <xsl:variable name="objectName" select="name" />

            <xsl:for-each select="/game/layouts/objects" >
                <xsl:variable name="name" select="name" />

                <xsl:if test="name = $objectName" >
                    <xsl:call-template name="variablesResetForGDObject" />
                </xsl:if>

            </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

                this.initialVariables.reset()
            }

            /*
            open public fun setX(x: Int) {
                //if(Math.abs(x) > 10000)
                this.logUtil.put(StringMaker().append(" TWBx: ").append(x).toString(), this, this.commonStrings.PROCESS, Exception())
                super.setX(x)
            }

            open public fun setY(y: Int) {
                //if(Math.abs(y) > 10000)
                this.logUtil.put(StringMaker().append(" TWBy: ").append(y).toString(), this, this.commonStrings.PROCESS, Exception())
                super.setY(y)
            }
            */

        }
        </xsl:for-each>

        //objects - all - //objectsClassPropertyGDObjects - START
        <xsl:for-each select="objects" >

            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="type != 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //Generic GDObject
                open inner class <xsl:value-of select="name" /> : <xsl:call-template name="gdObject" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >, SoftJoystickInterface </xsl:if>{

                    private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()

                    <xsl:variable name="hasObjectInObjectsGroups" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                    <xsl:if test="not(contains($hasObjectInObjectsGroups, 'found'))" >

                        <xsl:call-template name="variablesForGDObject" >
                            <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        </xsl:call-template>

                    //objectsClassPropertyGDObjects2
                    override fun reset() {
                        <xsl:call-template name="variablesResetForGDObject" />

                        this.initialVariables.reset()

                    }
                    </xsl:if>

                <xsl:if test="animations" >
                    //animations/directions/sprites/originPoint/x <xsl:value-of select="animations/directions/sprites/originPoint/x" />
                    //animations/directions/sprites/originPoint/y <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                    public val ANIMATION_NAMES: Array&lt;String?&gt; = arrayOf(
                <xsl:for-each select="animations" >
                    <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(translate(name, ' ', '_'), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="string-length($animationName) > 0" >
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$animationName" /><xsl:if test="position() != last()" >,</xsl:if>
                    </xsl:if>
                </xsl:for-each>
                    )
                </xsl:if>

                    //type=<xsl:value-of select="type" />
                    public constructor(width: Int, height: Int, name: String) : super(width, height, name,
                    <xsl:if test="string-length(type) = 0 or type = 'TextObject::Text' or type = 'TextInput::TextInputObject' or type = 'PanelSpriteSlider::PanelSpriteSlider' or type = 'SelectBox::SelectBox'" >StringUtil.getInstance().EMPTY_STRING</xsl:if>
                    <xsl:if test="not(string-length(type) = 0 or type = 'TextObject::Text' or type = 'TextInput::TextInputObject' or type = 'PanelSpriteSlider::PanelSpriteSlider' or type = 'SelectBox::SelectBox')" >
<!--                        <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>-->
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance().<xsl:call-template name="upper-case" >
                            <xsl:with-param name="text" >
                                <xsl:value-of select="translate(type, ':', '_')" />
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                    ) {

                    <xsl:for-each select="behaviors" >
                        //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                        <xsl:if test="type = 'PathfindingBehavior::PathfindingBehavior'" >
                        this.behaviorArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = gdBehaviorUtil.getInstance(gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX)
                        //Behaviors are enabled by default.
                        this.isBehaviorEnabledArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = true
                        this.hasBehaviorArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = true
                        </xsl:if>
                        <xsl:if test="type = 'DraggableBehavior::Draggable'" >
                        this.behaviorArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = gdBehaviorUtil.getInstance(gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX)
                        //Behaviors are enabled by default.
                        this.isBehaviorEnabledArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = true
                        this.hasBehaviorArray[gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_BEHAVIOR_INDEX] = true
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:if test="contains($hasObjectInObjectsGroups, 'found')" >
                    <xsl:for-each select="variables" >
                        <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                    //animations - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="contains(name, 'scale')" >
                    //Skip resetting scale
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'scale'))" >
                            <xsl:if test="contains($name, 'speed')" >
                   //TWB - speed hack
                    this.<xsl:value-of select="name" /> = if (<xsl:value-of select="value" /> * GDConfig.getInstance().getScaleHack()
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed'))" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                    //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                    this.<xsl:value-of select="name" /> = 9223372036854775807L
                                </xsl:if>
                            </xsl:if>
                            </xsl:if>
                         </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    }
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                    }
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />L,
                            </xsl:for-each>
                    }
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    }
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:if>

                    }

                    <xsl:if test="animations" >
                    override fun getAnimationFromIndex(index: Int): String {
                        <xsl:variable name="hasAnimationWithName" >
                            <xsl:for-each select="animations" >
                                <xsl:if test="string-length(name) > 0" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:if test="contains($hasAnimationWithName, 'found')" >
                        return this.ANIMATION_NAMES[index]!!
                        </xsl:if>
                        <xsl:if test="not(contains($hasAnimationWithName, 'found'))" >
                        return stringUtil.EMPTY_STRING
                        </xsl:if>
                    }

                    override fun getAnimation(animationName: String): String {
                        val size: Int = ANIMATION_NAMES.size
                        for(index in 0 until size) {
                            if(this.ANIMATION_NAMES[index] == animationName) {
                                //this.logUtil.put(animationName, this, "getAnimation")
                                return this.ANIMATION_NAMES[index]!!
                            }
                        }

                        for(index in 0 until size) {
                            //TWB - This is slow please fix me.
                            if(this.ANIMATION_NAMES[index]!!.compareTo(animationName) == 0) {
                                //this.logUtil.put(animationName, this, "getAnimation")
                                return this.ANIMATION_NAMES[index]!!
                            }
                        }

                        throw RuntimeException(animationName)
                    }

                    override fun setAnimation(animationName: String): Boolean {
                        val size: Int = ANIMATION_NAMES.size
                        for(index in 0 until size) {
                            if(this.ANIMATION_NAMES[index] == animationName) {
                                //this.logUtil.put(animationName, this, "setAnimation")
                                if(this.animation != index) {
                                    this.animation = index
                                    return true
                                } else if(this.ANIMATION_NAMES.size == 1) {
                                    return true
                                } else {
                                    return false
                                }
                            }
                        }
                        return false
                    }
                    </xsl:if>

                    <xsl:if test="animations/directions/sprites/originPoint/x = 0 and animations/directions/sprites/originPoint/y = 0" >
<!--
                    open fun Width(graphics: Graphics): Int {
                        return canvasWidth
                    }

                    open fun Height(graphics: Graphics): Int {
                        return canvasHeight
                    }
-->
                    </xsl:if>

                    <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >

                        <xsl:for-each select="//eventsFunctionsExtensions" >

                            <xsl:if test="name = 'SpriteMultitouchJoystick'" >

                                <xsl:for-each select="eventsBasedObjects" >

                                    <xsl:for-each select="objects" >
<!--
                    <name>Border</name>
                    <type>Sprite</type>
-->
                    //type=<xsl:value-of select="type" />
                        <xsl:for-each select="behaviors" >
                    //private var name: String = "<xsl:value-of select="name" />"
                    //private var joystickIdentifier: String = "<xsl:value-of select="JoystickIdentifier" />"
                    //private var floatingEnabled: Boolean = <xsl:value-of select="FloatingEnabled" />
                    //private var touchIndex: Int = <xsl:value-of select="TouchIndex" />
                    //private var touchId: Int = <xsl:value-of select="TouchId" />
                    //private var controllerIdentifier: Int = <xsl:value-of select="ControllerIdentifier" />
                    //private var joystickAngle: Float = <xsl:value-of select="JoystickAngle" />
                    //private var joystickForce: Float = <xsl:value-of select="JoystickForce" />
                    private var deadZoneRadius: Float = <xsl:value-of select="DeadZoneRadius" />f / 2
                        </xsl:for-each>
                                   </xsl:for-each>

                                </xsl:for-each>

                            </xsl:if>

                        </xsl:for-each>

                    private var id: Int = 0
                    private var point: GPoint = pointFactory.getInstance().ZERO_ZERO
                    private var stickForceX: Float = 0.0f
                    private var stickForceY: Float = 0.0f

                    override fun setId(id: Int) {
                        this.id = id
                    }

                    override fun getId(): Int {
                        return this.id
                    }

                    override fun setPoint(point: GPoint) {
                        this.point = point
                    }

                    override fun getPoint(): GPoint {
                        return this.point
                    }

                    override fun setStickForceX(stickForceX: Float) {
                        this.stickForceX = stickForceX
                    }

                    override fun setStickForceY(stickForceY: Float) {
                        this.stickForceY = stickForceY
                    }

                    override fun StickForceX(): Float {
                        return stickForceX
                    }

                    override fun StickForceY(): Float {
                        return stickForceY
                    }

                    override fun DeadZoneRadius(): Float {
                        return deadZoneRadius
                    }
                    </xsl:if>
                    <xsl:if test="type = 'Scrollbar::Scrollbar'" >
                    private var scrollPositionValue: Int = 0
                    open public override fun setScrollPosition(scrollPositionValue: Int) {
                        this.scrollPositionValue = scrollPositionValue
                    }
                    open public override fun ScrollPosition(): Int {
                        return this.scrollPositionValue
                    }
                    </xsl:if>

                }

                open inner class <xsl:value-of select="name" />GDObjectClassGDObjectFactory : GDObjectFactory {


                    constructor() {

                    }

                    override fun get(width: Int, height: Int, name: String): GDObject {
                        return <xsl:value-of select="name" />(width, height, name)
                    }

                }

                public val <xsl:value-of select="name" />GDObjectFactory: GDObjectFactory = <xsl:value-of select="name" />GDObjectClassGDObjectFactory()

            </xsl:if>
            <xsl:if test="type = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />

                //ParticleSystem::ParticleEmitter - GDObject
                open inner class <xsl:value-of select="name" /> : GDObject {

                    //public val stringMaker: StringMaker = StringMaker()

                    public constructor(width: Int, height: Int, name: String) : super(width, height, name, StringUtil.getInstance().EMPTY_STRING) {
                    }

                    override fun Width(graphics: Graphics): Int {
                        return 0
                    }

                    override fun Height(graphics: Graphics): Int {
                        return 0
                    }

                    open public override fun String(): String {
                        //return stringMaker.toString()
                        return stringUtil.EMPTY_STRING
                    }
                }

                open inner class GDObjectClass2GDObjectFactory : GDObjectFactory {


                    constructor() {

                    }

                    override fun get(width: Int, height: Int, name: String): GDObject {
                        return <xsl:value-of select="name" />(width, height, name)
                    }

                }

                public val <xsl:value-of select="name" />GDObjectFactory: GDObjectFactory = GDObjectClass2GDObjectFactory()

            </xsl:if>

        </xsl:for-each>
        //objects - all - //objectsClassPropertyGDObjects - END

    </xsl:template>

</xsl:stylesheet>
