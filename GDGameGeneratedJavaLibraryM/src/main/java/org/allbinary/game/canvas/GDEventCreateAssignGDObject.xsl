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

    <xsl:import href="./GDNodeId.xsl" />
    <xsl:import href="./GDEventLogicConstruction.xsl" />
    
    <xsl:template name="createGDObject" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="nodeAsString" />
        <xsl:param name="caller" />

        <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="spriteName" >,Sprite:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:variable name="textInputName" >,TextInput::TextInputObject:<xsl:value-of select="$name" />,</xsl:variable>

                    //createGDObject - <xsl:value-of select="$name" />

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() > 2" >
                            <xsl:if test="contains(text(), '.')" >
                                <xsl:variable name="objectNameWithSeps" >:<xsl:value-of select="substring-before(text(), '.')" />,</xsl:variable>
                                <xsl:if test="contains($objectsAsString, $objectNameWithSeps)" >
                                    <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable>
                                    <xsl:if test="$name != $name2" >
                                        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                                        <xsl:variable name="hasPriorDuplicate" >
                                        <xsl:for-each select="../parameters" >
                                            <xsl:if test="position() > 2" >
                                                <xsl:if test="contains(text(), '.')" >
                                                <xsl:variable name="nodeId2" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                                                <xsl:variable name="name3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable>
                                                <xsl:if test="$name2 = $name3" >
                                                    <xsl:if test="$nodeId > $nodeId2" >found</xsl:if>
                                                </xsl:if>
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:if test="not(contains($hasPriorDuplicate, 'found'))" >
                                        GDObject <xsl:value-of select="$name2" /> = null;
                                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                            <xsl:value-of select="$name2" /> = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList.get(0)).gdObject;
                                        }
                                            
                                        if(<xsl:value-of select="$name2" /> == null) {
                                            //caller=<xsl:value-of select="$caller" />
                                            return <xsl:if test="contains($caller, 'createActionProcess') or (contains($caller, 'hackProcessing2') and not(contains($caller, 'conditionLayout - //eventsCreateAssignGDObject - //hackProcessing2')))" > true</xsl:if>;
                                        }
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>                    
                    
<!--
                    <xsl:if test="contains($objectsAsString, $spriteName) or contains($objectsAsString, $textInputName)" >
                    LogUtil.put(LogFactory.getInstance(
                    "Sprite info: <xsl:value-of select="$name" /> l: " + ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray.length)) +
                    "w: " + ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth())) +
                    "h: " + ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()))
                    , this, commonStrings.PROCESS));
                    </xsl:if>
-->
                    
                    //GDEventCreatedAssignGDObject
                    final GDObject <xsl:value-of select="$name" />GDobject2 = <xsl:call-template name="objectFactoryFromProperty" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectFactory.get(
                    //parameters
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2" >
                            //position=<xsl:value-of select="position()" /><xsl:text>&#10;</xsl:text>
                            <xsl:if test="position() != last()" >
                                <xsl:variable name="param" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                            <xsl:value-of select="text()" />
                                        </xsl:with-param>                                
                                        <xsl:with-param name="find" >&quot;&quot;</xsl:with-param>
                                        <xsl:with-param name="replacementText" >stringUtil.EMPTY_STRING</xsl:with-param>
                                    </xsl:call-template>
                                        </xsl:with-param>
                                        <xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param>
                                        <xsl:with-param name="replacementText" ></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>
                                </xsl:variable>                                
                                <xsl:if test="not(contains($param, 'SceneInstancesCount('))" >
                                    <xsl:value-of select="$param" />,
                                </xsl:if>
                                <xsl:if test="contains($param, 'SceneInstancesCount(')" >
                                    <xsl:variable name="objectName" >
                                        <xsl:value-of select="substring-before(substring-after($param, 'SceneInstancesCount('), ')')" />
                                    </xsl:variable>
                                    <xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$objectName" /></xsl:with-param><xsl:with-param name="replacementText" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param></xsl:call-template>,
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    //zOrder - <xsl:value-of select="zOrder" />
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = last()" >
                            //last=<xsl:value-of select="text()" />
                            <xsl:if test="not(text())" >
                    6,
                            </xsl:if>
                            <xsl:if test="contains(text(), 'Overlay') or contains(text(), 'gui')" >
                    Integer.MAX_VALUE,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    //Objects have name - <xsl:value-of select="$name" />
                            <xsl:if test="contains($objectsAsString, $spriteName)" >
                                //(int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth() / 1.44f),
                                //(int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight() / 1.44f),
<!--                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth())) ==
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) ? 
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) :
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()) * scale)
-->
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()))
                                ,
