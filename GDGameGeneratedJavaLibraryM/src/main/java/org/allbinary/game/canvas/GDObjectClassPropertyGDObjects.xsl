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

    <xsl:template name="gdObject" >
        <xsl:param name="name" />
        <xsl:variable name="hasObjectInObjectsGroups" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        <xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" ><xsl:value-of select="$objectsGroupsName" /></xsl:if></xsl:for-each></xsl:for-each><xsl:if test="not(contains($hasObjectInObjectsGroups, 'found'))" >GDObject</xsl:if>
    </xsl:template>
    
    <xsl:template name="objectsClassPropertyGDObjects" >

        //ObjectsGroups - GDObject
        <xsl:for-each select="/game/layouts/objectsGroups" >
        public class <xsl:value-of select="name" /> extends GDObject {
        
            public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name, final String type) {
                super(unknown, x, y, z, width, height, name, type);
            }

            <xsl:for-each select="objects" >
                <xsl:if test="position() = 1" >
                <xsl:variable name="objectName" select="name" />
                
            <xsl:for-each select="/game/layouts/objects" >
                <xsl:variable name="name" select="name" />

                    <xsl:if test="name = $objectName" >
                    <xsl:for-each select="variables" >
                    //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    public String <xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    public float <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE'))" >
                                public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                                public long <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                                //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                                public long <xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    public boolean <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    public boolean[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    public int[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'BoolArray'))" >
                    public String[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:if>

            </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

            public void reset() {
            
            <xsl:for-each select="objects" >
                <xsl:if test="position() = 1" >
                <xsl:variable name="objectName" select="name" />
                
            <xsl:for-each select="/game/layouts/objects" >
                <xsl:variable name="name" select="name" />

                    <xsl:if test="name = $objectName" >
                    <xsl:for-each select="variables" >
                    //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE'))" >
                                this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                                this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                                //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                                this.<xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = new boolean[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = new int[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'BoolArray'))" >
                    public String[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:if>

            </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

            }
        }
        </xsl:for-each>
        
        //objectsClassPropertyGDObjects - START
        <xsl:for-each select="objects" >

            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />

            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap' or $typeValue = 'Sprite' or $typeValue = 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //animations/directions/sprites/originPoint/x <xsl:value-of select="animations/directions/sprites/originPoint/x" />
                //animations/directions/sprites/originPoint/y <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                public final class <xsl:value-of select="name" /> extends <xsl:call-template name="gdObject" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template> {

                    <xsl:variable name="hasObjectInObjectsGroups" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:variable name="objectsGroupsName" select="name" /><xsl:for-each select="objects" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                    <xsl:if test="not(contains($hasObjectInObjectsGroups, 'found'))" >

                    <xsl:for-each select="variables" >
                    //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    public String <xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    public float <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE'))" >
                                public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                                public long <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                                //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                                public long <xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    public boolean <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    public boolean[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    public int[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'BoolArray'))" >
                    public String[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>

                    public void reset() {
                    <xsl:for-each select="variables" >
                    //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE'))" >
                                this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                                this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                                //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                                this.<xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = new boolean[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = new int[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'BoolArray'))" >
                    this.<xsl:value-of select="name" /> = new String[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    }
                    </xsl:if>

                <xsl:if test="animations" >
                public final String[] ANIMATION_NAMES = {
                <xsl:for-each select="animations" >
                    <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(name, '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="string-length($animationName) > 0" >
                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$animationName" />,
                    </xsl:if>
                </xsl:for-each>
                };
                </xsl:if>

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        super(unknown, x, y, z, width, height, name, <xsl:if test="string-length(type) = 0" >null</xsl:if><xsl:if test="string-length(type) > 0" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(type, ':', '_')" /></xsl:with-param></xsl:call-template></xsl:if>);
                        
                    <xsl:if test="contains($hasObjectInObjectsGroups, 'found')" >
                    <xsl:for-each select="variables" >
                    //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    this.<xsl:value-of select="name" /> = <xsl:if test="string-length(value) > 0" ><xsl:value-of select="value" /></xsl:if><xsl:if test="string-length(value) = 0" >stringUtil.EMPTY_STRING</xsl:if>;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'number'" >
                            <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE'))" >
                                this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                <xsl:if test="value != '9223372036854776000'" >
                                this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="value = '9223372036854776000'" >
                                //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                                this.<xsl:value-of select="name" /> = 9223372036854775807L;
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="type = 'boolean'" >
                    this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                        </xsl:if>
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'BoolArray'))" >
                    this.<xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:if>
                        
                    }

                    <xsl:if test="animations" >
                    public String getAnimation(final String animationName) {
                        final int size = ANIMATION_NAMES.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            if(this.ANIMATION_NAMES[index].compareTo(animationName) == 0) {
                                //LogUtil.put(LogFactory.getInstance(animationName, this, "getAnimation"));
                                return this.ANIMATION_NAMES[index];
                            }
                        }
                        throw new RuntimeException();
                    }
                    
                    public boolean setAnimation(final String animationName) {
                        final int size = ANIMATION_NAMES.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            if(this.ANIMATION_NAMES[index] == animationName) {
                                //LogUtil.put(LogFactory.getInstance(animationName, this, "setAnimation"));
                                if(this.animation != index) {
                                    this.animation = index;
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        }
                        return false;
                    }
                    </xsl:if>
                    
                    <xsl:if test="animations/directions/sprites/originPoint/x = 0 and animations/directions/sprites/originPoint/y = 0" >
<!--                
                    public int Width(final Graphics graphics) {
                        return canvasWidth;
                    }
    
                    public int Height(final Graphics graphics) {
                        return canvasHeight;
                    }
-->
                    </xsl:if>
                    
                    <!--
                        <xsl:if test="name = 'player'" >
                        //Hackish FIX ME for GDevelop player1

                    public short Angle(final GDGameLayer gameLayer) {

                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append(globals.name).append(objectStrings.ANGLE).append(angle).toString(), this, "before"));
                        
                        int adjustedAngle = gameLayer.getRotationAnimationInterface().getAngleInfo().getAngle() - 270;
                        //int adjustedAngle = angle;
                        while(adjustedAngle <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 359) { adjustedAngle -= 360; }
                        while(adjustedAngle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0) { adjustedAngle += 360; }
                        this.angle = (short) adjustedAngle;

                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append(globals.name).append(objectStrings.ANGLE).append(angle).toString(), this, "after"));

                        return this.angle;
                    }
                        </xsl:if>
                    -->
                    
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(unknown, x, y, z, width, height, name);
                    }

                };    

            </xsl:if>
            <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />

                //ParticleSystem::ParticleEmitter - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {
                    
                    public final StringMaker stringMaker = new StringMaker();

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        super(unknown, x, y, z, width, height, name, null);
                    }

                    public int Width(final Graphics graphics) {
                        return 0;
                    }

                    public int Height(final Graphics graphics) {
                        return 0;
                    }
                    
                    public String String() {
                        return stringMaker.toString();
                    }
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(unknown, x, y, z, width, height, name);
                    }

                };    

            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                
                //TextObject::Text - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        super(unknown, x, y, z, width, height, name, null);
                    }

                    public int Width(final Graphics graphics) {
                        return <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />TextAnimation.getWidth();
                    }

                    public int Height(final Graphics graphics) {
                        return <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />TextAnimationSize;
                    }
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(unknown, x, y, z, width, height, name);
                    }

                };    

            </xsl:if>
            <xsl:if test="$typeValue = 'TextInput::TextInputObject'" >
                <xsl:variable name="stringValue" select="string" />

                //TextInput::TextInputObject - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {
                    
                    public final StringMaker stringMaker = new StringMaker();

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        super(unknown, x, y, z, width, height, name, null);
                    }

                    public int Width(final Graphics graphics) {
                        return 0;
                    }

                    public int Height(final Graphics graphics) {
                        return 0;
                    }
                    
                    public String String() {
                        return stringMaker.toString();
                    }
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(unknown, x, y, z, width, height, name);
                    }

                };    

            </xsl:if>
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                //TextEntryObject::TextEntry - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {
                    
                    public final StringMaker stringMaker = new StringMaker();

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        super(unknown, x, y, z, width, height, name, null);
                    }

                    public int Width(final Graphics graphics) {
                        return 0;
                    }

                    public int Height(final Graphics graphics) {
                        return 0;
                    }
                    
                    public String String() {
                        return stringMaker.toString();
                    }
                };

                public final GDObjectFactory <xsl:value-of select="name" />GDObjectFactory = new GDObjectFactory() {

                    public GDObject get(final String unknown, final int x, final int y, final int z, final int width, final int height, final String name) {
                        return new <xsl:value-of select="name" />(unknown, x, y, z, width, height, name);
                    }

                };    

            </xsl:if>

        </xsl:for-each>

        //objectsClassPropertyGDObjects - END

    </xsl:template>

</xsl:stylesheet>
