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

    <xsl:template name="createGDObject" >
        <xsl:param name="objectsAsString" />
        <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        final GDObject <xsl:value-of select="$name" />2 = gdObjectsFactory.get<xsl:value-of select="$name" />(
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2" >
                            <xsl:if test="position() != last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                            <xsl:value-of select="text()" />
                                        </xsl:with-param>
                                        <xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param>
                                        <xsl:with-param name="replacementText" ></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>,
                            </xsl:if>
                            <xsl:if test="position() = last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>);

                    <xsl:if test="$name = 'player_bullet'" >
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, new StringBuilder().append(<xsl:value-of select="$name" />2.name)<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:if test="position() != last()" ><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>)</xsl:if></xsl:if><xsl:if test="position() = last()" ><xsl:if test="string-length(text()) = 0" >.toString()</xsl:if><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>).toString()</xsl:if></xsl:if></xsl:if></xsl:for-each>));
                    final int size2 = globals.player_bulletGDGameLayerList.size();
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, new StringBuilder().append(index2).append(": ").append(globals.player_bulletGDGameLayerList.get(index2)).toString()));
                    }                    
                    </xsl:if>
                    
                    //Add GDObject
                    globals.<xsl:value-of select="$name" />List.add(<xsl:value-of select="$name" />2);

                    <xsl:variable name="spriteName" >,Sprite:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($objectsAsString, $spriteName)" >
                    //We may need to set a dimension for each image/animation.
                    <xsl:value-of select="$name" />2.canvasWidth = <xsl:value-of select="$name" />ImageArray[0].getWidth();
                    <xsl:value-of select="$name" />2.canvasHeight = <xsl:value-of select="$name" />ImageArray[0].getHeight();
                    <xsl:value-of select="$name" />2.width = (int) (<xsl:value-of select="$name" />ImageArray[0].getWidth() / 1.44f);
                    <xsl:value-of select="$name" />2.height = (int) (<xsl:value-of select="$name" />ImageArray[0].getHeight() / 1.44f);
                    <xsl:value-of select="$name" />2.halfWidth = (<xsl:value-of select="$name" />2.width / 2);
                    <xsl:value-of select="$name" />2.halfHeight = (<xsl:value-of select="$name" />2.height / 2);
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />2.toString()));
                    </xsl:if>
                    <xsl:if test="not(contains($objectsAsString, $spriteName))" >
                        //objectsAsString=<xsl:value-of select="$objectsAsString" />
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "GDObject:<xsl:value-of select="$name" /> != <xsl:value-of select="$spriteName" />"));
                    </xsl:if>

    </xsl:template>

    <xsl:template name="actionsWithIndexesProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
                
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = globals.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

            <xsl:if test="actions" >
                
                    //actionsWithIndexesProcess
                    public void process() {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        
                <xsl:variable name="thisNodeArray" >this</xsl:variable>

                <xsl:call-template name="actionsWithIndexes" >                    
                    <xsl:with-param name="caller" >actionsWithIndexesProcess</xsl:with-param>
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

                    }

            </xsl:if>
            
    </xsl:template>

    <xsl:template name="actionsWithIndexes" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="thisNodeArray" />
                    //objectGDObjectAtIndex2 - START
                    <xsl:call-template name="objectGDObjectAtIndex2" >
                        <xsl:with-param name="thisNodeArray" >
                            <xsl:value-of select="$thisNodeArray" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">
                    </xsl:if>
                </xsl:for-each>
                    -->
                    //objectGDObjectAtIndex2 - END

                    try {

            <xsl:if test="actions" >
                        //repeatExpression <xsl:value-of select="repeatExpression" />
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;

                        final BasicArrayList gameLayerList = new BasicArrayList();
                        final StringBuilder stringBuilder = new StringBuilder();

                       <xsl:variable name="actionWithTextObjectString" >
                           <xsl:for-each select="actions" >
                               <xsl:variable name="typeValue" select="type/value" />
                               <xsl:if test="$typeValue = 'TextObject::String'" >found:<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:if>
                           </xsl:for-each>
                        </xsl:variable>

                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create'" >
                                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 2" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /><xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);"));
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            globals.<xsl:value-of select="text()" />GDGameLayerList.ensureCapacity(size);
                        }
                        //<xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);                        
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>

                        <xsl:if test="type/value = 'Create'" >
                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                        //TextObject::String - process - call - START
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        //TextObject::String - process - call - END
                        </xsl:if>
                        </xsl:if>

                        <xsl:if test="type/value = 'TextObject::String'" >
                        //TextObject::String - call - START
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        //TextObject::String - call - END
                        </xsl:if>
                            
                        </xsl:for-each>

                        <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="timerActions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="type/value" />,</xsl:if></xsl:for-each></xsl:variable>
                        
                        <xsl:if test="string-length($createParamsAsString) > 0" >
                            <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                        //Create Loop - <xsl:value-of select="$caller" /><xsl:if test="$caller = 'eventsCreateAssignGDObject'" > - add one</xsl:if>
                        final int startIndex = globals.<xsl:value-of select="$text" />GDGameLayerList.size();
                        //final int endIndex = globals.<xsl:value-of select="$text" />List.size()<xsl:if test="$caller = 'eventsCreateAssignGDObject'" > + 1</xsl:if>;
                        final int endIndex = globals.<xsl:value-of select="$text" />List.size();
                        
                        <xsl:if test="contains($timerActions, 'Timer,')" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append("startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), new Exception()));
                        </xsl:if>
                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                        </xsl:if>

                        <xsl:if test="string-length($createParamsAsString) = 0" >
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        </xsl:if>
                        
            gameLayerList.clear();
            boolean actionWithUpdate = false;

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //UnPauseTimer - process
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'Create'" >
                    //Create - process
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index);
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreX'" >
                    //MettreX - process
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process((GDObject) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index)</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreY'" >
                    //MettreY - process
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process((GDObject) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index)</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreXY'" >
                    //MettreXY - process
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process((GDObject) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index)</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //SetAngle - process
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index)) {
                        actionWithUpdate = true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //ChangePlan - process
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index)) {
                        actionWithUpdate = true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    //AddForceAL - process
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    //ChangeAnimation
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    //ModVarObjet - <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(index)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'Create'" >
                    //Create End - call
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, 
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                </xsl:if>
            </xsl:for-each>

            <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'Create'" >Create</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="not(contains($hasCreate, 'Create'))" >
                                if(actionWithUpdate) {

                                    final int size2 = gameLayerList.size();
                                    if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                            ((GDGameLayer) gameLayerList.get(index2)).updateGDObject(globals.timeDelta);
                                        }
                                    } else {
                                        LogUtil.put(LogFactory.getInstance("updateGDObject failed: <xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreX' or type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer </xsl:if></xsl:for-each></xsl:if></xsl:for-each>was null", this, CommonStrings.getInstance().EXCEPTION));
                                    }

                                }
            </xsl:if>

                        }
            </xsl:if>

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().PROCESS, e));
                    }

    </xsl:template>

    <xsl:template name="eventsCreateProcessUsed" >
        <xsl:param name="caller" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>

                    private final String EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Collision: " + EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                    //eventsCreateProcessUsed
                    @Override
                    public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {

                        try {

                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                            if(gameLayer != null) {
                                if( gameLayer2 != null) {
                                    LogUtil.put(LogFactory.getInstance(new StringBuilder().append("Collision between gameLayer: ").append(gameLayer.getName()).append(" and gameLayer2: ").append(gameLayer2.getName()).toString(), this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                }
                            }
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //Hack to keep from creating again before last time
                            if(globals.<xsl:value-of select="text()" />List.size() != globals.<xsl:value-of select="text()" />GDGameLayerList.size()) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "TWB - Hack to keep from creating again before last time: <xsl:value-of select="text()" />"));
                                return;
                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        
            <xsl:variable name="create" >
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
                </xsl:call-template>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //UnPauseTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //ModVarScene
                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'angle')" >
                    //Update angle with rotation
                        </xsl:if>
                    </xsl:for-each>       
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    
                    <xsl:variable name="player" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), 'player')" >player</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($player, 'player')" >
                    //Hack player player logging
                    </xsl:if>
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >
                    //TextObject::ChangeColor
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::String'" >
                    //TextObject::String
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

            </xsl:for-each>

                        //repeatExpression <xsl:value-of select="repeatExpression" />
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;

                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />

                    <xsl:if test="$typeValue = 'Create'" >
                        <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - caller
                if(globals.<xsl:value-of select="text()" />List.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                    globals.<xsl:value-of select="text()" />List.ensureCapacity(size);
                }
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            
                <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="timerActions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="type/value" />,</xsl:if></xsl:for-each></xsl:variable>

                    <xsl:if test="string-length($createParamsAsString) > 0" >
                    //createParamsAsString=<xsl:value-of select="$createParamsAsString" />
                    //timerActions=<xsl:value-of select="$timerActions" />
                    </xsl:if>
                    <xsl:if test="string-length($createParamsAsString) > 0 and contains($timerActions, 'Timer,')" >
                        <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                    //Create Loop - eventsCreateProcessUsed - Timer
                    final StringBuilder stringBuilder = new StringBuilder();
                    int startIndex;
                    int endIndex;
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append("size: ").append(size).append(" globals.<xsl:value-of select="$text" />List.size(): ").append(globals.<xsl:value-of select="$text" />List.size()).append(" globals.<xsl:value-of select="$text" />GDGameLayerList.size(): ").append(globals.<xsl:value-of select="$text" />GDGameLayerList.size()).toString()));
                    //if(<xsl:value-of select="$text" />List.size() - size <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    if(globals.<xsl:value-of select="$text" />List.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                        //startIndex = <xsl:value-of select="$text" />List.size() - size;
                        startIndex = globals.<xsl:value-of select="$text" />List.size();
                        endIndex = globals.<xsl:value-of select="$text" />List.size() + size;
                        stringBuilder.delete(0, stringBuilder.length());
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append("size <xsl:value-of select="$text" />List startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), new Exception()));
                    } else {
                        startIndex = 0; //globals.<xsl:value-of select="$text" />GDGameLayerList.size();
                        endIndex = size; //globals.<xsl:value-of select="$text" />List.size();
                        stringBuilder.delete(0, stringBuilder.length());
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append("layer <xsl:value-of select="$text" />List startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), new Exception()));
                    }

                    for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                    </xsl:if>
            
                    <xsl:if test="string-length($createParamsAsString) > 0 and not(contains($timerActions, 'Timer,'))" >
                    //Create Loop - eventsCreateProcessUsed
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    </xsl:if>
                    <xsl:if test="string-length($createParamsAsString) = 0" >
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    </xsl:if>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'Create'" >

                    //Create - GDObject - createGDObject                    
                    //Create - GDObject - START
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //Create - GDObject - END

                                                                                
                //Create - GDObject at - process
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    //SetAngle
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    GDGameLayer gameLayerAtIndex = null;
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    if(globals.<xsl:value-of select="text()" />GDGameLayerList != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                        gameLayerAtIndex = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                    }
                        </xsl:if>
                    </xsl:for-each>

                    //Hack method 1st param or list - 1
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(0)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, gameLayerAtIndex);</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    //ChangePlan
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    //ChangeAnimation
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    //ModVarGlobal not implemented
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    <xsl:text>&#10;</xsl:text>
                    //ModVarObjet - <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each> - process
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(index)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'Delete'" >
                    //Delete - process
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    //AddForceAL - process
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
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

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'Create'" >           
                //Create - GDObject at - processEnd
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                </xsl:if>
            </xsl:for-each>

            <xsl:if test="string-length($firstAction) and string-length($create) = 0" >
                <xsl:value-of select="substring-before($firstAction, ',')" />GDGameLayer.updateGDObject(globals.timeDelta);
                <xsl:text>&#10;</xsl:text>
            </xsl:if>

                    }

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().START, e));
                    }

                }

    </xsl:template>

    <xsl:template name="eventsCreateAssignGDObject" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
        
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

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'CollisionNP'" >
                    //CollisionNP - condition is processed by collision processor
                </xsl:if>                
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet - condition is processed from eventsProcess
                </xsl:if>                
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet - condition is processed from eventsProcess
                </xsl:if>
                <xsl:if test="$typeValue = 'DepartScene'" >
                    ////DepartScene - condition - eventsOnceConditionProcessActions
                </xsl:if>                
                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    //SourisSurObjet - Handled by AllBinary Event Listeners
                </xsl:if>                
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    //MouseButtonReleased - Handled by AllBinary Event Listeners
                </xsl:if>
                <xsl:if test="$typeValue = 'SoundPlaying'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //SoundPlaying - condition
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'SourisBouton'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //SourisBouton - condition
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'LayerVisible'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //LayerVisible - condition
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'KeyFromTextPressed'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //KeyFromTextPressed - condition
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::IsMobile'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //SystemInfo::IsMobile - condition
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        }
                    };
                </xsl:if>
                
                <xsl:if test="$typeValue = 'Timer'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:value-of select="$eventAsString" disable-output-escaping="yes" />
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //A:
                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                            <!--
                        public void process() {
                            if(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                            <xsl:for-each select="../actions" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:for-each>
                            -->
                            
                <xsl:for-each select="../../events" >

                <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = globals.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                </xsl:for-each>
                
                </xsl:for-each>

                        //Timer - condition
                        private final Runnable runnable = new Runnable() {
                        
                            public void run() {
                                try {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    if(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                        <xsl:value-of select="$actionsWithIndexes" disable-output-escaping="yes" />
                                    }
                
                                } catch(Exception e) {
                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().EXCEPTION, e));
                                }
                            }
                        };
                        
                        @Override
                        public void process() {
                            if(!globals.gdRunnableList.contains(this.runnable)) {
                                globals.gdRunnableList.add(this.runnable);
                            } else {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, StringUtil.getInstance().EMPTY_STRING, new Exception()));
                            }
                        }

                        @Override
                        public void processReleased() {
                            if(globals.gdRunnableList.contains(this.runnable)) {
                                globals.gdRunnableList.remove(this.runnable);
                            } else {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, StringUtil.getInstance().EMPTY_STRING, new Exception()));
                            }
                        }

                        <xsl:value-of select="$eventsCreateProcessUsed" disable-output-escaping="yes" />

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'PosX'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                        private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //PosX - condition
                        @Override
                        public void process() {
                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = globals.<xsl:value-of select="$gdObjectName" />List.size();
                            GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$gdObjectName" /><xsl:text> = (GDObject) globals.</xsl:text><xsl:value-of select="$gdObjectName" />List.get(index);

                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:for-each select="parameters" ><xsl:if test="position() = 3" > + </xsl:if><xsl:if test="position() != 2" >"<xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >.x</xsl:if><xsl:if test="position() != 2" >" + </xsl:if><xsl:if test="position() != 2" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >.x</xsl:if></xsl:for-each>));
                                if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.x</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObjectPos" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />List</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                //}
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString()));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                        private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //PosY - condition
                        @Override
                        public void process() {

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = globals.<xsl:value-of select="$gdObjectName" />List.size();
                            GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$gdObjectName" /><xsl:text> = (GDObject) globals.</xsl:text><xsl:value-of select="$gdObjectName" />List.get(index);
                                
                                if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.y</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObjectPos" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />List</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                //}
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString()));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                    
                        @Override
                        public void process() {

                            final StringBuilder stringBuilder = new StringBuilder();
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if></xsl:for-each>: ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if></xsl:for-each>).toString()));

                            if(<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {

                                stringBuilder.delete(0, stringBuilder.length());
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>").toString()));
                                //NbObjet - condition - 2
                                <xsl:for-each select=".." >
                                    <xsl:call-template name="actionIds" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="caller" >NbObjet</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                        //VarObjet - condition
                        @Override
                        public void process() {

                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = globals.<xsl:value-of select="$gdObjectName" />List.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                if(this.process((GDObject) globals.<xsl:value-of select="$gdObjectName" />List.get(index))) {
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObject" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />List</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                }
                            }
                        }

                        @Override
                        public boolean process(final GDObject <xsl:value-of select="$gdObjectName" />) {
                            //VarObjet
                            if(<xsl:for-each select="parameters" ><xsl:if test="text() = 'rotation'" >.</xsl:if><xsl:if test="position() != 1 and  text() != 'rotation'" ><xsl:text> </xsl:text></xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if></xsl:for-each>) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "VarObjet processing"));
                                return true;
                            }
                            return false;
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />: ";
                        <xsl:text>&#10;</xsl:text>

                        //D:
                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                        //VarScene - condition
                        @Override
                        public void process() {

                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>));
                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.</xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "VarScene processing"));
                                <xsl:for-each select=".." >
                                    
                <xsl:variable name="thisNodeArray" >this</xsl:variable>

                <xsl:call-template name="actionsWithIndexes" >
                    <xsl:with-param name="caller" >VarScene</xsl:with-param>
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
                                    
                                    <!--
                                    <xsl:call-template name="actionIds" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="caller" >VarScene</xsl:with-param>
                                    </xsl:call-template>
                                    -->
                                </xsl:for-each>
                            }

                        }

                    };
                </xsl:if>                
                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {
                                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //SourisSurObjet - condition
                        @Override
                        public void process(final MotionGestureEvent motionGestureEvent) {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                            if(globals.<xsl:value-of select="text()" />Rectangle != null) {
                            
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "globals.<xsl:value-of select="text()" />Rectangle - Not Null"));
                                final GPoint point = motionGestureEvent.getCurrentPoint();
                                final GPoint rectangePoint = globals.<xsl:value-of select="text()" />Rectangle.getPoint();
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "globals.<xsl:value-of select="text()" />Rectangle - motionGestureEvent: " + motionGestureEvent.toString()));
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "globals.<xsl:value-of select="text()" />Rectangle: " + globals.<xsl:value-of select="text()" />Rectangle.toString()));
                                if (RectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY(), globals.<xsl:value-of select="text()" />Rectangle.getMaxX(), globals.<xsl:value-of select="text()" />Rectangle.getMaxY(),
                                    point.getX(), point.getY()))
                                {
                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "Inside"));
                                    final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                                    if (motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED) {
                                        <xsl:for-each select="../../actions" >
                                        //Action - process - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:for-each> 
                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment'" >
                                        //Events - process - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:for-each> 
                                    } else {
                                        <xsl:for-each select="../../actions" >
                                        //Action - process - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:for-each>    
                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment'" >
                                        //Events - process - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:for-each> 
                                    }
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "globals.<xsl:value-of select="text()" />Rectangle - Null"));
                            }
                                    </xsl:if>
                                </xsl:for-each>
                        }                                
                    };
                </xsl:if>
                
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>

                    //Action - process - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {
                                    
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                        private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains($actionWithTextObjectString, 'found')" >
                    <xsl:if test="$typeValue = 'TextObject::String'" >
                        //TextObject::String - START
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            //Parameters - 2
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" />TextAnimation</xsl:if>
                                <xsl:if test="position() = 2" ><xsl:if test="text() = '='" >.setText(</xsl:if></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if>
                                <xsl:if test="position() = last()" >);</xsl:if>
                            </xsl:for-each>
                        }
                        //TextObject::String - END
                    </xsl:if>
                    
                </xsl:if>

                <xsl:if test="$typeValue = 'SceneBackground'" >
                    //SceneBackground - Handled in Midlet
                </xsl:if>
                <xsl:if test="$typeValue = 'HideLayer'" >
                    //HideLayer
                    @Override
                    public void process() {
                       LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PlaySound'" >
                    //PlaySound
                    @Override
                    public void process() {
                       LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'StopSoundCanal'" >
                    //StopSoundCanal
                    @Override
                    public void process() {
                       LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'ResetTimer'" >
                    //ResetTimer
                    @Override
                    public void process() {
                       LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'Opacity'" >
                    //Opacity
                    @Override
                    public void process() {
                       LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    }
                </xsl:if>                
                <xsl:if test="$typeValue = 'Create'" >
                    
                    //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                    //Create - GDObject with TextObject::String - START
                    @Override
                    public void process() {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    }
                    //Create - GDObject with TextObject::String - END
                        </xsl:if>
                        
                        <xsl:if test="not(contains($actionWithTextObjectString, $param))" >
                    //Create
                    @Override
                    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "Not Null"));
                        return this.process(index);
                    }

                    public boolean process(final int index) throws Exception {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                        
                    <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            final StringBuilder stringBuilder = new StringBuilder();
                            final GDObject <xsl:value-of select="text()" /> = (GDObject) globals.<xsl:value-of select="text()" />List.get(index);
                            stringBuilder.delete(0, stringBuilder.length());
                            final GDGameLayer <xsl:value-of select="text()" />GDGameLayer = globals.<xsl:value-of select="text()" />GDGameLayerFactory.create(stringBuilder.append(globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), <xsl:value-of select="text()" />, globals.<xsl:value-of select="text()" />GDConditionCollidableBehavior);
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /> for globals.<xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer); at: " + index));
                            globals.<xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>
                        return false;
                    }
                        </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //SetAngle
                    @Override
                    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    //Hack method 1st param or list - 2
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(0)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index));</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                         return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //ChangePlan
                    @Override
                    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {
                        
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                        return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'Create'" >
                    <xsl:if test="not(contains($actionWithTextObjectString, $param))" >
                    //Create End
                    @Override
                    public void processEnd(final int index) throws Exception {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().INSERT));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:variable name="layerName" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="gameLayer" ><xsl:value-of select="text()" />GDGameLayer</xsl:variable>

                            final GDGameLayer <xsl:value-of select="$gameLayer" /> = (GDGameLayer) globals.<xsl:value-of select="$gameLayer" />List.get(index);
                            
                            if(<xsl:value-of select="$gameLayer" /> != null) {
                                <xsl:value-of select="$gameLayer" />.updateGDObject(globals.timeDelta);
                                
                                allBinaryGameLayerManager.insert(<xsl:value-of select="$gameLayer" />);

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
                                                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /> for globals.<xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />); at: " + index));
                                                        globals.<xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />);
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>

                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                //objectsGroupsGDGameLayer - END

                            } else {
                                final String message = "<xsl:value-of select="$gameLayer" /> warning: not initialized";
                                LogUtil.put(LogFactory.getInstance(message, this, message));
                            }

                        </xsl:if>
                    </xsl:for-each>
                    }
                    </xsl:if>
                </xsl:if>

                                <xsl:if test="$typeValue = 'Scene'" >

                        //Scene
                        @Override
                        public void process() {
                            <xsl:if test="$typeValue = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            final String TEXT = <xsl:value-of select="text()" />;
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                ((GDGameMIDlet) MIDletBridge.getCurrentMIDlet()).setGDLayout(TEXT);

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue != 'Scene' and $typeValue != 'MettreX' and $typeValue != 'MettreY' and $typeValue != 'SceneBackground' and $typeValue != 'Rotate'" >

                                </xsl:if>

                                <xsl:if test="$typeValue = 'MettreX'" >

                        //MettreX
                        /*
                        @Override
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);
                                this.process((GDObject) globals.<xsl:value-of select="$gdObjectName" />List.get(index));
                                gameLayer.updateGDObject(globals.timeDelta);
                            }
                        }
                        */

                        @Override
                        public boolean process(final GDObject gdObject) {
                            this.processG(gdObject, globals.graphics);
                            return true;
                        }

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        @Override
                        public void processG(final GDObject gdObject, final Graphics graphics) {

                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));

                                <xsl:for-each select="parameters" >
                                <xsl:value-of select="text()" /><xsl:if test="position() = 1" >.x</xsl:if>
                                </xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                globals.<xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(globals.graphics), <xsl:value-of select="$name" />.Height(globals.graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreY'" >

                        //MettreY
                        @Override
                        public boolean process(final GDObject gdObject) {
                            this.processG(gdObject, globals.graphics);
                            return true;
                        }

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        @Override
                        public void processG(final GDObject gdObject, final Graphics graphics) {


                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));

                                <xsl:for-each select="parameters" >
                                <xsl:value-of select="text()" /><xsl:if test="position() = 1" >.y</xsl:if>
                                </xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                globals.<xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />2.x, <xsl:value-of select="$name" />2.y),
                                    <xsl:value-of select="$name" />2.Width(globals.graphics), <xsl:value-of select="$name" />2.Height(globals.graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreXY'" >

                        //MettreXY
                        @Override
                        public boolean process(final GDObject gdObject) {
                            this.processG(gdObject, globals.graphics);
                            return true;
                        }

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        @Override
                        public void processG(final GDObject gdObject, final Graphics graphics) {


                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if><xsl:if test="position() = 2 or position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if><xsl:if test="position() > 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                globals.<xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />2.x, <xsl:value-of select="$name" />2.y),
                                    <xsl:value-of select="$name" />2.Width(globals.graphics), <xsl:value-of select="$name" />2.Height(globals.graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'UnPauseTimer'" >

                        //UnPauseTimer - process
                        @Override
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 2" >globals.<xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if>
                                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'SetAngle'" >
                        //SetAngle
                        @Override
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                final int size = globals.<xsl:value-of select="$gameLayerName" />List.size();
                    <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //Hack method 1st param or list - 3
                                    ((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(0)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index));<xsl:text>&#10;</xsl:text>
                                }
                            </xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ChangePlan'" >

                        //ChangePlan
                        @Override
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" >((GDObject) globals.<xsl:value-of select="text()" />List.get(index)).zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ModVarScene'" >

                        //ModVarScene
                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'angle')" >
                        //Update angle with rotation
                        </xsl:if>
                    </xsl:for-each>
                        @Override
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:variable name="player" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), 'player')" >player</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($player, 'player')" >
                    //Hack player player logging
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    </xsl:if>

                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'player.')" >
                                //Hack FIX ME for GDevelop player
                                final GDObject player = (GDObject) globals.playerList.get(0);
                                final GDGameLayer playerGDGameLayer = ((GDGameLayer) globals.playerGDGameLayerList.get(0));
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="text() = 'player_life'" >
                                //Hack GDevelop - player_life<xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                        //Parameters
                    <xsl:for-each select="parameters" >
                        <xsl:variable name="textValue" ><xsl:value-of select="text()" /></xsl:variable>
                        <xsl:variable name="textValue3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >player_</xsl:with-param><xsl:with-param name="replacementText" >globals.player_</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:if test="position() = 1" >globals.</xsl:if><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >(</xsl:with-param><xsl:with-param name="replacementText" >(globals.</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >globals.</xsl:if><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textValue" /></xsl:with-param><xsl:with-param name="find" >Angle()</xsl:with-param><xsl:with-param name="replacementText" >Angle(playerGDGameLayer)</xsl:with-param></xsl:call-template><xsl:if test="$textValue = '+'" >=</xsl:if><xsl:if test="$textValue = '-'" >=</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >

                        //TextObject::ChangeColor
                        @Override
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            globals.<xsl:value-of select="text()" />TextAnimation.setBasicColor(new BasicColor(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >, "<xsl:value-of select="$typeValue" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'Delete'" >
                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "GD:" + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //Delete
                        @Override
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDObject <xsl:value-of select="$name" />) {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    //Parameters - 5
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            //<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text>
                                            
                                            globals.<xsl:value-of select="text()" />List.remove(<xsl:value-of select="text()" />GDGameLayer.gdObject);
                                            globals.<xsl:value-of select="text()" />GDGameLayerList.remove(<xsl:value-of select="text()" />GDGameLayer);
                                            allBinaryGameLayerManager.remove(<xsl:value-of select="text()" />GDGameLayer);
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'AddForceAL'" >

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //AddForceAL
                    @Override
                    public void process() {

                    try {
                
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));    

            <xsl:if test="../actions" >
                        //if(globals.<xsl:value-of select="$name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                        final int size = globals.<xsl:value-of select="$name" />GDGameLayerList.size();

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().INDEX_LABEL + index));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);

            <xsl:if test="../actions" >
                        }
                        } else {
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$name" />GDGameLayerList was null"));
                        }                
            </xsl:if>

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().PROCESS, e));
                    }

                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));    

            <xsl:if test="../actions" >
                        //if(globals.<xsl:value-of select="$name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {

                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().INDEX_LABEL + index));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
                            return true;

            <xsl:if test="../actions" >
                        } else {
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$name" />GDGameLayerList was null"));
                        }                
            </xsl:if>
                        return false;
                    }

                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "GD:" + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        @Override
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDObject <xsl:value-of select="$name" />) {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    //name=<xsl:value-of select="$name" />
                                    <xsl:text>&#10;</xsl:text>

                                    //Parameters - 6
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />GDGameLayer.AddForceUsingPolarCoordinates(</xsl:if>
                                        <xsl:if test="position() != 1 and position() != last()" >
                                            <xsl:variable name="paramText" select="text()" />

                                            <xsl:variable name="key" >
                                                <xsl:for-each select="/game/variables/value" >
                                                    <xsl:variable name="variable" >Variable(<xsl:value-of select="text()" />)</xsl:variable>
                                                    <xsl:if test="contains($paramText, $variable)" >
                                                        <xsl:value-of select="text()" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:variable>

                                            <xsl:if test="string-length($key) > 0" >
                                                //Text - 2
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        <xsl:value-of select="$paramText" />
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >Variable(<xsl:value-of select="$key" />)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" >Variable(<xsl:value-of select="$name" />.<xsl:value-of select="$key" />)</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="string-length($key) = 0" >
                                                //Text - 3
                                                <xsl:value-of select="$paramText" />
                                            </xsl:if>,<xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >
                                            //Text - 4
                                            <xsl:value-of select="text()" />);
                                        </xsl:if>
                                    </xsl:for-each>
                                    
                                    <!--
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 3" >

                                            <xsl:if test="contains(text(), 'Variable(')" >
                                                <xsl:variable name="end" >
                                                    <xsl:call-template name="string-replace-all" >
                                                        <xsl:with-param name="text" >
                                                            <xsl:value-of select="text()" />
                                                        </xsl:with-param>
                                                        <xsl:with-param name="find" >Variable(</xsl:with-param>
                                                        <xsl:with-param name="replacementText" >
                                                        </xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:variable>
                                            
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        //<xsl:value-of select="$end" /> = 0;
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" ></xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>

                                        </xsl:if>
                                    </xsl:for-each>
                                    -->
                                    
                                    <xsl:text>&#10;</xsl:text>
                                    <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.timeDelta);
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'Rotate'" >

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        @Override
                        public void process() {

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Timer
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //VarScene
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.process((GDObject) globals.<xsl:value-of select="$gdObjectName" />List.get(index));
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.process((GDObject) globals.<xsl:value-of select="$gdObjectName" />List.get(index));
        </xsl:if>
                                gameLayer.updateGDObject(globals.timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$gdObjectName" />GDGameLayerList was null"));
                            }
                        }

                        @Override
                        public void processReleased() {
                            LogUtil.put(LogFactory.getInstance(globals.PROCESS_RELEASE, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Timer
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //VarScene
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.processReleased((GDObject) globals.<xsl:value-of select="$gdObjectName" />List.get(index));
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.processReleased((GDObject) globals.<xsl:value-of select="$gdObjectName" />List.get(index));
        </xsl:if>
                                gameLayer.updateGDObject(globals.timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$gdObjectName" />GDGameLayerList was null"));
                            }
                        }

                        //Rotate
                        @Override
                        public boolean process(final GDObject <xsl:value-of select="$name" />) {
                        <xsl:if test="$name = 'player'" >
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            //Parameters - 3
                            <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotation = <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.angle += <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            return true;
                        }

                        @Override
                        public boolean processReleased(final GDObject <xsl:value-of select="$name" />) {
                        <xsl:if test="$name = 'player'" >
                            LogUtil.put(LogFactory.getInstance(globals.PROCESS_RELEASE, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.rotation = 0;</xsl:if></xsl:for-each>
                            return true;
                        }
                                </xsl:if>

                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="../events" >
                        //private final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                            </xsl:for-each>

                        <!--
                        ../events
                        -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:for-each select="../events" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                        //SourisSurObjet
                        @Override
                        public void process(final MotionGestureEvent motionGestureEvent) {
                        
                            //Conditions - START
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                            //SourisSurObjet
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                                </xsl:if>
                            </xsl:for-each>
                            //Conditions - END
                        
                        }
                        </xsl:if>

                    };
            </xsl:for-each>

            <xsl:if test="type = 'BuiltinCommonInstructions::Comment'" >
            //Do not create GDNode for comment event type
            </xsl:if>
            <xsl:if test="type != 'BuiltinCommonInstructions::Comment'" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                </xsl:for-each>

                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                //private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "C: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "C: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>

            <xsl:variable name="foundTimerCondition" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value = 'Timer'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="foundOtherCondition" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value != 'Timer' and type/value != 'CollisionNP' and type/value != 'VarObjet' and type/value = 'NbObjet' and type/value = 'DepartScene' and type/value = 'SourisSurObjet' and type/value = 'MouseButtonReleased'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>
                                
                <xsl:if test="contains($foundTimerCondition, 'found')" >
                //Found used conditions so calling them before actions.
                @Override
                public void process() {
                    
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select="conditions" >
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:for-each>
                }

                @Override
                public void processReleased() {
                
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select="conditions" >
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                    </xsl:for-each>
                }
                
                </xsl:if>

                <xsl:if test="contains($foundOtherCondition, 'found')" >
                //Found conditions that need processing.
                @Override
                public void process() {
                    
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select="conditions" >
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:for-each>
                }
                </xsl:if>

                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >

                <xsl:if test="actions" >
                //No used conditions so calling actions from event directly.
                <xsl:call-template name="actionsWithIndexesProcess" >
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
                </xsl:if>
                                
                <xsl:if test="not(conditions)" >
                <xsl:if test="not(actions)" >
                //Events only - No actions or conditions
                @Override
                public void process() {
                
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                <xsl:for-each select="events" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <!-- Event nodeId=N75237 - 9701 position=12 totalRecursions=1 type=BuiltinCommonInstructions::Standard disable=false -->
                        <!-- //childEventWithUsedEvent - START -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="string-length($childEventWithUsedEvent) > 0" >
                        //childEventWithUsedEvent=<xsl:value-of select="$childEventWithUsedEvent" />
                        </xsl:if>
                        <!-- //childEventWithUsedEvent - END -->
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //BuiltinCommonInstructions::Standard - Used condition in children - 1
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>                        
                        <xsl:if test="contains($childEventWithUsedEvent, 'foundCreateAction')" >
                            //N78034 - 12498
                    //BuiltinCommonInstructions::Standard - Used condition in children - 3
                    //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <xsl:call-template name="childEventWithUsedEvent2" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                                
                }
                
                @Override
                public void process(final MotionGestureEvent motionGestureEvent) {
                <xsl:for-each select="events" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        //<xsl:value-of select="$childEventWithUsedEvent" />
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //BuiltinCommonInstructions::Standard - Used condition in children - 2
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                        </xsl:if>                  
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                }
                </xsl:if>
                </xsl:if>
                
                </xsl:if>
                </xsl:if>

            };
            </xsl:if>

            <xsl:call-template name="objectGDObjectGNodes" >
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="parametersAsString" >
                    <xsl:value-of select="$parametersAsString" />
                </xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="eventsCreateAssignGDObject" >
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

            </xsl:call-template>
        </xsl:for-each>
        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - END

    </xsl:template>

    <xsl:template name="objectGDObjectGNodes" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        //objectGDObjectGNodes - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:variable name="params" >
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:variable>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" />,</xsl:variable>
                        <xsl:variable name="before" select="substring-before(substring-before($parametersAsString, $name), $colonName)" />
                        <xsl:variable name="actionNodeIdFromRelatedParams" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" select="$before" /><xsl:with-param name="char" select="','" /></xsl:call-template></xsl:variable>
                        //name=<xsl:value-of select="name" />
                        //parametersAsString=<xsl:value-of select="$parametersAsString" />
                        //before=<xsl:value-of select="$before" />
                        //actionNodeIdFromRelatedParams=<xsl:value-of select="$actionNodeIdFromRelatedParams" />
                        <xsl:variable name="beforeColon" select="substring-before($parametersAsString, ':')" />
                        <xsl:variable name="actionNodeId" ><xsl:if test="$actionNodeIdFromRelatedParams != ''" ><xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if><xsl:if test="$actionNodeIdFromRelatedParams = ''" ><xsl:value-of select="$beforeColon" /></xsl:if></xsl:variable>
                        //actionNodeId=<xsl:value-of select="$actionNodeId" />

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //objectGDObjectAtIndex2 - collide - Sprite - <xsl:value-of select="$name" />
                        if(globals.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        globals.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode() {

                            private final String ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Action - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                            
                            @Override
                            public void process() {
                                this.process(null, null, null, null);
                            }

                            @Override
                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                this.process(null, null, gdNode, gdNodeList);
                            }

                            private final String ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;

                            //objectGDObjectAtIndex2 - collide - Sprite - <xsl:value-of select="$name" />
                            @Override
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {
                                
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />));
                                
                        //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*<xsl:value-of select="$params" />*/
                                    final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                    if(indexOfGDNode == 1) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gdGameLayer, null, gdNode, gdNodeList);
                                    } else if(indexOfGDNode == 2) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gameLayer, gdGameLayer, gdNode, gdNodeList);
                                    }
                                    </xsl:if>
                                }
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                            if(indexOfGDNode == 1) {
                                ((GDNode) gdNodeList.get(indexOfGDNode)).process(null, null, gdNode, gdNodeList);
                            } else if(indexOfGDNode == 2) {
                                ((GDNode) gdNodeList.get(indexOfGDNode)).process(gameLayer, null, gdNode, gdNodeList);
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            }
                        };

                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //objectGDObjectAtIndex2 - collide - TextObject::Text - <xsl:value-of select="$name" />
                        if(globals.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        globals.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode() {

                            private final String ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Action - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                        
                            @Override
                            public void process() {
                                this.process(null, null, null, null);
                            }

                            @Override
                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                this.process(null, null, gdNode, gdNodeList);
                            }

                            private final String ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;

                            //objectGDObjectAtIndex2 - collide - TextObject::Text - <xsl:value-of select="$name" />
                            @Override
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />));

                        //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //globals.<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*<xsl:value-of select="$params" />*/
                                    final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                    if(indexOfGDNode == 1) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gdGameLayer, null, gdNode, gdNodeList);
                                    } else if(indexOfGDNode == 2) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gameLayer, gdGameLayer, gdNode, gdNodeList);
                                    }
                                    </xsl:if>
                                }
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                            if(indexOfGDNode == 1) {
                                ((GDNode) gdNodeList.get(indexOfGDNode)).process(null, null, gdNode, gdNodeList);
                            } else if(indexOfGDNode == 2) {
                                ((GDNode) gdNodeList.get(indexOfGDNode + 1)).process(gameLayer, null, gdNode, gdNodeList);
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            }
                        };

                            </xsl:if>
                        </xsl:if>
                        <xsl:variable name="name2" ><xsl:value-of select="name" />,</xsl:variable>
                        <xsl:if test="contains($parametersAsString, $name2)" >
                            <xsl:if test="not(contains($parametersAsString, $name) = text()) and name = 'player'" >
                        //Hack FIX ME for GDevelop player with GDNode - <xsl:value-of select="$name" />
                        if(globals.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        globals.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode() {

                            @Override
                            public void process() {
                                //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                                if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                                    if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                        this.process((CollidableCompositeLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0), null, null, null);
                                    }
                                }
                            }

                            @Override
                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                                if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                                    if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                        this.process((CollidableCompositeLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0), null, gdNode, gdNodeList);
                                    }
                                }
                            }

                            //Hack FIX ME for GDevelop player with GDNode - <xsl:value-of select="$name" />
                            @Override
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {
                                gdNode.process(gameLayer, gameLayer2, (CollidableCompositeLayer) null, gdNode, gdNodeList);
                            }
                        };

                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="paramIndexedArray" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>

</xsl:stylesheet>