<!--                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth())) ==
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) ? 
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) :
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()) * scale)
-->
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()))
                                ,
                            </xsl:if>
                            <xsl:variable name="name2" >:<xsl:value-of select="$name" />,</xsl:variable>
                            <xsl:if test="contains($objectsGroupsAsString, $name2)" >
                                (int) (((Image[]) <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArrayList.get(createIndex))[0].getWidth()),
                                (int) (((Image[]) <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArrayList.get(createIndex))[0].getHeight()),
                            </xsl:if>
                            <xsl:if test="not(contains($objectsAsString, $spriteName) or contains($objectsGroupsAsString, $name2))" >
                                0, 0,
                            </xsl:if>
                    //parameters2
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>_OBJECT_NAME
                        </xsl:if>
                    </xsl:for-each>);

                    <xsl:if test="$name = 'player_bullet'" >
                    //stringBuilder.delete(0, stringBuilder.length());
                    //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeAsString" />").append(' ').append(<xsl:value-of select="$name" />GDobject2.name)<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:if test="position() != last()" ><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>)</xsl:if></xsl:if><xsl:if test="position() = last()" ><xsl:if test="string-length(text()) = 0" >.toString()</xsl:if><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>).toString()</xsl:if></xsl:if></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                    //final int size2 = globals.player_bulletGDGameLayerList.size();
                    //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        //stringBuilder.delete(0, stringBuilder.length());
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeAsString" />").append(' ').append(<xsl:value-of select="$name" />GDobject2.name).append(' ').append(index2).append('\"').append(globals.player_bulletGDGameLayerList.get(index2)).toString(), this, commonStrings.PROCESS));
                    //}
                    </xsl:if>
                    
                    <xsl:if test="not(contains($objectsAsString, $spriteName) or contains($objectsGroupsAsString, $name))" >
                        //LogUtil.put(LogFactory.getInstance("GDObject:<xsl:value-of select="$name" /> != <xsl:value-of select="$spriteName" />", this, commonStrings.PROCESS));
                    </xsl:if>

    </xsl:template>

    <xsl:template name="createByNameGDObject" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="nodeAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="spriteName" >,Sprite:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:variable name="textInputName" >,TextInput::TextInputObject:<xsl:value-of select="$name" />,</xsl:variable>

                    //createByNameGDObject - <xsl:value-of select="$name" />
                        
                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 4 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="substring-after-last" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />

                    <xsl:if test="contains($hasGameLayer2, 'found')" >
                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="$gameLayerName" /> = <xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$gameLayerName" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    </xsl:if>
                        
                        final GDObject <xsl:value-of select="$name" />GDobject2 = ((GDObjectFactory) gdObjectsFactory.gdObjectFactoryList.get(createIndex)).get(
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2 and position() != 3" >
                            <xsl:if test="position() != last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                    <!-- //TWB - Hack -->
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                            <xsl:value-of select="text()" />
                                        </xsl:with-param>                                
                                        <xsl:with-param name="find" >.placementIndex]]</xsl:with-param>
                                        <xsl:with-param name="replacementText" >.placementIndex]]</xsl:with-param>
                                    </xsl:call-template>
                                        </xsl:with-param>                                
                                        <xsl:with-param name="find" >&quot;&quot;</xsl:with-param>
                                        <xsl:with-param name="replacementText" >stringUtil.EMPTY_STRING</xsl:with-param>
                                    </xsl:call-template>
                                        </xsl:with-param>
                                        <xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param>
                                        <xsl:with-param name="replacementText" ></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>,
                            </xsl:if>                            
                        </xsl:if>
                    </xsl:for-each>
                            //zOrder is not available for create by name - <xsl:value-of select="zOrder" />
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = last()" >
                            //last=<xsl:value-of select="text()" />
                            <xsl:if test="not(text())" >
                    6,
                            </xsl:if>
                            <xsl:if test="contains(text(), 'Overlay')" >
                    Integer.MAX_VALUE,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    //Objects have name - <xsl:value-of select="$name" />
                            <xsl:if test="contains($objectsAsString, $spriteName)" >
                                //(int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth() / 1.44f),
                                //(int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight() / 1.44f),
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth())) ==
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) ? 
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) :
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()) * scale)
                                ,
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth())) ==
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) ? 
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight())) :
                                ((int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight()) * scale)
                                ,
                            </xsl:if>
                            <xsl:if test="contains($objectsGroupsAsString, $name)" >
                                (int) (((Image[]) <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArrayList.get(createIndex))[0].getHeight()),
                                (int) (((Image[]) <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArrayList.get(createIndex))[0].getHeight()),
                            </xsl:if>
                    
                            <xsl:if test="not(contains($objectsAsString, $spriteName) or contains($objectsGroupsAsString, $name))" >
                                0, 0,
                            </xsl:if>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2 and position() != 3" >
                            <xsl:if test="position() = last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    //globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                                    createString
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    );

                    <xsl:if test="$name = 'player_bullet'" >
                    //TWB - Hack
                    //stringBuilder.delete(0, stringBuilder.length());
                    //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeAsString" />").append(' ').append(<xsl:value-of select="$name" />GDobject2.name)<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:if test="position() != last()" ><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>)</xsl:if></xsl:if><xsl:if test="position() = last()" ><xsl:if test="string-length(text()) = 0" >.toString()</xsl:if><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>).toString()</xsl:if></xsl:if></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                    //final int size2 = globals.player_bulletGDGameLayerList.size();
                    //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        //stringBuilder.delete(0, stringBuilder.length());
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeAsString" />").append(' ').append(<xsl:value-of select="$name" />GDobject2.name).append(' ').append(index2).append('\"').append(globals.player_bulletGDGameLayerList.get(index2)).toString(), this, commonStrings.PROCESS));
                    //}
                    </xsl:if>
                    
                    <xsl:if test="contains($objectsAsString, $spriteName)" >
                    //We may need to set a dimension for each image/animation. CreateAssign 
                    //<xsl:value-of select="$name" />GDobject2.canvasWidth = <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getWidth();
                    //<xsl:value-of select="$name" />GDobject2.canvasHeight = <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArray[0].getHeight();
                    </xsl:if>
                    <xsl:if test="contains($objectsGroupsAsString, $name)" >
                    //We may need to set a dimension for each image/animation. CreateAssign 
                    //<xsl:value-of select="$name" />GDobject2.canvasWidth = ((Image[]) <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArrayList.get(createIndex))[0].getHeight();
                    //<xsl:value-of select="$name" />GDobject2.canvasHeight = ((Image[]) <xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />ImageArrayList.get(createIndex))[0].getHeight();
                    </xsl:if>

                    //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />GDobject2.toString(), this, commonStrings.PROCESS));
                    <xsl:if test="not(contains($objectsAsString, $spriteName) or contains($objectsGroupsAsString, $name))" >
                        //objectsAsString=<xsl:value-of select="$objectsAsString" />
                        //LogUtil.put(LogFactory.getInstance("GDObject:<xsl:value-of select="$name" /> != <xsl:value-of select="$spriteName" />", this, commonStrings.PROCESS));
                    </xsl:if>

    </xsl:template>

    <xsl:template name="eventsCreateProcessUsed" >
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="hasCollisionProcessGD" >
            <xsl:call-template name="hasCollisionProcessGD" >
                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="not(contains($hasCollisionProcessGD, 'found'))" >
            //TWB - Skipping collision process as GDNode never has a parent GDNode that is NPCollision.
        </xsl:if>
        <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                    private final String EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "PossibleCollision: " + EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                    <!-- //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed -->
                    @Override
                    public void processM(final CollidableCompositeLayer[] gameLayerArray) {  //event
                        super.processMStats(gameLayerArray);

                        try {

                            //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            //if(gameLayerArray[0] != null) {
                                //if(gameLayerArray[1] != null) {
                                    //LogUtil.put(LogFactory.getInstance(new StringMaker().append(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Collision: between gameLayer: ").append(gameLayerArray[0].getName()).append(" and gameLayer2: ").append(gameLayerArray[1].getName()).toString(), this, commonStrings.PROCESS));
                                //}
                            //}
        
            <xsl:variable name="listCreate" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue != 'Create'" >
                        <xsl:value-of select="text()" />,
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>

                <xsl:call-template name="objectGDObjectAtIndex" >
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                </xsl:call-template>

            <xsl:variable name="alreadyUsedParentCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>
            <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
            <!-- position() = 1 and -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:for-each select="conditions" ><xsl:if test="(type/value = 'SourisSurObjet' or type/value = '(Used when using the AllBinary Collision Processing) CollisionNP' or type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'MouseButtonPressed' or type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased')" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>
            
            <xsl:variable name="lastCondition" ><xsl:for-each select="conditions" ><xsl:if test="position() = last()" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found'))" >

            <xsl:for-each select="conditions" >
                <!-- A sibling of BuiltinCommonInstructions::Once may not call it -->
                <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Condition - //BuiltinCommonInstructions::Once - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="position() = 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <!-- //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed -->
                <xsl:if test="type/value != 'DepartScene' and type/value != 'Timer' and (not($caller = 'conditionLayout - //eventsCreateAssignGDObjectGDNodesCondition' and type/value = 'NbObjet'))" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Condition - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                </xsl:if>
                </xsl:if>
                </xsl:if>
                <xsl:if test="position() = 2" >
                //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            </xsl:if>

            </xsl:if>

            <xsl:if test="contains($hasOnceCondition, 'found') and not(contains($hasUsedOnceCondition, 'found'))" >
            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Actions - //hasUsedOnceCondition
            <xsl:for-each select="actions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>        
            </xsl:if>

            <xsl:if test="contains($hasCondition, 'found') and not(contains($hadConditionOtherThanThis, 'found'))" >
                //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //hadConditionOtherThanThis <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />= <xsl:value-of select="$thisNodeIndex" />
            </xsl:if>

            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Actions - //lastCondition
            <xsl:if test="contains($lastCondition, 'found') and $caller = 'conditionLayout - //eventsCreateAssignGDObjectGDNodesCondition'" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //lastCondition - //Action - //<xsl:value-of select="$typeValue" /> - call
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>
            </xsl:if>
            
            <xsl:if test="not(contains($hasCondition, 'found'))" >
                <!-- //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Actions - //hasCondition -->
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                <xsl:if test="$typeValue = 'PlaySound'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //PlaySound - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'PlayMusic'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //PlayMusic - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'PlayMusicCanal'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //PlayMusic - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                                
                <xsl:if test="$typeValue = 'ResetTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //ResetTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //PauseTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //UnPauseTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarScene'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));                    
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />                                                
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //ModVarScene - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //TextObject::ChangeColor - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::String'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //TextObject::String - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                <xsl:if test="$typeValue = 'Delete'" >
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Delete - call
                    if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" />GDGameLayer, null, globals.graphics);
                    } else {
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="$gameLayerName" />GDGameLayer was null", this, commonStrings.PROCESS));
                    }
                </xsl:if>

            </xsl:for-each>
            </xsl:if>

                <xsl:variable name="nodeId" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="hasDelete" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Delete'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="listSize" ><xsl:for-each select="actions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'SetAngle' or $typeValue = 'Delete' or $typeValue = 'AddForceAL'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //repeatExpression <xsl:value-of select="repeatExpression" /> //listSize <xsl:value-of select="$listSize" />

                <xsl:variable name="hasAddForceAL" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'AddForceAL'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:if test="contains($hasAddForceAL, 'foundfound')" >
                
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>

                <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    
                        final int <xsl:value-of select="$gameLayerName" />Size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.size();
            
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt; </xsl:text> <xsl:value-of select="$gameLayerName" />Size; index++) {
                    
                            <!--
                            GDGameLayer <xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = null;
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                                <xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index);
                            }
                    
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - <xsl:value-of select="$caller" /> - //AddForceAL - call
                            if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex, null, globals.graphics);
                            }
                        
                            <xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex.updateGDObject(globals.timeDelta);
                            -->

                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index);
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, null, globals.graphics);
                            gameLayer.updateGDObject(globals.timeDelta);
                        }
                </xsl:if>
            </xsl:for-each>
                        
                </xsl:if>

            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="timerActions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="type/value" />,</xsl:if></xsl:for-each></xsl:variable>

                <xsl:if test="not(contains($hasDelete, 'found')) and not(contains($hasAddForceAL, 'foundfound'))" >

                        <!--
                        //hasCreate=<xsl:value-of select="$hasCreate" /> //hasCollisionCondition=<xsl:value-of select="$hasCollisionCondition" />
                        <xsl:for-each select="conditions" >
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        </xsl:for-each>
                        <xsl:for-each select="actions" >
                        //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        </xsl:for-each>
                        -->

                        <xsl:if test="contains($hasCreate, 'found')" >
                            <xsl:if test="not(contains($hasCollisionCondition, 'found'))" >
                            //Skipping actions with create since they are not associated with a CollisionNP condition - <xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each>
                            </xsl:if>
                        </xsl:if>

                        <xsl:if test="(contains($hasCreate, 'found') and contains($timerActions, 'Timer,')) or not(contains($hasCondition, 'found'))" >
                        //GDEventCreateAssignGDObject
                        final int size = <xsl:if test="not(repeatExpression)" ><xsl:if test="$listSize = '' or contains($hasCreate, 'found')" >1;</xsl:if><xsl:if test="$listSize and not(contains($hasCreate, 'found'))" ><xsl:value-of select="$listSize" /></xsl:if></xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" />;</xsl:if>

            <xsl:if test="not(contains($timerActions, 'Timer,')) and not(contains($hasCollisionCondition, 'found'))" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //LogUtil.put(LogFactory.getInstance("<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() +  " size " + size, this, commonStrings.PROCESS));
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> size) {
                                //LogUtil.put(LogFactory.getInstance("B: Keep from creating again before last time: <xsl:value-of select="text()" />", this, commonStrings.PROCESS));
                                <!-- //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed -->
                                return <xsl:if test="contains($caller, 'hackProcessing2')" > true</xsl:if>;
                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
                <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:if test="string-length($createParamsAsString) > 0" >
                        //createParamsAsString=<xsl:value-of select="$createParamsAsString" />
                        //timerActions=<xsl:value-of select="$timerActions" />
                    </xsl:if>
                    <xsl:if test="contains($hasCreate, 'found')" >
                        <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                        //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Create Loop - //Create
                        //final StringMaker stringBuilder = new StringMaker();
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeId" />").append(" size: ").append(size).append(" <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$text" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$text" />List.size(): ").append(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$text" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$text" />List.size()).append(" <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$text" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$text" />GDGameLayerList.size(): ").append(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$text" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$text" />GDGameLayerList.size()).toString(), this, commonStrings.PROCESS));
                        final int startIndex = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$text" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$text" />GDGameLayerList.size();
                        final int endIndex = startIndex + size;
                        //stringBuilder.delete(0, stringBuilder.length());
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeId" />").append(" layer <xsl:value-of select="$text" />List startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), this, commonStrings.PROCESS, new Exception()));


                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                    </xsl:if>
            
                    <xsl:if test="not(contains($hasCreate, 'found')) and not(contains($timerActions, 'Timer,'))" >
                        //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Create Loop
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    </xsl:if>
                
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>

                <xsl:if test="$typeValue = 'Create'" >

                                //createGDObject - Assign - START
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeId" />
                        </xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                    </xsl:call-template>
                    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                //createGDObject - Assign - END                                                                                
                                //createGDObject - //Create - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />GDobject2);
                </xsl:if>

                <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'SetAngle'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //SetAngle - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ChangePlan - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeColor'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ChangeColor - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ChangeAnimation - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ModVarGlobal - call - NOT_IMPLEMENTED
                            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                    <xsl:text>&#10;</xsl:text>
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ModVarObjet - call - //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    <!--
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            GDGameLayer <xsl:value-of select="text()" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = null;
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                                <xsl:value-of select="text()" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            }
                        </xsl:if>
                    </xsl:for-each>
                    
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - <xsl:value-of select="$caller" /> - //AddForceAL - call
                            if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex, null, globals.graphics);
                            }
                    -->

                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index), null, globals.graphics);
                </xsl:if>

            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'Create'" >           
                                //Create - GDObject at - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                </xsl:if>
            </xsl:for-each>

            <xsl:variable name="firstAction" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet'" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                <xsl:value-of select="text()" />,</xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:if test="$firstAction != ''" >
            //firstAction=<xsl:value-of select="$firstAction" />
            </xsl:if>

            <xsl:if test="string-length($firstAction) and string-length($listCreate) = 0" >
                                //updateGDObject - unused
                                <xsl:value-of select="substring-before($firstAction, ',')" />GDGameLayer.updateGDObject(globals.timeDelta);
                                <xsl:text>&#10;</xsl:text>
            </xsl:if>
                        }            
            </xsl:if>
            </xsl:if>

            <!--
            <xsl:if test="contains($timerActions, 'Timer,')" >
                            //Hackish stop repeat action
                            gdNodeList.clear();
            </xsl:if>
            -->

            <xsl:if test="$listSize != ''" >
                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Event - //<xsl:value-of select="type" /> - call
            <xsl:if test="contains($caller, 'otherEventLayout')" >
                            
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' or contains($caller, 'eventsCreateAssignGDObject')" >
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
            </xsl:if>
            
            </xsl:if>
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found'))" >
                
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="position() = 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <!-- //caller=<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed -->
                <xsl:if test="type/value != 'DepartScene' and type/value != 'Timer' and (not($caller = 'conditionLayout - //eventsCreateAssignGDObjectGDNodesCondition' and type/value = 'NbObjet'))" >
                //Condition - END
                }
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>

            </xsl:if>

                            super.processMStatsE(gameLayerArray);
                        } catch(Exception e) {
                        //2
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                }
            </xsl:if>

    </xsl:template>

    <xsl:template name="paramIndexedArray" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>
    <xsl:template name="paramIndexedArray2" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="text()" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>

</xsl:stylesheet>
