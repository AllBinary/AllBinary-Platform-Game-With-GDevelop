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

    <xsl:template name="animatableCapabilityAnimatableBehaviorSetNameActionProcess" >
        <xsl:param name="layoutIndex" />
        
        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable')" >found</xsl:if></xsl:for-each></xsl:variable>
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="hasObjectGroup2" >
            <xsl:for-each select="/game">
                <xsl:for-each select="layouts" >
                    <xsl:for-each select="objectsGroups" >
                        <xsl:if test="name = $name" >
                            found
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>
        
                    //AnimatableCapability::AnimatableBehavior::SetName
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
    
                        final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size();
                        for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                        
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index3));
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index3));
                            final int size = <xsl:value-of select="$name" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;<xsl:text>&#10;</xsl:text>

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            
                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            gameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index);
                            <xsl:value-of select="$name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) gameLayer.gdObject;

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:value-of select="$fourthParam2" />))) gameLayer.resetAnimation();
                                </xsl:if>
                        </xsl:for-each>
                        
                            }
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >

                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                                        
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />))) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />)) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /><xsl:text> </xsl:text><xsl:value-of select="text()" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int offset = (<xsl:value-of select="text()" />.animation_name_array.length * <xsl:value-of select="text()" />.animation_direction_array.length * <xsl:value-of select="text()" />.character);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >if(gameLayer.gdObject.setAnimation(<xsl:value-of select="text()" />.ANIMATION_NAMES[offset + </xsl:if><xsl:if test="position() = 4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ')', '')" /></xsl:with-param><xsl:with-param name="find" >VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>Index])) gameLayer.resetAnimation();<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>

                        </xsl:if>                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                        }                            
                        </xsl:if>

                        return true;
                    }

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >
                                                <xsl:value-of select="$objectName" />
                                            </xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(gameGlobals.<xsl:value-of select="$objectName" />GDGameLayerList.size())</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>

                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:call-template name="collisionProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        <xsl:variable name="collisionProcessGDParamOne" ><xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="collisionProcessGDParamTwo" ><xsl:call-template name="collisionProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        super.processGDStats(<xsl:value-of select="$collisionProcessGDParamOne" />GDGameLayer);
                        
                        <xsl:if test="$name != $collisionProcessGDParamOne and $name != $collisionProcessGDParamTwo" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$collisionProcessGDParamOne" />GDGameLayer;
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        super.processGDStats(<xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />GDGameLayer);
                        
                        <xsl:if test="$name != $linkedObjectsPickObjectsLinkedToProcessGDParamOne and $name != $linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />GDGameLayer;
                        </xsl:if>
                        
                    </xsl:if>
                    <xsl:if test="not(contains($hasCollisionProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >

                        <xsl:variable name="hasSiblingActionWithObjectsGroupsOrObject" >
                            <xsl:for-each select=".." >
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >found</xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:variable>                        

                        <xsl:for-each select=".." >
                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Sibling - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //AnimatableCapability::AnimatableBehavior::SetName - From sibling action
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final Graphics graphics) {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:for-each>
                        
                        <xsl:if test="not(contains($hasSiblingActionWithObjectsGroupsOrObject, 'found'))" >
                    //AnimatableCapability::AnimatableBehavior::SetName - Not from parent collision
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        
                        <xsl:if test="$name != $firstOrBeforeFourthParam" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer;
                        </xsl:if>

                        </xsl:if>
                        
                    </xsl:if>

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject);<xsl:text>&#10;</xsl:text>

                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            

                            <xsl:variable name="fourthParam2" ><xsl:value-of select="$name" />.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //1
                                if(<xsl:value-of select="$name" />.setAnimation(<xsl:value-of select="$name" />.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:value-of select="$fourthParam2" />))) <xsl:value-of select="$name" />GDGameLayer.resetAnimation();
                                </xsl:if>
                        </xsl:for-each>

                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //2
                                if(<xsl:value-of select="$name" />.setAnimation(<xsl:value-of select="$name" />.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />))) <xsl:value-of select="$name" />GDGameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //3
                                if(<xsl:value-of select="$name" />.setAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />)) <xsl:value-of select="$name" />GDGameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        final int offset = (<xsl:value-of select="$name" />.animation_name_array.length * <xsl:value-of select="$name" />.animation_direction_array.length * <xsl:value-of select="$name" />.character);<xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            //4
                            if(<xsl:value-of select="$name" />.setAnimation(<xsl:value-of select="text()" />.ANIMATION_NAMES[offset + </xsl:if><xsl:if test="position() = 4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ')', '')" /></xsl:with-param><xsl:with-param name="find" >VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>Index])) <xsl:value-of select="$name" />GDGameLayer.resetAnimation();<xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        </xsl:for-each>
                        
                        </xsl:if>
                        
                        return true;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index));
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            final int size = <xsl:value-of select="$name" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;<xsl:text>&#10;</xsl:text>

                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index2++) {
                                                        
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            
                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            gameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index2);
                            <xsl:value-of select="$name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) gameLayer.gdObject;

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:value-of select="$fourthParam2" />))) gameLayer.resetAnimation();
                                </xsl:if>
                        </xsl:for-each>
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                            
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()) return false;<xsl:text>&#10;</xsl:text></xsl:if>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                            
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >

                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />))) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />)) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /><xsl:text> </xsl:text><xsl:value-of select="text()" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int offset = (<xsl:value-of select="text()" />.animation_name_array.length * <xsl:value-of select="text()" />.animation_direction_array.length * <xsl:value-of select="text()" />.character);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >if(gameLayer.gdObject.setAnimation(<xsl:value-of select="text()" />.ANIMATION_NAMES[offset + </xsl:if><xsl:if test="position() = 4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ')', '')" /></xsl:with-param><xsl:with-param name="find" >VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>Index])) gameLayer.resetAnimation();<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>

                        </xsl:if>
                        return true;
                    }

    </xsl:template>

</xsl:stylesheet>
