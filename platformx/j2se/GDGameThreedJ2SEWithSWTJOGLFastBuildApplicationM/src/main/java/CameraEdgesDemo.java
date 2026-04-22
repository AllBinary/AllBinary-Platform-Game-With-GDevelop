
import java.nio.FloatBuffer;

import com.jogamp.opengl.GL2;
import com.jogamp.opengl.GLAutoDrawable;
import com.jogamp.opengl.GLCapabilities;
import com.jogamp.opengl.GLCapabilitiesImmutable;
import com.jogamp.opengl.GLEventListener;
import com.jogamp.opengl.GLProfile;
import com.jogamp.opengl.glu.GLU;
import com.jogamp.opengl.swt.GLCanvas;
import com.jogamp.opengl.util.Animator;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;
import javax.microedition.khronos.opengles.GL10;
import org.allbinary.opengles.GLUtil;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.opengl.GLData;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class CameraEdgesDemo implements GLEventListener {

    private GLU glu;
    private float cameraX = 5.0f, cameraY = 5.0f, cameraZ = 10.0f;

//    public final int PROPERTIES_PER_ELEMENT = 3;
//    public final int BYTES_PER_PROPERTY = 2;
//
//    private ShortBuffer shortBuffer;
//    private final int totalShorts;
    
    public CameraEdgesDemo() {

//        this.totalShorts = 252;
//        final ByteBuffer bb = ByteBuffer.allocateDirect(totalShorts * BYTES_PER_PROPERTY); 
//        bb.order(ByteOrder.nativeOrder());
//        this.shortBuffer = bb.asShortBuffer();
//        final short ZERO = 0;
//        final short TEN = 10;
//        final short NEG_TEN = -10;
//        for (short i = -10; i <= 10; i++) {
//
//            this.shortBuffer.put(i);
//            this.shortBuffer.put(ZERO);
//            this.shortBuffer.put(NEG_TEN);
//
//            this.shortBuffer.put(i);
//            this.shortBuffer.put(ZERO);
//            this.shortBuffer.put(TEN);
//            
//            this.shortBuffer.put(NEG_TEN);
//            this.shortBuffer.put(ZERO);
//            this.shortBuffer.put(i);
//
//            this.shortBuffer.put(TEN);
//            this.shortBuffer.put(ZERO);
//            this.shortBuffer.put(i);
//
//        }

        final Display display = new Display();
        Shell shell = new Shell(display);
        shell.setLayout(new FillLayout());
        Composite comp = new Composite(shell, SWT.NONE);
        comp.setLayout(new FillLayout());
        GLData data = new GLData();
        data.doubleBuffer = true;
        final GLCapabilitiesImmutable caps = new GLCapabilities(GLProfile.getDefault(GLProfile.getDefaultDevice()));
        final GLCanvas canvas = new GLCanvas(comp, SWT.NONE, caps, null);

        canvas.addGLEventListener(this);

        shell.setText("SWT/JOGL Example");
        shell.setSize(640, 480);
        shell.open();
        
        display.asyncExec(new Runnable() {

            public void run() {
                if (!canvas.isDisposed()) {
                    Animator animator = new Animator(canvas);
                    animator.start();
                }
            }
        });

        while (!shell.isDisposed()) {
            if (!display.readAndDispatch()) {
                display.sleep();
            }
        }
        display.dispose();
    }

    public void init(GLAutoDrawable drawable) {
        GL2 gl = drawable.getGL().getGL2();
        glu = new GLU();

        gl.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        gl.glEnable(GL2.GL_DEPTH_TEST);
    }

    public void reshape(GLAutoDrawable drawable, int x, int y, int width, int height) {
        GL2 gl = drawable.getGL().getGL2();
        if (height == 0) {
            height = 1;
        }
        float aspect = (float) width / height;

        gl.glViewport(0, 0, width, height);

        gl.glMatrixMode(GL2.GL_PROJECTION);
        gl.glLoadIdentity();
        glu.gluPerspective(45.0, aspect, 1.0, 100.0);

        gl.glMatrixMode(GL2.GL_MODELVIEW);
        gl.glLoadIdentity();
    }

    public void display(GLAutoDrawable drawable) {
        GL2 gl = drawable.getGL().getGL2();
        gl.glClear(GL2.GL_COLOR_BUFFER_BIT | GL2.GL_DEPTH_BUFFER_BIT);

        gl.glLoadIdentity();
        glu.gluLookAt(cameraX, cameraY, cameraZ, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

        // Draw the scene (a simple grid)
        drawGrid(gl);

        // Draw the camera's view frustum
        drawFrustum(gl);

        // Optional: Move camera for demonstration
        cameraX = (float) (10 * Math.sin(System.currentTimeMillis() / 2000.0));
        cameraZ = (float) (10 * Math.cos(System.currentTimeMillis() / 2000.0));
    }

    public void dispose(GLAutoDrawable drawable) {
    }

    private void drawGrid(GL2 gl) {
        
        gl.glPushMatrix();
        gl.glColor4f(0.5f, 0.5f, 0.5f, 1.0f);
        
        //gl.glEnable(GL10.GL_LINE_SMOOTH);
        //GLUtil.getInstance().position(shortBuffer, 0);
        //gl.glDrawElements(GL10.GL_LINES, this.totalShorts, GL10.GL_UNSIGNED_SHORT, this.shortBuffer);
        //gl.glDisable(GL10.GL_LINE_SMOOTH);
        //gl.glPopMatrix();
        
        gl.glBegin(GL2.GL_LINES);
        for (int i = -10; i <= 10; i++) {
            gl.glVertex3f(i, 0, -10);
            gl.glVertex3f(i, 0, 10);
            gl.glVertex3f(-10, 0, i);
            gl.glVertex3f(10, 0, i);
        }
        gl.glEnd();
        gl.glPopMatrix();
    }

    private void drawFrustum(GL2 gl) {
        gl.glPushMatrix();

        // Get the current modelview and projection matrices
        FloatBuffer modelview = FloatBuffer.allocate(16);
        FloatBuffer projection = FloatBuffer.allocate(16);
        gl.glGetFloatv(GL2.GL_MODELVIEW_MATRIX, modelview);
        gl.glGetFloatv(GL2.GL_PROJECTION_MATRIX, projection);

        // Concatenate and invert the matrix
        float[] mvpMatrix = new float[16];
        float[] invMatrix = new float[16];
        multiplyMatrix(projection.array(), modelview.array(), mvpMatrix);
        invertMatrix(mvpMatrix, invMatrix);

        // Define the 8 corners of the NDC cube (-1 to 1)
        float[] cubeCorners = {
            -1, -1, -1, 1, // Near-bottom-left
            1, -1, -1, 1, // Near-bottom-right
            1, 1, -1, 1, // Near-top-right
            -1, 1, -1, 1, // Near-top-left
            -1, -1, 1, 1, // Far-bottom-left
            1, -1, 1, 1, // Far-bottom-right
            1, 1, 1, 1, // Far-top-right
            -1, 1, 1, 1 // Far-top-left
        };

        // Transform the cube corners by the inverse matrix
        float[] frustumCorners = new float[32];
        for (int i = 0; i < 8; i++) {
            float[] transformed = transformVector(invMatrix, new float[]{
                cubeCorners[i * 4 + 0],
                cubeCorners[i * 4 + 1],
                cubeCorners[i * 4 + 2],
                cubeCorners[i * 4 + 3]
            });
            frustumCorners[i * 4 + 0] = transformed[0] / transformed[3];
            frustumCorners[i * 4 + 1] = transformed[1] / transformed[3];
            frustumCorners[i * 4 + 2] = transformed[2] / transformed[3];
        }

        // Draw the frustum edges
        gl.glColor3f(1.0f, 1.0f, 0.0f); // Yellow lines
        gl.glBegin(GL2.GL_LINES);

        // Near plane
        gl.glVertex3f(frustumCorners[0], frustumCorners[1], frustumCorners[2]);
        gl.glVertex3f(frustumCorners[4], frustumCorners[5], frustumCorners[6]);

        gl.glVertex3f(frustumCorners[4], frustumCorners[5], frustumCorners[6]);
        gl.glVertex3f(frustumCorners[8], frustumCorners[9], frustumCorners[10]);

        gl.glVertex3f(frustumCorners[8], frustumCorners[9], frustumCorners[10]);
        gl.glVertex3f(frustumCorners[12], frustumCorners[13], frustumCorners[14]);

        gl.glVertex3f(frustumCorners[12], frustumCorners[13], frustumCorners[14]);
        gl.glVertex3f(frustumCorners[0], frustumCorners[1], frustumCorners[2]);

        // Far plane
        gl.glVertex3f(frustumCorners[16], frustumCorners[17], frustumCorners[18]);
        gl.glVertex3f(frustumCorners[20], frustumCorners[21], frustumCorners[22]);

        gl.glVertex3f(frustumCorners[20], frustumCorners[21], frustumCorners[22]);
        gl.glVertex3f(frustumCorners[24], frustumCorners[25], frustumCorners[26]);

        gl.glVertex3f(frustumCorners[24], frustumCorners[25], frustumCorners[26]);
        gl.glVertex3f(frustumCorners[28], frustumCorners[29], frustumCorners[30]);

        gl.glVertex3f(frustumCorners[28], frustumCorners[29], frustumCorners[30]);
        gl.glVertex3f(frustumCorners[16], frustumCorners[17], frustumCorners[18]);

        // Connecting lines
        gl.glVertex3f(frustumCorners[0], frustumCorners[1], frustumCorners[2]);
        gl.glVertex3f(frustumCorners[16], frustumCorners[17], frustumCorners[18]);

        gl.glVertex3f(frustumCorners[4], frustumCorners[5], frustumCorners[6]);
        gl.glVertex3f(frustumCorners[20], frustumCorners[21], frustumCorners[22]);

        gl.glVertex3f(frustumCorners[8], frustumCorners[9], frustumCorners[10]);
        gl.glVertex3f(frustumCorners[24], frustumCorners[25], frustumCorners[26]);

        gl.glVertex3f(frustumCorners[12], frustumCorners[13], frustumCorners[14]);
        gl.glVertex3f(frustumCorners[28], frustumCorners[29], frustumCorners[30]);

        gl.glEnd();
        gl.glPopMatrix();
    }

    private void multiplyMatrix(float[] a, float[] b, float[] result) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                float sum = 0.0f;
                for (int k = 0; k < 4; k++) {
                    sum += a[i * 4 + k] * b[k * 4 + j];
                }
                result[i * 4 + j] = sum;
            }
        }
    }

    private void invertMatrix(float[] m, float[] invOut) {
        // Implementation of a 4x4 matrix inverse.
        // For simplicity, a standard linear algebra library like Joml or Jglm is
        // recommended in a real-world application.
        // This is a basic implementation and does not handle singular matrices.
        double[] inv = new double[16];
        double[] mat = new double[16];
        for (int i = 0; i < 16; i++) {
            mat[i] = m[i];
        }

        // ... (complex matrix inversion logic) ...
        // Placeholder for inversion logic
        // For actual implementation, see resources like Mesa's source code or graphics programming tutorials.
        // Example: Assume a simplified case and return identity
        for (int i = 0; i < 16; i++) {
            invOut[i] = (i % 5 == 0) ? 1.0f : 0.0f;
        }
    }

    private float[] transformVector(float[] m, float[] v) {
        float[] result = new float[4];
        result[0] = m[0] * v[0] + m[4] * v[1] + m[8] * v[2] + m[12] * v[3];
        result[1] = m[1] * v[0] + m[5] * v[1] + m[9] * v[2] + m[13] * v[3];
        result[2] = m[2] * v[0] + m[6] * v[1] + m[10] * v[2] + m[14] * v[3];
        result[3] = m[3] * v[0] + m[7] * v[1] + m[11] * v[2] + m[15] * v[3];
        return result;
    }

    public static void main(String[] args) {
        new CameraEdgesDemo();
    }
}
