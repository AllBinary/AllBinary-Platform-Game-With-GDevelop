<?xml version="1.0" encoding="UTF-8" ?>

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
    <xsl:output method="html" indent="yes" />

    <xsl:template name="javascriptCodeEventGDNode" >
        <xsl:param name="totalRecursions" />

                            //BuiltinCommonInstructions::JsCode
                            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                                throw RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />")
                            }
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                                private val EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />"
                                <xsl:text>&#10;</xsl:text>

                                <xsl:if test="contains(inlineCode, 'SpeechSynthesisUtterance')" >

                                private var textToSpeech: org.allbinary.media.voice.TextToSpeech
                                <xsl:text>&#10;</xsl:text>

                                open public fun init() {
                                    super.init()
                                    textToSpeech = org.allbinary.media.voice.TextToSpeech()
                                    textToSpeech.init()
                                }

                                //BuiltinCommonInstructions::JsCode - event
                                override public fun process(): Boolean {
                                    <xsl:variable name="speechVariable1" ><xsl:value-of select="substring(substring-after(inlineCode,'variables.get'), 3)" /></xsl:variable>
                                    <xsl:variable name="speechVariable2" ><xsl:value-of select="substring-before($speechVariable1,').getAsString()')" /></xsl:variable>
                                    <xsl:variable name="speechVariable" ><xsl:value-of select="substring($speechVariable2, 0, string-length($speechVariable2))" /></xsl:variable>

                                    //final String voiceName =
                                    val speech: String = globals.<xsl:value-of select="$speechVariable" />
                                    this.logUtil.putF("Speaking: " + speech, this, this.commonStrings.PROCESS)

                                    if(speech != null) {
                                        //textToSpeech.process(voiceName, speech)

                                        open class TextToSpeechABRunnable : ABRunnable {

                                            private val logUtil: LogUtil = LogUtil.getInstance()
                                            private val commonStrings: CommonStrings = CommonStrings.getInstance()

                                            open public fun run() {
                                                try {
                                                    textToSpeech.process(speech)
                                                } catch (e: Exception) {
                                                    logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e)
                                                }
                                            }
                                        }

                                        val runnable: Runnable = TextToSpeechABRunnable()

                                        SecondaryThreadPool.getInstance().runTask(runnable)

                                    }
                                </xsl:if>

                                <xsl:if test="not(contains(inlineCode, 'SpeechSynthesisUtterance'))" >

                                //BuiltinCommonInstructions::JsCode - event
                                override public fun process(): Boolean {
                                    //I don't have plans to implement this event type anytime soon for especially non HTML5 builds.
                                    this.logUtil.put(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + this.commonStrings.NOT_IMPLEMENTED, this, this.commonStrings.PROCESS, Exception())
                                </xsl:if>

                                    /*<xsl:value-of select="inlineCode" />*/

                                    var true: return
                                }

                            }
    </xsl:template>

</xsl:stylesheet>
