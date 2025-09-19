/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.game.layer;

import org.allbinary.graphics.GPoint;

/**
 *
 * @author User
 */
public interface SoftJoystickInterface {

    void setId(final int id);
    int getId();
    void setPoint(final GPoint point);
    GPoint getPoint();

    void setStickForceX(final float stickForceX);
    void setStickForceY(final float stickForceY);
    
    float StickForceX();
    float StickForceY();

}
