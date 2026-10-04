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

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="eventsClassPropertyConditions" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="externalActionModVarSceneAsString" />

        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsClassPropertyConditions" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>
                <xsl:with-param name="externalActionModVarSceneAsString" >
                    <xsl:value-of select="$externalActionModVarSceneAsString" />
                </xsl:with-param>
            </xsl:call-template>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            <xsl:for-each select="comment" >
                /*Comment: <xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="'&#10;'" /></xsl:with-param><xsl:with-param name="replacementText" >&#10;                //         </xsl:with-param></xsl:call-template>*/
            </xsl:for-each>
            <xsl:for-each select="comment2" >
                <xsl:if test="string-length(text()) > 0" >
                    /*Comment 2: <xsl:value-of select="text()" />*/
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="iterableVariableName" >
                //iterableVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="valueIteratorVariableName" >
                //valueIteratorVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="keyIteratorVariableName" >
                //keyIteratorVariableName <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="name" >
                //name <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="source" >
                <xsl:if test="string-length(text()) > 0" >
                    //source <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="colorR" >
                //colorR <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorG" >
                //colorG <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorB" >
                //colorB <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="target" >
                //target <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:if test="repeatExpression" >
                //repeatExpression=<xsl:value-of select="repeatExpression" />
            </xsl:if>

            <xsl:variable name="hasQualifyingParentConditions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'DepartScene' or type/value = 'SceneJustBegins'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:if test="$typeValue = 'TextObject::String'" >
                    //TextObject::String
                    <xsl:if test="preceding-sibling::actions[type/value/text() = 'Create']/parameters[2]/text() = parameters[1]/text()">
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //public final BasicArrayList <xsl:value-of select="$name" />GDObjectList = BasicArrayListD()
                    </xsl:if>
                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarSceneTxt'" >
                    <xsl:if test="contains($hasQualifyingParentConditions, 'found')">
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //ModVarSceneTxt
                    public var <xsl:value-of select="$name" />: String = null
                    </xsl:if>
                </xsl:if>

                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:if test="not(preceding::conditions[parameters[3]/text() = current()/parameters[3]/text()] and preceding::conditions[type/value = current()/type/value])" >
                    public var <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper: TimeDelayHelper = TimeDelayHelper(<xsl:for-each select="parameters" ><xsl:if test="position() = 2" >(1000 * <xsl:value-of select="text()" />).toInt()</xsl:if></xsl:for-each>)
                    </xsl:if>
                </xsl:if>
                <xsl:if test="$typeValue = 'ObjectTimer'" >
                    //This should probably go under each GObject instance
                    <xsl:variable name="paramOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramThree0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramThree2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramThree0" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$paramOne" /></xsl:with-param><xsl:with-param name="replacementText" >(gameLayer.gdObject as GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="paramOne" />)</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:variable name="paramThree3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramThree2" /></xsl:with-param><xsl:with-param name="find" >Variable(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:variable name="paramThree" ><xsl:value-of select="substring($paramThree3, 0, string-length($paramThree3))" /></xsl:variable>

                    public var <xsl:value-of select="$paramOne" />PortionElapsedTotalArray: FloatArray = FloatArray(10)
                    public val <xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList: BasicArrayList = BasicArrayListD()

                    open public fun ObjectTimerElapsedTime(index: Int, name: String): Float {
                        val gameLayer: GDGameLayer = <xsl:value-of select="$paramOne" />GDGameLayerList.get(index) as GDGameLayer
                        val max: Float = <xsl:value-of select="$paramThree" />

                        if(<xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index] <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> max) {
                            //final float elapsed = (this.<xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList.get(index) as TimeDelayHelper).getElapsed(lastStartTime)
                            val elapsed: Float = this.timeDelta
                            <xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index] += elapsed / 1000

                            //this.logUtil.put(StringMaker().append("<xsl:value-of select="$paramOne" />PortionElapsedTotal: ").append(<xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index]).append(" max: ").append(max).toString(), this, this.commonStrings.PROCESS)
                            if(<xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index] <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> max) {
                                this.logUtil.put(StringMaker().append(index).append("<xsl:value-of select="$paramOne" />PortionElapsedTotal: ").append(<xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index]).append(" max: ").append(max).toString(), this, this.commonStrings.PROCESS)
                                <xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index] = max
                                (this.<xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList.get(index) as TimeDelayHelper).delay = Integer.MAX_VALUE
                            }
                        }

                        return <xsl:value-of select="$paramOne" />PortionElapsedTotalArray[index]
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    //GDNode - //MouseButtonReleased - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseButtonReleasedGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="$typeValue = 'MouseButtonFromTextReleased'" >
                    //GDNode - //MouseButtonFromTextReleased - //MouseButtonReleased - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseButtonFromTextReleasedGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="$typeValue = 'MouseButtonPressed'" >
                    //GDNode - //MouseButtonPressed - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseButtonPressedGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="$typeValue = 'MouseButtonFromTextPressed'" >
                    //GDNode - //MouseButtonFromTextPressed - //MouseButtonPressed  - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseButtonFromTextPressedGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="$typeValue = 'IsMouseWheelScrollingUp'" >
                    //GDNode - //IsMouseWheelScrollingUp  - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseWheelScrollingUpGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="$typeValue = 'IsMouseWheelScrollingDown'" >
                    //GDNode - //IsMouseWheelScrollingDown  - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseWheelScrollingDownGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="$typeValue = 'SourisBouton'" >
                    //GDNode - //MouseButton - //SourisBouton - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var mouseButtonGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
                <xsl:if test="type/value = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed'" >
                    //GDNode - //SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed - eventListener
                    //public EventListenerInterface eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = null
                    public var spriteMultitouchJoystickGDNode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: GDNode = null
                </xsl:if>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
