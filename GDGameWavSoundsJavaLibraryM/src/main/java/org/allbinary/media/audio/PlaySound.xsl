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

    <xsl:template name="playsound" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="conditionToProcess" />
        <xsl:param name="otherEventToProcess" />
        <xsl:param name="objectEventToProcess" />
         
        <xsl:variable name="quote" >"</xsl:variable>

        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="eventAsString" >
            private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
            <xsl:text>&#10;</xsl:text>
            </xsl:variable>
            
            //Hack - actionWithTextObjectString is probably bad idea
            <xsl:variable name="actionWithTextObjectString" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'TextObject::String'" >found:<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="parametersAsString" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <xsl:variable name="actionsWithIndexes" >
                <xsl:call-template name="actionsWithIndexes" >
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="thisNodeArray" >
                        <xsl:value-of select="$thisNodeArray" />
                    </xsl:with-param>                    
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="eventsCreateProcessUsed" >
                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>

            <xsl:if test="$objectEventToProcess = ''" >
            <xsl:call-template name="objectGDObjectGDNodes" >
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="parametersAsString" >
                    <xsl:value-of select="$parametersAsString" />
                </xsl:with-param>
            </xsl:call-template>
            </xsl:if>

            <xsl:call-template name="playsound" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>
                <xsl:with-param name="conditionToProcess" >
                    <xsl:value-of select="$conditionToProcess" />
                </xsl:with-param>
                <xsl:with-param name="otherEventToProcess" >
                    <xsl:value-of select="$otherEventToProcess" />
                </xsl:with-param>
                <xsl:with-param name="objectEventToProcess" >
                    <xsl:value-of select="$objectEventToProcess" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>
    
        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - END

    </xsl:template>

    <xsl:template name="findSoundInAction" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="file" />

        <xsl:for-each select="/game" >
        <xsl:for-each select="layouts" >
            <xsl:if test="position() - 1 = $layoutIndex" >
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                
                <xsl:if test="$param = $file" >

                <xsl:if test="$typeValue = 'PlayMusic'" >
                    //PlayMusic - <xsl:value-of select="$file" />
                </xsl:if>
                <xsl:if test="$typeValue = 'PlaySound'" >
                    //PlaySound - <xsl:value-of select="$file" />
                </xsl:if>
                <xsl:if test="$typeValue = 'PlaySoundCanal'" >
                    //PlaySoundCanal - <xsl:value-of select="$file" />
                </xsl:if>
                <xsl:if test="$typeValue = 'StopSoundCanal'" >
                    //StopSoundCanal - <xsl:value-of select="$file" />
                </xsl:if>

                </xsl:if>

            </xsl:for-each>

            <xsl:call-template name="findSoundInAction" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>

            </xsl:call-template>
        </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="playsoundloading" >
        <xsl:param name="layoutIndex" />

            <xsl:for-each select="/game/resources" >
                //Resources
                <xsl:for-each select="resources" >
                    <xsl:if test="contains(file, '.ogg') or contains(file, '.wav') or contains(file, '.mp3')" >
<!--                    //Audio File - <xsl:value-of select="file" />-->
                        <xsl:variable name="thisLayoutHasThisSoundResource" >
                            <xsl:call-template name="findSoundInAction" >                        
                                <xsl:with-param name="totalRecursions" >
                                    <xsl:value-of select="0" />
                                </xsl:with-param>
                                <xsl:with-param name="layoutIndex" >
                                    <xsl:value-of select="$layoutIndex" />
                                </xsl:with-param>
                                <xsl:with-param name="file" >
                                    <xsl:value-of select="file" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:if test="contains($thisLayoutHasThisSoundResource, 'Play')" >
                    <xsl:variable name="fileName" ><xsl:call-template name="after-lastIndexOf"><xsl:with-param name="string" ><xsl:value-of select="file" /></xsl:with-param><xsl:with-param name="char" >/</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:variable name="fileName2" ><xsl:value-of select="translate(substring-before($fileName, '.'), '_', ' ')" /></xsl:variable>
                    <xsl:variable name="fileName3" ><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$fileName2" /></xsl:with-param></xsl:call-template></xsl:variable>                       
                    //Audio File with Action - <xsl:value-of select="file" />
                    //if(!soundList.contains(org.allbinary.game.resource.GD<xsl:value-of select="translate($fileName3, ' ', '')" />Sound.getInstance())) {
                        soundList.add(org.allbinary.game.resource.GD<xsl:value-of select="translate($fileName3, ' ', '')" />Sound.getInstance());
                    //}
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
                                
    </xsl:template>

</xsl:stylesheet>
